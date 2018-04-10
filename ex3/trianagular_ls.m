function x = trianagular_ls(A,b) % assumes A is upper trianagular matrix
n = size(A,2); 
x = zeros(1,n); % set x to zeros
for ii=n:-1:1  %find x indexes from last(n) to 1
    temp = b(ii);
    for jj=n:-1:(ii+1) %substract already known values
        temp = temp - A(ii,jj)*x(jj);
    end
    x(ii) = temp/A(ii,ii); % calc x at ii
end
