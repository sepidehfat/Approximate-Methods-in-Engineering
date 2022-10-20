close all
clear 
clc
%%initial
A=[4 1 -1 0 0 0 0 0;
    1 6 -2 1 -1 0 0 0;
    0 1 5 0 -1 1 0 0;
    0 2 0 5 -1 0 -1 -1;
    0 0 -1 -1 6 -1 0 -1;
    0 0 -1 0 -1 5 0 0;
    0 0 0 -1 0 0 4 -1;
    0 0 0 -1 -1 0 -1 5];
b=[3 -6 -5 0 12 -12 -2 2]';
x=[0 0 0 0 0 0 0 0]';
%%algorythm
t=0;
while t<10
    prevx=x;
    for i=1:8
        sigma=0;     
        for j=1:8
            if j~=i
                sigma=sigma+A(i,j)*prevx(j);
            end
        end
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    t= t+1;
    x'
end