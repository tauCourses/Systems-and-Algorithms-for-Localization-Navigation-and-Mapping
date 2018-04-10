function [A,b,x] = rand_ls_consistent(m,n)
A = rand(m,n);
x = rand(n,1);
b = A*x;