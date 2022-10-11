function [x] = SST(A, b)
  row = rows(A);
  col = columns(A);
  x = zeros(col, 1);
  for i=col:-1:1
      x(i,1)=(b(i)-A(i,i+1:col)*x(i+1:col,1))/A(i,i);
      row--;
  endfor
end
    