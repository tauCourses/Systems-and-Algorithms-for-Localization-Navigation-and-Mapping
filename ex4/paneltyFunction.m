function panelty = paneltyFunction(R, p, t)
panelty = 0;
c = 3;
n = size(R,2);
for ii=1:n
    panelty = panelty + (norm(R(:, ii)-p)-norm(R(:, ii)-t) + rand(1,1))^2;
   % 5/6 - panelty = panelty + (norm(R(:, ii)-p)-norm(R(:, ii)-t) + rand(1,1) + normrnd(0,100))^2;
end

panelty = panelty/(c^2);