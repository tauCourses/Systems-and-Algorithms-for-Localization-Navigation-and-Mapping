tests=100;
matlab_res = zeros(tests);
given_ls_res = zeros(tests);
for ii=1:tests
    fprintf('%d\n',ii);
    n = randi(50);
    m = n + randi(200);
    %tests for rand_ls_consistent:
    [A,b,x] = rand_ls_consistent(m,n);
    matlab_res(ii) = norm(A\b-x);
    given_ls_res(ii) = norm(givens_ls(A,b)-x);
    
    %tests for rand_ls_inconsistent:
    %[A,b,x] = rand_ls_inconsistent(m,n); 
    %matlab_res(ii) = norm(A'*A*(A\b)-(b'*A)');
    %given_ls_res(ii) = norm(A'*A*(givens_ls(A,b))-(b'*A)');
    
    %tests for rand_ls_underdetermined:
    %[A,b,x] = rand_ls_underdetermined(m,n);
    %matlab_res(ii) = norm(A\b);
    %given_ls_res(ii) = norm(givens_ls(A,b));
    
end

plot(1:100,matlab_res, 'g', 1:100, given_ls_res, 'r')
%plot(1:100, matlab_res - given_ls_res)