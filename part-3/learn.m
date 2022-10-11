function [w] = learn(X, y)
  X(:, columns(X) + 1) = 1;
  [Q, R] = Householder(X);
  b = Q' * y;
  w = SST(R, b);
end
