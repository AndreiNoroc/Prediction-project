function [w] = learn(X, y, lr, epochs)
  row = rows(X);
  col = columns(X);
  
  mcol = mean(X);
  scol = std(X);
  X(:, 1:col) -= mcol;
  X(:, 1:col) ./= scol;
  col = col + 1;
  X(:, col) = 1;
  
  w = -0.1 + (0.1 + 0.1) * rand(col, 1);
  batch_size = 64;
  for i=1:epochs
    lines = randi([1 row], [batch_size 1]);
    X_batch = X(lines(:, 1), :);
    y_batch = y(lines(:, 1), 1);
    w(1:col, 1) = w(1:col, 1) - (((X_batch(1:batch_size, :) * w - y_batch(1:batch_size, 1))' * X_batch(1:batch_size, 1:col)) .* lr ./ row)';
  endfor
endfunction