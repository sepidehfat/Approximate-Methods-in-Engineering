function [C1,x]= FTCS(X,T,alpha)
 dx=1;
 dt=0.0005;
 nx= X/dx +1;
 nt= T/dt +1;
 S= alpha * dt/(dx^2);
 x=linspace(0,X,nx)
 C0= exp((-(x-750).^2)/5000);
 C1=zeros(1,nx);
 for j=1:nt
    for i=2:nx-1
        C1(i)= S*C0(i-1) + (1-2*S)*C0(i) + S*C0(i+1);
    end
    C0=C1;
 end
end