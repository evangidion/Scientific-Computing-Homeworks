function [eigenValues, eigenVectors] = subspace_iteration(A, k)
  X = randn([length(A), k]);
  eigenValues = [];
  eigenVectors = [];
  l = 1e3;
  for i = 1:l
    Z = A*X;
    [X,R] = qr(Z);
  end
  eigenVectors = X;
  for j = 1:k
    XjT = transpose(X(:,j));
    eigenValue = (XjT*A*X(:,j))/(XjT*X(:,j)); % Rayleigh Quotient
    eigenValues = [eigenValues, eigenValue];
  end
end
