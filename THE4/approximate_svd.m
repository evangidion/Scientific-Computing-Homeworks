function [u,s,v] = approximate_svd(A,k)
  [m,n] = size(A);
  p = 5;
  g = randn(n,k+p);
  Y = A*g;
  Q = orth(Y);
  B = transpose(Q)*A;
  [o,s,v] = svd(B);
  u = Q*o;
end
