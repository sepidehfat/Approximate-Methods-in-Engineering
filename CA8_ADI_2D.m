%% ADI method
close all
clear 
clc
%% initial
 X= 1.5;
 Y= 2;
 et= 0.12;
 
 dx= 0.1;
 dy= 0.1;
 dt= 0.01;
 
 nx= X/dx +1;
 ny= Y/dy +1;
 
 alpha= 1.11* 10^(-4);
 S= alpha * dt/(dx^2);
 
 x= linspace(0,X,nx);
 y= linspace(0,Y,ny);

 
 U0= zeros(ny,nx);
 U1= zeros(ny,nx);
 U2= zeros(ny,nx);
 Ue= zeros(ny,nx);
 
 U0(ny,:)=10;
 U0(1,:)=40;
 
 A= diag((1+S)*ones(1,ny)) + diag((-S/2)*ones(1,ny-1),1) + diag((-S/2)*ones(1,ny-1),-1);
 B= diag((1-S)*ones(1,ny)) + diag(S/2*ones(1,ny-1),1) + diag(S/2*ones(1,ny-1),-1);
 k=0;
 e=1.00;
 %% code
 while e > et
    for i=2:nx-1
        for j=2:ny-1
            U2= inv(A)*B * U0;
            U1= inv(A)*B * U2;
        end
    end
    e= sum(U1(:))-sum(Ue(:))
    Ue= U1;
    U0=U1;
    k=k+1
    U0(ny,:)=10;
    U0(1,:)=40;
    U0(2:ny-1,1)=0;
    U0(2:ny-1,nx)=0 ;
 end
 %% plot
surf(x,y,U1,U1)

