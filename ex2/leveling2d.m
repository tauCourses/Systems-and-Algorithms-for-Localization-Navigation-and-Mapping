function [H,Z] = leveling2d(s)
[X,Y] = meshgrid(-3000:s:3000);
Z = f(X,Y);
M = Z + randn(length(X),length(Y)).*(s/100) ;
M(:,1) = zeros(length(X),1);
M(:, length(Y)) = zeros(length(X),1);
M(1, :) = zeros(1,length(Y));
M(length(X), :) = zeros(1, length(Y));

R = M(:); %matrix -> vector
b = zeros(length(R)*2+length(X)+length(Y)-4,1);
A = zeros(length(b),length(R));

current = 1;
%set the first and the last lines to zero:
for ii=1:length(X)
    A(current,(ii-1)*length(X)+1) = 1;
    current = current + 1;
    A(current,(ii-1)*length(X)+length(Y)) = 1;
    current = current + 1;
end

%set the first and the last raws to zero:
for ii=2:(length(Y)-1)
    A(current,ii) = 1;
    current = current + 1;
    A(current,length(R)-length(Y)+ii) = 1;
    current = current + 1;
end

%set the main part of the matrix:
for ii=1:(length(X)-1) 
    for jj=1:(length(Y)-1)
        A(current,length(X)*(ii-1)+jj) = 1;
        A(current,length(X)*(ii-1)+jj+1) = -1;
        b(current) = M(ii,jj) - M(ii,jj+1);
        current = current + 1;
        A(current,length(X)*(ii-1)+jj) = 1;
        A(current,length(X)*ii+jj) = -1;
        b(current) = M(ii,jj) - M(ii+1,jj);
        current = current + 1;
    end
end

%set the last line and the last raw(each element have just one compration):
for jj=1:(length(Y)-1)
     A(current,length(X)*(length(Y)-1)+jj) = 1;
     A(current,length(X)*(length(Y)-1)+jj+1) = -1;
     b(current) = M(length(X),jj) - M(length(X),jj+1);
     current = current + 1;
     A(current,length(X)*(jj-1)+jj) = 1;
     A(current,length(X)*(jj)+jj+1) = -1;
     b(current) = M(jj,length(Y)) - M(jj+1,length(Y));
     current = current + 1;
end

spy(A); %it looks good, can see the structure of the matrix
h = A\b; %solve the problem
H = reshape(h', length(X), length(Y)); %vector -> matrix

surf(X,Y,H,'FaceAlpha',0.5);

end

