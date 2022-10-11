function [A, b] = generate_probabilities_system(rows)
  n = rows * (rows + 1) / 2;
  A = zeros(n, n);
  b = zeros(n, 1);
  b(n - rows + 1 : n, 1) = 1;
  A(1, 1) = 4;
  A(1, 2) = A(1, 3) = -1;
  poz = 2;
  for i=2:rows-1
    A(poz, poz) = 5;
    A(poz, poz - i + 1) = -1;
    A(poz, poz + 1) = -1;
    A(poz, poz + i) = -1;
    A(poz, poz + i + 1) = -1;
    for j=poz+1:poz+i-2
      A(j, j) = 6;
      A(j, j - i) = -1;
      A(j, j - i + 1) = -1;
      A(j, j - 1) = -1;
      A(j, j + 1) = -1;
      A(j, j + i) = -1;
      A(j, j + i + 1) = -1;
    endfor
    poz = poz + i - 1;
    A(poz, poz) = 5;
    A(poz, poz - i) = -1;
    A(poz, poz - 1) = -1;
    A(poz, poz + i) = -1;
    A(poz, poz + i + 1) = -1;
    poz = poz + 1;
  endfor
  A(poz, poz) = 4;
  A(poz, poz - rows + 1) = -1;
  A(poz, poz + 1) = -1;
  for i=poz+1:n-1
    A(i, i) = 5;
    A(i, i - 1) = -1;
    A(i, i + 1) = -1;
    A(i, i - rows) = -1;
    A(i, i - rows + 1) = -1;
  endfor
  poz = poz + rows - 1;
  A(poz, poz) = 4;
  A(poz, poz - rows) = -1;
  A(poz, poz - 1) = -1;
endfunction