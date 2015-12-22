#include <math.h>
#include "mex.h"
  
#include <stdio.h>
#include <stdlib.h>


/* #include "Matutil.c" repository of once useful matrix-related functions */

#include "JnS.c"  /* The real thing is maintained in an other file */


/* -- The gateway ------------------------------------------------ */


/* I/O Arguments */
#define	Xin	prhs[0]
#define	Bout	plhs[0]


void mexFunction(
                 int nlhs,       mxArray *plhs[],
                 int nrhs, const mxArray *prhs[]
		 )
{
  double	*X;  /* the input data matrix */
  double	*B;  /* the output separating matrix */

  unsigned int	datadim ;    /* number of sensors */
  unsigned int	samplesize ; /* number of data points */
  
  /* Check for proper number of arguments */
  if (nrhs != 1) mexErrMsgTxt("Requires a unique input argument.");
  if (nlhs >  1) mexErrMsgTxt("Returns a single matrix.");
  
  
  /* Check the dimensions of X  */
  datadim    = mxGetM(Xin);
  samplesize = mxGetN(Xin);

  /*   if ( */
  /*       !mxIsNumeric(Y_IN)  */
  /*       || mxIsComplex(Y_IN) */
  /*       || mxIsSparse(Y_IN) */
  /*       || !mxIsDouble(Y_IN)  */
  /*       )  */
  /*     mexErrMsgTxt("Ragnagna..."); */
  
  
  /* Create a matrix for the return argument */
  Bout = mxCreateDoubleMatrix(datadim, datadim, mxREAL);
  
  
  /* Get pointers to the I/O parameters */
  B = mxGetPr(Bout);
  X = mxGetPr(Xin);
  
  /* Do it */
  ICA_ALGORITHM (B, X, (int) datadim, (int) samplesize);

  /* Note: this is a stupid trick to avoid duplicating the gateway code, */

  return;

}

