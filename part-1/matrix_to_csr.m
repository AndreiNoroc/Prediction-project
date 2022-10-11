function [values, colind, rowptr] = matrix_to_csr(A)
  n = length(A);
  values = [];
  colind = [];
  rowptr = length(n + 1);
  nr = 0;
  for i=1:n
    ok = 1;
    for j=1:n
      if (A(i, j) != 0)
        values = [values, A(i, j)];
        colind = [colind, j];
        if (ok == 1)
          rowptr(i) = length(values);
          ok = 0;
        endif
      endif
    endfor
  endfor
  rowptr(n + 1) = length(values) + 1;
endfunction