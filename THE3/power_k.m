function [eigenValues, eigenVectors] = power_k(A, k)
  v = ones([length(A), 1]);
  eigenValues = [];
  eigenVectors = [];
  l = 1e3;
  for i = 1:k
    for j = 1:l
      v = A*v;
      v = v/norm(v);
    end
    eigenVector = v;
    vT = transpose(v);
    eigenValue = (vT*A*v)/(vT*v); % Rayleigh Quotient
    A = A - eigenValue*(v*vT)/(vT*v);
    eigenVectors = [eigenVectors, eigenVector];
    eigenValues = [eigenValues, eigenValue];
  end
end
