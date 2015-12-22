#include <math.h>
#include "mex.h"
  
#include <stdio.h>
#include <stdlib.h>


/* #include "Matutil.c" repository of once useful matrix-related functions */

#include "JnS.c"  /* The real thing is maintained in an other file */


/* -- The gateway ------------------------------------------------ */

void mexFunction(
                 int nlhs,       mxArray *plhs[],
                 int nrhs, const mxArray *prhs[]
		 )
{
  double	*U;  /* the output diagonalizer */
  double	*X;  /* the input/output stack */
  int            M;  
  int            K;  
  double      thre;  /* threshold */


  int number_of_dims, c; 
  const int *dim_array; 

  /* Check for proper number of arguments */
  if (nrhs != 2) mexErrMsgTxt("Requires 2 input arguments.");
  if (nlhs >  1) mexErrMsgTxt("Returns a single matrix.");

  /* check for number of dimensions */
  number_of_dims = mxGetNumberOfDimensions(prhs[0]);
  if (number_of_dims != 3) mexErrMsgTxt("The input stack should be a 3D array.");

  /* get dimensions and check them */
  dim_array      = mxGetDimensions(prhs[0]); 
  M = dim_array[0] ;
  K = dim_array[2] ;
  if (M != dim_array[1]) mexErrMsgTxt("Matrices in the stack should be square.");

  /* get the threshold */
  thre =  *(mxGetPr(prhs[1]));  
  /* printf("Threshold: %f\n", thre) ; */

  /* Create a matrix for the return argument */
  plhs[0] = mxCreateDoubleMatrix(M, M, mxREAL);
  
  /* Get pointers to the I/O parameters */
  U = mxGetPr(plhs[0]);
  X = mxGetPr(prhs[0]);

  /* Do it */
  JointDiago (X, U, M, K, thre);

  return;

}

  
