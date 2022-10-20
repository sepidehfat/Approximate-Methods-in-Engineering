%% ADI method
close all
clear 
clc
%% initial
 L=4;
 t=0.4
 dx=0.2;
 dt=0.2;
 nx=L/dx +1;
 nt=t/dt +1;
 alpha=2/pi;
 S= (alpha^2) * dt/(dx^2);
 x=linspace(0,L,nx)
 t=linspace(0,t,nt)
 U0=sin((pi*x)/4) + sin((pi*x)/2);
 U1=zeros(1,nx);
 F=zeros(1,nx);
 U0(1)=0;
 U0(nx)=0;
 A= diag((2+2*S)*ones(1,nx)) + diag(-S*ones(1,nx-1),1) + diag(-S*ones(1,nx-1),-1)
 B= diag((2-2*S)*ones(1,nx)) + diag(S*ones(1,nx-1),1) + diag(S*ones(1,nx-1),-1)
 %% code
 for j=1:nt
    for i=2:nx-1
        U1=(A/B)\U0'
        F(i)= (exp(-t(j))*sin(pi*x(i)/2)) + (exp(-t(j)/4)*sin(pi*x(i)/4));
    end
    U0=U1';
    U0(1)=0;
    U0(nx)=0;
 end
 %% plot
 plot(x, U0,'r')
 hold on
 plot(x, F, 'b')
