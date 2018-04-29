function [tr, jacobian]  = trialateration_residual(known_points,p,p_hat)
    trp = trilateration_model(known_points, p);
    trp_hat = trilateration_model(known_points, p_hat);
    tr = trp - trp_hat;
    if  nargout  >  1
        n = length(known_points);
        jacobian = zeros(n,2);
        for ii=1:n
            jacobian(ii,1) = (known_points(ii,1)-p_hat(1))/(3*trp_hat(ii));
            jacobian(ii,2) = (known_points(ii,2)-p_hat(1))/(3*trp_hat(ii));
        end
    end
end