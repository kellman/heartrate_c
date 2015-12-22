//  A quick C test of the the Jade/Shibbs code

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>


#include "Matutil.h" 
#include "JnS.h"
 
/* ---------------------------------------------- */

int main () {
  
  int nbsensors ; 
  int nbsamples ;
  
  double *Data   ; 
  double *Mixing ;  
  double *Transf ; 
  double *Global ; 

  // FILE *fic ;

  /*   printf("Number of sensors (dimensions) : "); scanf("%d", &nbsensors) ; */
  /*   printf("Number of samples              : "); scanf("%d", &nbsamples) ; */
  /*   printf("Dimensions of the problem: %d x %d\n", nbsensors, nbsamples) ; */
  
  nbsensors = 8 ;
  nbsamples = 1000 ; 
  
  // pb with 32x100,000

  if ((Data   = (double *) calloc(nbsensors*nbsamples, sizeof(double))) == NULL) OutOfMemory() ;
  if ((Mixing = (double *) calloc(nbsensors*nbsensors, sizeof(double))) == NULL) OutOfMemory() ;
  if ((Transf = (double *) calloc(nbsensors*nbsensors, sizeof(double))) == NULL) OutOfMemory() ;
  if ((Global = (double *) calloc(nbsensors*nbsensors, sizeof(double))) == NULL) OutOfMemory() ;
  
  srand (time (0)) ; 
  
  printf("Generating data...\n") ;
  // Gaussian (Data, nbsensors*nbsamples ) ;   
  Uniform (Data, nbsensors*nbsamples ) ;  
  // PrintMat (Data, nbsensors, nbsamples) ;

  
  Gaussian(Mixing, nbsensors*nbsensors) ; 
  // Identity(Mixing, nbsensors) ;   Mixing[0] = 2.0 ;

  printf("Mixing...\n") ;
  // PrintMat(Mixing, nbsensors, nbsensors) ;

  Transform (Data, Mixing, nbsensors, nbsamples ) ;

  // PrintMat (Data, nbsensors, nbsamples) ;

  /*   fic = fopen("/home/cardoso/ICA/Data", "w"); */
  /*   WriteMat(fic, Data, nbsensors, nbsamples) ; */
  /*   fclose(fic); */
  
  /*   printf("The mixture:\n") ; */
  /*   PrintMat(Mixing, nbsensors,nbsensors) ; */
  
  printf("Estimating the mixture...\n") ;
  // Jade(Transf, Data, nbsensors, nbsamples ) ; 
  Shibbs(Transf, Data, nbsensors, nbsamples ) ;

  printf("Global system:\n") ;
  MatMultSimple(Global, Transf, Mixing, nbsensors,nbsensors,nbsensors) ;
  PrintMat(Global, nbsensors,nbsensors) ;



  printf("Equivariance ?...\n") ;
  Jade(Transf, Data, nbsensors, nbsamples ) ; 
  // Shibbs (Transf, Data, nbsensors, nbsamples ) ; 
  PrintMat(Transf, nbsensors,nbsensors) ;




  /*   fic = fopen("/home/cardoso/ICA/System", "w"); */
  /*   WriteMat(fic, Transf, nbsensors, nbsensors) ; */
  /*   fclose(fic); */

  free(Data);
  free(Transf);  
  free(Mixing);
  free(Global);
  
  return 0 ;

}



