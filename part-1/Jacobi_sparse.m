function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  x = zeros(length(G_rowptr) - 1, 1);
  x_prev = zeros(length(G_rowptr) - 1, 1);
  while 1
    x = csr_multiplication(G_values, G_colind, G_rowptr, x_prev) + c;
    err = sqrt((x - x_prev)' * (x - x_prev));
    if (err < tol)
      return;
    endif
    x_prev = x;
  endwhile
endfunction