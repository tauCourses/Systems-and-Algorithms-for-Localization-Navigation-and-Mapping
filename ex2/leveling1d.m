function [H,Z] = leveling1d(s)
X = -3000:s:3000;
Z = f(X,0);
M = Z + randn(1,length(X)).*(s/100) ;
M(1) = 0;
M(length(X)) = 0;

b = zeros(length(X)+1,1);
A = zeros(length(b),length(X));

A(1:1) = 1; %set first point height to zero
A(2,length(X)) = 1; %set last point height to zero
current = 3;

for ii=1:(length(X)-1) % set A matrix and b vector:
    A(current,ii) = 1;
    A(current,ii+1) = -1;
    b(current) = M(ii) - M(ii+1);
    current = current + 1;
end
spy(A) %it looks good!

h = A\b; %solve the problem
plot(-3000:s:3000,h)

H= h';
        
end