function panelties = paneltiesFunction(R,p,T)
x = [];
n = size(T,2);
icounter = 0;
jcounter = 1;
lastI = 0;
for ii=1:n
    if(T(1,ii) ~= lastI)
        icounter = icounter + 1;
        jcounter = 1;
        lastI = T(1,ii);
    else
        jcounter = jcounter + 1;
    end
    x(icounter,jcounter) = paneltyFunction(R, p, T(:,ii));
end

panelties = x;