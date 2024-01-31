function [eigenValue, eigenVector] = inverse_power(A, alfa)
    v = ones([length(A), 1]);
    v = v/norm(v);
    shifted_Inverse = inv(A - (alfa*eye(length(A))));
    k = 1e3;
    for i = 1:k
        v = shifted_Inverse*v;
        v = v/norm(v);
    end
    eigenVector = v;
    vT = transpose(v);
    eigenValue = (vT*A*v)/(vT*v); % Rayleigh Quotient
end
