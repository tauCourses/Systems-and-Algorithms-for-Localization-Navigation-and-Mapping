function tr = trialateration_objective(known_points,p,p_hat)
    tr = sum(trialateration_residual(known_points,p,p_hat).^2);
end