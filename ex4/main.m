R = [-10000 -10000; 10000 -10000; -10000 10000; 10000 10000]';

%part 6 only:
%k=15;
%for ii=5:k+5
%    R(:, ii) =  [normrnd(0,20000), normrnd(0,20000)];
%end

% 4A - R = [0 -9000; 0 -4500; 0 5500; 0 10000]';
% 4B - R = [0 -9500; 4000 500; 0 10000; -1000 500]';
p = [9500 ;500];
X = -20000 : 100 : 20000;
Y = -20000 : 100 : 20000;
%part 5/6 high resolution:
%X = 9450 : 0.5 : 9550; 
%Y = 450 : 0.5 : 550;
[X1,Y1] = meshgrid(X,Y);
T = [X1(:) Y1(:)]';
F = paneltiesFunction(R, p, T)';

contour(X,Y,F,25);
daspect([1 1 1]);
hold on;
plot(R(1,:),R(2,:),'ro');
plot(p(1,:),p(2,:),'rx');
   