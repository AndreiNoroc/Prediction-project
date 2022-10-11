function [G_J, c_J] = Jacobi_factorization(A, b)
  N = diag(diag(A));
  P = N - A;
  G_J = N ^ -1 * P;
  c_J = N ^ -1 * b;
endfunction
