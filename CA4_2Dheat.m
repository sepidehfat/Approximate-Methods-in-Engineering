close all
clear 
clc
%%
M=[4 -1 0; -1 4 -1; 0 -1 4]
I=-1*eye(3);
Z=zeros(3);
T=[M,I,Z; I,M,I; Z,I,M]
%%
%initial
A=T;
b=[25 50 150 0 0 50 0 0 25]';
x=[0 0 0 0 0 0 0 0 0]';
%%
%algorythm
t=0;
while t<10
    prevx=x;
    for i=1:9
        sigma=0;     
        for j=1:9
            if j~=i
                sigma=sigma+A(i,j)*prevx(j);
            end
        end
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    t= t+1;
    x'
end