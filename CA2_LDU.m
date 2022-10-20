close all
clear 
clc
%%
A=input('Enter Coefficient matrix:\n');
[L D U]=LDU(A)
 Mj=-inv(D)*(L+U)
 EiV=eigs(Mj,1)
 if(abs(EiV)<1)
     disp("Jacobi method converges")
 else
     disp("Jacobis method does not converge")
 end
%%
function [L D U]= LDU(A)
    L=tril(A,-1);
    D=diag(diag(A));
    U=triu(A,1);
end
%%


