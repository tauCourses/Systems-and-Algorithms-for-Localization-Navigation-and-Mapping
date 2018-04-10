function [A,b,x] = rand_ls_underdetermined(m,n)
if m>=n
    A = rand(n-1,n);
    for ii=n:m
        temp = rand(1,n-1);
        newcal = zeros(1,n);
        for jj = 1:n-1
            newcal = newcal + A(jj,:)*temp(jj);
        end
        A(ii,:) = newcal;
    end
else
    A = rand(m,n);
end
x = rand(n,1);
b = A*x;