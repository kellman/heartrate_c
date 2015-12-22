% A quick test of the joint diagonalization vode.

clear
M 		= 32 		; % Dimension
K 		= 32 		; % Number of matrices in the stack
threshold 	= 1.0e-10 	; % Accuracy

%% building a random orthonormal matrix U
rmat = randn(M) ;
[U , dump ] = eig (rmat+rmat') ;
clear rmat dump ;


%% Building a stack
Stack = zeros(M,M,K) ;
for k=1:K 
	rdiag = diag(randn(1,M)) ;
	Stack(:,:,k) = U*rdiag*U' ;
end

% Checking the checks in the Matlab/C interface
%U = JointDiag(randn(M),K,M, 1.0e-3)
%U = JointDiag(randn(2,3,4),K,M, 1.0e-3)


% Checking the computations
V = JointDiag(Stack, threshold) ;

fprintf('OK if this is a signed permutation ?:\n');
V*U


