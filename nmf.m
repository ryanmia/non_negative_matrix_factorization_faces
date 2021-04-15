%%
%nmf function uses computer_objective to iteratively try to learn bases to
%solve V=BW and find the optimal set of basis vectors to approximate the
%data
function [B,W,obj,k] = nmf(V,rank,max_iter,lambda)
% NMF - Non-negative matrix factorization
% [B,W,OBJ,NUM_ITER] = NMF(V,RANK,MAX_ITER,LAMBDA) 
% V - Input data.
% RANK - Rank size.
% MAX_ITER - Maximum number of iterations (default 50).
% LAMBDA - Convergence step size (default 0.0001). 
% B - Set of basis images.
% W - Set of basis coefficients.
% OBJ - Objective function output.
% NUM_ITER - Number of iterations run.

% Your code here

B=rand(size(V,1),rank);
W=rand(rank,size(V,2));
B=B./sum(B);
W=W./sum(W);

oldobj=0;
newobj=compute_objective(V,B,W);
k=0;
while k<max_iter && abs(newobj-oldobj)>lambda
    B=B.*((V./(B*W))*W'./sum(W'));
    W=W.*(B'*(V./(B*W))./sum(B)');
    oldobj=newobj;
    newobj=compute_objective(V,B,W);
    k=k+1;
end
obj=newobj;
end

