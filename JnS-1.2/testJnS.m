% A quick test of the Jade/Shibbs code
clear

n = 5 ;
T = 10000 ;


% Removing the sample mean is necessary for the sake of
% this particular test
S =rand(n,T)-0.5 ; S =S - mean(S')' * ones(1,T);
A = randn(n);
X = A*S ;


% Note: there are weird assignments below to work around 
% some `smartnesses' of the matlab interpreter.


fprintf('%=======  checking Jade  =============== %\n');

% The matlab estimate
Xs = X ;
Xs = Xs'; Xs = Xs' ;
Bm = MatlabjadeR(Xs) ;
%Bm*A
%fprintf('Matlab functions do not change the input arguments:');
%changes = [ norm(X-Xs,'fro'), norm(Bm*X-Xs, 'fro') ]


% The C estimate
Xs = X ;
Xs = Xs'; Xs = Xs' ;
Bc = JadeR(Xs) ;
% Bc*A
%fprintf('This C function does change the input arguments:');
%changes = [ norm(X-Xs,'fro'), norm(Bc*X-Xs, 'fro') ]


% Checking that C and Matlab agree (up to errors due to possibly
% different diagonalization thresholds.
The_same = Bc*inv(Bm)


fprintf('%=======  checking Shibbs  =============== %\n');
% The matlab estimate
Bm = MatlabshibbsR(X) ;

% The C estimate
Xt = X;  % saving X because the C code updates it 
Bc = ShibbsR(Xt) ;


% Checking consistency: should be close to diag*perm
% Bc*A

% Checking that the mex file does also update the *input* argument
% i.e. it, after execution, the input data vector Xt *is* the
% estimated IC data matrix
% norm( Bc*X - Xt, 'fro') 


% Checking that C and Matlab agree (up to errors due to possibly
% different diagonalization thresholds.

The_same = Bc*inv(Bm)
