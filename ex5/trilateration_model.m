function tm = trilateration_model(known_points,p)
    c = 3;
    m = length(known_points);
    tm = zeros(m,1);
    for ii=1:m
        tm(ii,:) = norm(known_points(ii,:)-p)/c;
    end
end