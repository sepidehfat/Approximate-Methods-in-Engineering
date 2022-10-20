close all
clear 
clc
%% %initial
 L=1;
 n=10;
 dx=0.1;
 dt=0.0005;
 S= dt/(dx^2);
 x=linspace(0,L,11)
 t=linspace(0,0.5,1001)
 U0=sin(pi*x)
 U1=zeros(1,11);
 F=zeros(1,11);
 U0(1)=0;
 U0(11)=0;
 %% code
 for j=1:1001
    for i=2:10
        U1(i)= S*U0(i-1) + (1-2*S)*U0(i) + S*U0(i+1)
        F(i)=exp(-pi^2*t(j))*sin(pi*x(i))
    end
    U0=U1;
 end
 %% %plot
 subplot(2,1,1);
 plot(U0)
 subplot(2,1,2);
 plot(F)
