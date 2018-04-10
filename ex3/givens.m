function [c,s] = givens(p) %get vector in 2d, return the rotation to y=0
c = p(1)/sqrt(p(1)*p(1)+p(2)*p(2));
s = -p(2)/sqrt(p(1)*p(1)+p(2)*p(2));