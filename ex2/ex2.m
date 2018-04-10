s = 250;

%part 1:
[X,Y] = meshgrid(-3000:s:3000);
Z = f(X,Y);
surf(X,Y,Z,'FaceAlpha',0.5)

%part 2:
fprintf('1d leveling:\n')
leveling1d(s);

%code for graph of leveling1d accuracy compare to s size:

%ss = [5,10,20,30,50,80,100,150,200,250,300,400,500,700,1000];
%results = zeros(length(ss));
%for ii = 1:length(ss)
%    [H,Z] = leveling1d(ss(ii));
%    results(ii) = mean(abs(H-Z));
%end
%plot(ss,results);

%part 3:
fprintf('2d leveling:\n')
leveling2d(s);

%fprintf('compare accuracy 1d vs 2d for s=250:\n')
%[H,Z] = leveling1d(250);
%mean(abs(H-Z))
%[H,Z] = leveling2d(250);
%mean(abs(H(:)-Z(:)))

%part 4:
fprintf('2d leveling with sparse2d:\n')
%tic
sparse2d(30);
%toc

%fprintf('compare accuracy 1d vs 2d for s=30:\n')
%[H,Z] = leveling1d(30);
%std(abs(H-Z))
%[H,Z] = sparse2d(30);
%std(abs(H(:)-Z(:)))


%code for graph of sparse2d accuracy compare to s size:

%ss = [10,20,30,50,80,100,150,200,250,300,400,500,700,1000];
%results = zeros(length(ss));
%for ii = 1:length(ss)
%    fprintf('%d\n',ss(ii))
%    [H,Z] = sparse2d(ss(ii));
%    results(ii) = std(abs(H(:)-Z(:)));
%end
%plot(ss,results);


