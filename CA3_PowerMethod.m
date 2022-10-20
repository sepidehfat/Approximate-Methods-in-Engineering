close all
clear 
clc
%%initial
A=[3 -1 0 0; -1 2 -1 0; 0 -1 2 -1; 0 0 -1 4] 
V0=[1 1 1 1]'
V0=V0/norm(V0,inf);
PV=V0;    %prev v
CV=V0;
%%
for i=1:15
    PV=CV
    CV=A*CV;
    LargestLanda=norm(CV,inf);
    CV=CV/norm(CV,inf);
end
X1=PV/PV(1)
Landa1=LargestLanda
if (sign(PV(1))~= sign(CV(1)))
    LargestLanda=-LargestLanda
end
P=[X1,[zeros(1,3);eye(3,3)]]
B=inv(P)*(A*P)
C=B(2:4, 2:4)
eig(C)
eig(A)
%%