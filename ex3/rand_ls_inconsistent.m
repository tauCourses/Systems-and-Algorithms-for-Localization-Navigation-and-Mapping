function [A,b,x] = rand_ls_inconsistent(m,n)
A = rand(m,n);
b = rand(m,1);
x = rand(n,1);