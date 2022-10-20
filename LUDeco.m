function [L U] = LUDeco(A)
%Function LUDeco. Factorize an square matrix to
%multiplation of two matrix L and U such that L
%is a Lower triangular matrix and U is an Upper
%triangular matrix.
%Usage: [L U]=LUDeco(A);
%input:
%       A: An square matrix.
%Output:
%       L: Lower triangular matrix,
%       U: Upper triangular matrix.
    A=[1 2 3; 4 5 6 ; 7 8 9]
    [m n] = size(A);
    if(m~=n)
        error('Matrix most be square.');
    else
        LTemp = eye(m);
        UTemp = zeros(m);
        for i=1:m
            for j=1:i
                sumTemp = 0;
                for k=1:i-1
                    sumTemp = sumTemp + (LTemp(j,k) * UTemp(k,i));
                end
                UTemp(j,i) = A(j,i) - sumTemp;
            end
            for j=i+1:m
                sumTemp = 0;
                for k=1:i-1
                    sumTemp = sumTemp + (LTemp(j,k) * UTemp(k,i));
                end
                LTemp(j,i) = (A(j,i) - sumTemp) / UTemp(i,i);
            end
        end
        L = LTemp
        U = UTemp
    end
end
