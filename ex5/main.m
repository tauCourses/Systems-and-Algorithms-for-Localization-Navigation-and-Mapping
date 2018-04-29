R = [-10000 -10000; 10000 -10000; -10000 10000; 10000 10000];
p = [9500 500];
X = -20000 : 100 : 20000;
Y = -20000 : 100 : 20000;

F = zeros(length(X), length(Y));
for ii=1:length(X)
    for jj=1:length(Y)
        F(jj,ii) = trialateration_objective(R,p, [X(1,ii) Y(1,jj)]);
    end
end

contour(X,Y,F,25);
daspect([1 1 1]);
hold on;
plot(R(:,1),R(:,2),'ro');
plot(p(:,1),p(:,2),'rx');

global prev_p;
global color;
prev_p = NaN;
color = 'red';

options  =  optimset('OutputFcn',  @outfun);
func = @(p_hat) trialateration_objective(R, p, p_hat);
x0 = [-12000 -12000];
[x, fval, exitflag, output] = fminsearch(func,x0,options);

prev_p = NaN;
color = 'blue';

%in my matlab version SpecifyObjectiveGradient doesn't exist
%instead the manual says to use Jacobian 'on'. 
%I think it's a versions issues. I run it on matlab R2014a
options2  =  optimoptions  ('lsqnonlin',  ...
                            'Jacobian'  ,'on', ...
                            'Algorithm', 'levenberg-marquardt',  ...
                            'OutputFcn',  @outfun);
                        
func2 = @(p_hat) trialateration_residual(R, p, p_hat);
[x, resnorm, residual, exitflag, output2] = lsqnonlin(func2 ,x0, [], [] , options2);

%part 6
%{
num_of_points = 50;
points = zeros(2,num_of_points);
points(1,:) = 5000.*rand(1,num_of_points) + 7000;
points(2,:) = 5000.*rand(1,num_of_points) - 2000;
numOfIters = zeros(2,num_of_points);
distToPoint = zeros(2,num_of_points);
for ii=1:num_of_points
    x0 = points(:,ii)';
    [x1, fval, exitflag, output] = fminsearch(func,x0,options);
    [x2, resnorm, residual, exitflag, output2] = lsqnonlin(func2 ,x0, [], [] , options2);
    numOfIters(1,ii) = output.iterations;
    numOfIters(2,ii) = output2.iterations;
    distToPoint(1,ii) = norm(x1-p);
    distToPoint(2,ii) = norm(x2-p);
end

%iteration graph
hold off
plot(numOfIters(1,:)','Color','blue')
hold on
plot(numOfIters(2,:)','color','red')
legend('Nedler-Mead - iters','Gauss-Newton - iters')

%distances graph
%{
hold off
plot(distToPoint(1,:)','color','blue')
hold on
plot(distToPoint(2,:)','color','red')
legend('Nedler-Mead - dist', 'Gauss-Newton - dist')
%}
%}