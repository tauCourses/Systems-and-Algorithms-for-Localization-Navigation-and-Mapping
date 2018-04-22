function panelty = paneltyFunction(R, A, t)
panelty = 0;
c = 3;
n = size(R,2);
for ii=1:n
    panelty = panelty + (A(ii)-norm(R(:, ii)-t)/c)^2;
end