function x = givens_ls(A,b)
m = size(A,1);
n = size(A,2);
Q = eye(m,m);
R = A;
for ii=1:n %run from first column to the last one
    for jj=m-1:-1:ii % run from bottom up to ii
        [c,s] = givens([R(jj,ii),R(jj+1,ii)]); %get rotation
        temp = eye(m,m); %set temporary artogonal matrix
        temp(jj,jj) = c; 
        temp(jj+1,jj+1) = c;
        temp(jj,jj+1) = -s;
        temp(jj+1,jj) = s;
        Q = temp*Q; %update Q
        R = temp*R; % update R
    end
end
% now A = Q*R! let update b to Rb(b with respect to R):
Rb = Q*b;
x = trianagular_ls(R,Rb)'; %solve