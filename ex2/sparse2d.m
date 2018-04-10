function [H,Z] = sparse2d(s)
[X,Y] = meshgrid(-3000:s:3000);
Z = f(X,Y);
M = Z + randn(length(X),length(Y))*(s/100) ;
M(:,1) = zeros(length(X),1);
M(:, length(Y)) = zeros(length(X),1);
M(1, :) = zeros(1,length(Y));
M(length(X), :) = zeros(1, length(Y));

R = M(:); %matrix -> vector
b = zeros(length(R)*2+length(X)+length(Y)-4,1);

ijv = zeros((length(R)-1)*4,3);

current = 1; % counter for 
line = 1; % the line number in the matrix 
%set the first and the last lines to zero:
for ii=1:length(X)
    ijv(current,1) = line;
    ijv(current,2) = (ii-1)*length(X)+1;
    ijv(current,3) = 1;
    current = current + 1;
    line = line + 1;
    ijv(current,1) = line;
    ijv(current,2) = (ii-1)*length(X)+length(Y);
    ijv(current,3) = 1;
    current = current + 1;
    line = line + 1;
end

%set the first and the last raws to zero:
for ii=2:(length(Y)-1)
    ijv(current,1) = line;
    ijv(current,2) = ii;
    ijv(current,3) = 1;
    current = current + 1;
    line = line + 1;
    ijv(current,1) = line;
    ijv(current,2) = length(R)-length(Y)+ii;
    ijv(current,3) = 1;
    current = current + 1;
    line = line + 1;
end

%set the main part of the matrix:
for ii=1:(length(X)-1) 
    for jj=1:(length(Y)-1)
        ijv(current,1) = line;
        ijv(current,2) = length(X)*(ii-1)+jj;
        ijv(current,3) = 1;
        current = current + 1;
        ijv(current,1) = line;
        ijv(current,2) = length(X)*(ii-1)+jj+1;
        ijv(current,3) = -1;
        current = current + 1;
        b(line) = M(ii,jj) - M(ii,jj+1);
        line = line + 1;
        
        ijv(current,1) = line;
        ijv(current,2) = length(X)*(ii-1)+jj;
        ijv(current,3) = 1;
        current = current + 1;
        ijv(current,1) = line;
        ijv(current,2) = length(X)*ii+jj;
        ijv(current,3) = -1;
        current = current + 1;
        b(line) = M(ii,jj) - M(ii+1,jj);
        line = line + 1;
        
    end
end

%set the last line and the last raw(each element have just one compration):
for jj=1:(length(Y)-1)
    ijv(current,1) = line;
    ijv(current,2) = length(X)*(length(Y)-1)+jj;
    ijv(current,3) = 1;
    current = current + 1;
    ijv(current,1) = line;
    ijv(current,2) = length(X)*(length(Y)-1)+jj+1;
    ijv(current,3) = -1;
    current = current + 1;
    b(line) = M(length(X),jj) - M(length(X),jj+1);
    line = line + 1;
        
    ijv(current,1) = line;
    ijv(current,2) = length(X)*(jj-1)+jj;
    ijv(current,3) = 1;
    current = current + 1;
    ijv(current,1) = line;
    ijv(current,2) = length(X)*(jj)+jj+1;
    ijv(current,3) = -1;
    current = current + 1;
    b(line) = M(jj,length(Y)) - M(jj+1,length(Y));
    line = line + 1;
end

A = sparse(ijv(:,1),ijv(:,2),ijv(:,3));
spy(A)

h = A\b; %solve the problem
H = reshape(h', length(X), length(Y)); %vector -> matrix
surf(X,Y,H,'FaceAlpha',0.5);

end

