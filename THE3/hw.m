open power_method;
A = [2 -1  0  0  0;
    -1  2 -1  0  0;
     0 -1  2 -1  0;
     0  0 -1  2 -1;
     0  0  0 -1  2];

x = ones([length(A), 1]);

[eigenValue, eigenVector] = power_method(A, x);
disp("Largest eigenvalue of A:");
disp(eigenValue);
disp("Corresponding eigenvector:");
disp(eigenVector);

open inverse_power;
alfa = 0;
[eigenValue2, eigenVector2] = inverse_power(A, alfa);
disp("Smallest eigenvalue of A:");
disp(eigenValue2);
disp("Corresponding eigenvector:");
disp(eigenVector2);

B = [0.2  0.3 -0.5;
     0.6 -0.8  0.2;
    -1.0, 0.1  0.9];

x = ones([length(B), 1]);

[eigenValue, eigenVector] = power_method(B, x);
disp("Largest eigenvalue of B:");
disp(eigenValue);
disp("Corresponding eigenvector:");
disp(eigenVector);

open power_k;
open subspace_iteration;

can = load("can_229.mat");
can = full(can.Problem.A);

k = 10;

t_power1 = tic();
[eigenValues, eigenVectors] = power_k(can, k);
t_powerk = toc(t_power1);
fprintf("Total runtime of power_k method when k is 10 : %f \n",t_powerk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

t_sub1 = tic();
[eigenValues, eigenVectors] = subspace_iteration(can, k);
t_subk = toc(t_sub1);
fprintf("Total runtime of subspace_iteration method when k is 10 : %f \n",t_subk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end


k = 20;

t_power1 = tic();
[eigenValues, eigenVectors] = power_k(can, k);
t_powerk = toc(t_power1);
fprintf("Total runtime of power_k method when k is 20 : %f \n",t_powerk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

t_sub1 = tic();
[eigenValues, eigenVectors] = subspace_iteration(can, k);
t_subk = toc(t_sub1);
fprintf("Total runtime of subspace_iteration method when k is 20 : %f \n",t_subk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end


k = 50;

t_power1 = tic();
[eigenValues, eigenVectors] = power_k(can, k);
t_powerk = toc(t_power1);
fprintf("Total runtime of power_k method when k is 50 : %f \n",t_powerk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

t_sub1 = tic();
[eigenValues, eigenVectors] = subspace_iteration(can, k);
t_subk = toc(t_sub1);
fprintf("Total runtime of subspace_iteration method when k is 50 : %f \n",t_subk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end


k = 100;

t_power1 = tic();
[eigenValues, eigenVectors] = power_k(can, k);
t_powerk = toc(t_power1);
fprintf("Total runtime of power_k method when k is 100 : %f \n",t_powerk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

t_sub1 = tic();
[eigenValues, eigenVectors] = subspace_iteration(can, k);
t_subk = toc(t_sub1);
fprintf("Total runtime of subspace_iteration method when k is 100 : %f \n",t_subk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

k = 200;

t_power1 = tic();
[eigenValues, eigenVectors] = power_k(can, k);
t_powerk = toc(t_power1);
fprintf("Total runtime of power_k method when k is 200 : %f \n",t_powerk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

t_sub1 = tic();
[eigenValues, eigenVectors] = subspace_iteration(can, k);
t_subk = toc(t_sub1);
fprintf("Total runtime of subspace_iteration method when k is 200 : %f \n",t_subk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

k = 229;

t_power1 = tic();
[eigenValues, eigenVectors] = power_k(can, k);
t_powerk = toc(t_power1);
fprintf("Total runtime of power_k method when k is 229 : %f \n",t_powerk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end

t_sub1 = tic();
[eigenValues, eigenVectors] = subspace_iteration(can, k);
t_subk = toc(t_sub1);
fprintf("Total runtime of subspace_iteration method when k is 229 : %f \n",t_subk);
for i = 1:10
  fprintf("%d'th largest eigenvalue is %f \n",i,eigenValues(i));
end
