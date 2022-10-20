function [C1,x]= CN(X,T,alpha)
 dx=100;
 dt=0.2;
 nx= X/dx +1;
 nt= T/dt +1;
 S= alpha * dt/(dx^2);
 x= linspace(0,X,nx)
 C0= exp((-(x-750).^2)/5000);
 C1=zeros(1,nx); 
 A= diag((2+2*S)*ones(1,nx)) + diag(-S*ones(1,nx-1),1) + diag(-S*ones(1,nx-1),-1)
 B= diag((2-2*S)*ones(1,nx)) + diag(S*ones(1,nx-1),1) + diag(S*ones(1,nx-1),-1)
 for j=1:nt
    for i=2:nx-1
        C1=(A/B)\C0';
    end;
    C0=C1';
 end
end