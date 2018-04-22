R = [-10000 -10000; 10000 -10000; -10000 10000; 10000 10000]';
    
% 4A - R = [0 -9000; 0 -4500; 0 5500; 0 10000]';
% 4B - R = [0 -9500; 4000 500; 0 10000; -1000 500]';
p = [9500 ;500];
X = -20000 : 100 : 20000;
Y = -20000 : 100 : 20000;

%part 5/6 high resolution:
%X = 7500 : 10 : 11500; 
%Y = -1500 : 10 : 2500;

[X1,Y1] = meshgrid(X,Y);
T = [X1(:) Y1(:)]';

%part 6 only: 
%{
k=100;
res = zeros(k,1);
for ii=5:k+5
    ii
    R(:, ii) =  [normrnd(0,20000), normrnd(0,20000)];
    F = paneltiesFunction(R, p, T)';
    [min_val,idx]=min(F(:));
    [row,col]=ind2sub(size(F),idx);
    min_point = [X(row) ;Y(col)];
    res(ii-4) = norm(p-min_point);
end
plot(5:k+5,res)
return
%}

F = paneltiesFunction(R, p, T)';

contour(X,Y,F,25);
daspect([1 1 1]);
hold on;
plot(R(1,:),R(2,:),'ro');
plot(p(1,:),p(2,:),'rx');
   