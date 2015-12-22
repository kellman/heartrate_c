// Extract heart rate from RGB signals
// Michael Kellman (Group 2)
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#include "JnS-1.2/JnS.h"
#include "JnS-1.2/Matutil.h"
#include "filtering.c"
#include "kiss_fft130/kiss_fft.h"

using namespace std;

// Structure to return all possible heart rate from all source signals and best guess of heart rate.
struct Results
{
  double max1;
  double max2;
  double max3;
  double winner;
};

/* Takes in 3 vectors (RGB signals), the number of discrete samples (each vector must be of equal length)
  and fs (the frame rate)

  Returns the Results structure

*/
Results extractHR(float* rsig, float* gsig, float* bsig, int nbsamples, double fs){
  kiss_fft_cpx * ci1;
  kiss_fft_cpx * ci2;
  kiss_fft_cpx * ci3;
  kiss_fft_cpx * co1;
  kiss_fft_cpx * co2;
  kiss_fft_cpx * co3;

  int nbytes = sizeof(kiss_fft_cpx);
  int nbsensors = 3; 
  
  double *Data;
  double *DataT;
  double *Transf; 
  double *Output; 
  if ((DataT = (double *) calloc(nbsensors*nbsamples, sizeof(double))) == NULL) OutOfMemory() ;
  if ((Data = (double *) calloc(nbsensors*nbsamples, sizeof(double))) == NULL) OutOfMemory() ;
  if ((Transf = (double *) calloc(nbsensors*nbsamples, sizeof(double))) == NULL) OutOfMemory() ;
  if ((Output = (double *) calloc(nbsensors*nbsamples, sizeof(double))) == NULL) OutOfMemory() ;

  int i,j;
  FILE* f1;
  FILE* f2;
  FILE* f3;

  // places vectors in a columnwise matrix
  for(i=0, j=0; j<nbsamples; i+=nbsensors, j++){
    Data[i] = (double)rsig[j];
    Data[i+1] = (double)gsig[j];
    Data[i+2] = (double)bsig[j];
    DataT[i] = (double)rsig[j];
    DataT[i+1] = (double)gsig[j];
    DataT[i+2] = (double)bsig[j];
  }

  // mean substraction
  MeanRemoval(DataT,nbsensors,nbsamples);
  MeanRemoval(Data,nbsensors,nbsamples);

  // ICA (JadeR)
  Jade(Transf, Data,nbsensors,nbsamples); 

  // Look at transform
  PrintMat(Transf, nbsensors, nbsensors);
 
  // Apply the transform
  Transform(DataT,Transf,nbsensors,nbsamples);
  
  // Prepare to take FFT of unmixed signals
  kiss_fft_cfg cfg = kiss_fft_alloc(nbsamples,0 ,NULL,NULL );

  ci1=(kiss_fft_cpx*)KISS_FFT_MALLOC(nbsamples*nbytes);
  ci2=(kiss_fft_cpx*)KISS_FFT_MALLOC(nbsamples*nbytes);
  ci3=(kiss_fft_cpx*)KISS_FFT_MALLOC(nbsamples*nbytes);
  co1=(kiss_fft_cpx*)KISS_FFT_MALLOC(nbsamples*nbytes);
  co2=(kiss_fft_cpx*)KISS_FFT_MALLOC(nbsamples*nbytes);
  co3=(kiss_fft_cpx*)KISS_FFT_MALLOC(nbsamples*nbytes);

  memset(co1,0,nbytes);
  memset(co2,0,nbytes);
  memset(co3,0,nbytes);

  f3 = fopen("unmixed_time.txt","w");
  for (i = 0, j=0; j < nbsamples; j++,i+=nbsensors){
      ci1[j].r = (float)DataT[i];
      ci2[j].r = (float)DataT[i+1];
      ci3[j].r = (float)DataT[i+2];

      fprintf(f3,"%f %f %f\n", ci1[j].r, ci2[j].r, ci3[j].r);
      
      ci1[j].i = 0;
      ci2[j].i = 0;
      ci3[j].i = 0;
  }   
  fclose(f3);


  // take FFT with preset cfg struct
  kiss_fft(cfg ,ci1 ,co1);
  kiss_fft(cfg ,ci2 ,co2);
  kiss_fft(cfg ,ci3 ,co3);

  f1 = fopen("unmixed_spec.txt","w");
  
  for (j = 0; j < nbsamples; j++){
      fprintf(f1, "%f %f %f\n",sqrt(co1[j].r*co1[j].r  + co1[j].i*co1[j].i),sqrt(co2[j].r*co2[j].r  + co2[j].i*co2[j].i),sqrt(co3[j].r*co3[j].r  + co3[j].i*co3[j].i));
  }
  fclose(f1);

  // makes estimate of which unmixed source signal contains the heart rate signal.
  // Below is an algorithm which finds the maximum peak of each of the 3 source signals
  // between 45 and 200 bpm and then makes a final decision by selecting the heart rate
  // associated with the maximum peak between the maximum peaks from the 3 source signals.

  double* freqs;
  double temp;

  int lower, upper;
  double ml,mu;
  if ((freqs = (double *) calloc(nbsamples, sizeof(double))) == NULL) OutOfMemory() ;
  for(i = 0;i<nbsamples/2;i++){

    temp = (double)i/(double)(nbsamples/2);
    freqs[i] = (double)60*temp*((double)fs/2);

    if (freqs[i] <= 45) lower = i;
    if (freqs[i] <= 200) upper = i;

  }
  printf("45 index: %d, value: %f\n",lower,freqs[lower]);
  printf("200 index: %d, value: %f\n",upper,freqs[upper]);

  double m1,m2,m3;
  m1 = 0; m2 = 0; m3 = 0;
  int i1,i2,i3;
  i1 = 0; i2 = 0; i3 = 0;
  for(i = lower; i<upper; i++){
    if(m1 < sqrt(co1[i].r*co1[i].r  + co1[i].i*co1[i].i)){
      m1 = sqrt(co1[i].r*co1[i].r  + co1[i].i*co1[i].i);
      i1 = i;
    }
    if(m2 < sqrt(co2[i].r*co2[i].r  + co2[i].i*co2[i].i)){
      m2 = sqrt(co2[i].r*co2[i].r  + co2[i].i*co2[i].i);
      i2 = i;
    }    
    if(m3 < sqrt(co3[i].r*co3[i].r  + co3[i].i*co3[i].i)){
      m3 = sqrt(co3[i].r*co3[i].r  + co3[i].i*co3[i].i);
      i3 = i;
    }
  }
  printf("signal 1 max at %d, with value %f, corresponding to %f bpm\n",i1,m1,freqs[i1]);
  printf("signal 2 max at %d, with value %f, corresponding to %f bpm\n",i2,m2,freqs[i2]);
  printf("signal 3 max at %d, with value %f, corresponding to %f bpm\n",i3,m3,freqs[i3]);

  double mdec = 0; 
  int idec; // this can be 1, 2, or 3 
  for(i = 0; i < nbsensors; i++){
    switch(i){
      case(0): temp = m1;break;
      case(1): temp = m2;break;
      case(2): temp = m3;break;
    }
    // printf("%f\n",temp);
    if (temp > mdec){
      mdec = temp; 
      idec = i;
    }
  }


  printf("I (%d) was chosen\n",idec+1);
  double retval;
  Results maxs;
  maxs.max1 = freqs[i1];
  maxs.max2 = freqs[i2];
  maxs.max3 = freqs[i3];

  switch(idec+1){
    case(1): retval = freqs[i1];
             break;
    case(2): retval = freqs[i2];
             break;
    case(3): retval = freqs[i3];
             break;
  }

  maxs.winner = retval;

  printf("signal 1: %f\n",maxs.max1);
  printf("signal 2: %f\n",maxs.max2);
  printf("signal 3: %f\n",maxs.max3);



  // frees stuff
  free(cfg);
  free(ci1);
  free(ci2);
  free(ci3);
  free(co1);
  free(co2);
  free(co3);
  free(Output);
  free(Data);
  free(Transf);
  free(DataT);
  
  return maxs;
}

int main(){
  int N = 141; // make sure to change this when testing different length signal sequences.
  int i;

  // read in testing RGB signals
  float* rsig;
  float* gsig;
  float* bsig;
  if ((rsig   = (float *) calloc(N, sizeof(float))) == NULL) OutOfMemory() ;
  if ((bsig = (float *) calloc(N, sizeof(float))) == NULL) OutOfMemory() ;
  if ((gsig = (float *) calloc(N, sizeof(float))) == NULL) OutOfMemory() ;

  FILE* f1 = fopen("num1.txt","r");
  
  double temp;
  for(i = 0; i < N; i++){
    fscanf(f1,"%f %f %f",&rsig[i],&gsig[i],&bsig[i]);
  }
  fclose(f1);

  // extract heart rate
  double fs = 15;
  Results hr = extractHR(rsig,gsig,bsig,N,(double)15.0);

  // display heart rate
  printf("signal 1: %f\n",hr.max1);
  printf("signal 2: %f\n",hr.max2);
  printf("signal 3: %f\n",hr.max3);
  printf("winner: %f\n",hr.winner);
  
  return 0 ;

}