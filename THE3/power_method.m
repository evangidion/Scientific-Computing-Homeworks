function [maxEigenValue, EigenVector] = power_method(A, x)
    k = 1e3;
    for i = 1:k
        x = A*x;
        x = x/norm(x);
    end
    EigenVector = x;
    xT = transpose(x);
    maxEigenValue = (xT*A*x)/(xT*x); % Rayleigh Quotient
end
