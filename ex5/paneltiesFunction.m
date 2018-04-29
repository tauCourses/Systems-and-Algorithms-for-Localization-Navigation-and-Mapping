function panelties = paneltiesFunction(R,p,T)
x = [];
n = size(T,2);
icounter = 0;
jcounter = 1;
lastI = 0;
c = 3;
A = zeros(size(R,2),1);
for ii=1:length(A)
    A(ii) = norm(R(:, ii)-p)/c;
    %part 5/6:
    %A(ii) = norm(R(:, ii)-p)/c +  3*normrnd(0,100);
end

for ii=1:n
    if(T(1,ii) ~= lastI)
        icounter = icounter + 1;
        jcounter = 1;
        lastI = T(1,ii);
    else
        jcounter = jcounter + 1;
    end
    x(icounter,jcounter) = paneltyFunction(R, A, T(:,ii));
end

panelties = x;