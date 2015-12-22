#include <assert.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#define PI 3.14159265

// int main() { 
// 	// Build and parse out audio
// 	FILE *filter_file, *x_file, *output_file;
	
// 	int order = 559;
// 	int length_x = 220555;
// 	double mod_freq = 10001.88;
	
// 	double* filter = (double *) calloc(order, sizeof(double));
// 	double* x_time = (double *) calloc(length_x, sizeof(double));
// 	double* x_value = (double *) calloc(length_x, sizeof(double));
// 	double* y_value = (double *) calloc(length_x, sizeof(double));
// 	double* output = (double *) calloc(length_x, sizeof(double));
	
// 	filter_file = fopen("filter_num.txt","r");
// 	x_file = fopen("hw1.dat","r");
// 	output_file = fopen("output.dat","w");
// 	parse_filter(filter, filter_file, order);
//  parse_x(x_time, x_value, x_file, length_x);
	
// 	//Process Audio
// 	filter_FIR(filter, order, x_value, length_x, y_value);
// 	modulate_AM(y_value, length_x, mod_freq, output);
	
// 	//Write output audio
// 	write_x(x_time, output, output_file, length_x);
	
// 	//Clean up
// 	fclose(filter_file);
// 	fclose(x_file);
// 	fclose(output_file);
// 	free(filter);
// 	free(x_time);
// 	free(x_value);
// 	free(y_value);
// 	free(output);
// 	return 0;
// }

int parse_x(double* x_time, double* x_value, FILE *x_file, int length_x) {
	int i;
	double time, value;
	for (i = 0; i < length_x; i++) {
		fscanf(x_file, "%lf %lf", &time, &value);
		x_time[i] = time;
		x_value[i] = value;
		//printf("%lf %lf \n",x_time[i], x_value[i]);
	}
	//printf("%d \n", length_x);
	return i;
}	

int parse_filter(double* filter, FILE *filter_num, int order) {
	int i;
	double coeff = 0;
	for (i = 0; i < order; i++) {
		if (fscanf(filter_num, "%lf", &coeff) != 1) {
			printf("Error with scanf: \n");
			exit(1);
		}
		filter[i] = coeff;
		//printf("%.15lf \n",coeff);
	}
	//printf("%d \n", order);
	return 0;
}	

int write_x(double* time, double* value, FILE *output_file, int length){
// Srite the values of an array to a .dat file with the proper headed for sox
	int i;
	fprintf(output_file, "%s\n%s\n", "; Sample Rate 44100", "; Channels 1");
	for (i = 0; i < length; i++){
		fprintf(output_file, "%.15lf %.15lf\n", time[i], value[i]);
	}
	return 0;
}

int filter_FIR(double* num, int length_num, double* x, int length_x, double* y) 
// Port of Matlab Filter Function
// 
{
	int i,j;
	y[0] = x[0] * num[0];
	//Handles the first samples without needing 0 padding
	for (i = 1; i < length_num; i++) {
		for (j = 0; j < i; j++) {
			y[i] += x[i-j] * num[j];
		}
	}
	//Handles the rest of the samples
	for (i = length_num; i < length_x; i++) {
		for (j = 0; j < length_num; j++) {
			y[i] += x[i-j] * num[j];
		}
	}
	return 0;
}

int modulate_AM(double* input, int length_input, double freq_c, double* output) {
// Modulate the input signal by a cos at freq_c and place in output array
	int i;
	double cos_value;
	double* x_time = (double *) calloc(length_input, sizeof(double));
	for (i = 0; i < length_input; i++) {
		cos_value = cos(freq_c*4*PI*(i+1));
		output[i] = input[i] * cos_value;
	}
	return 0;
}
	
	
	
	
