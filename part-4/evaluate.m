function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X, y] = preprocess(path_to_testset, histogram, count_bins);
  col = columns(X);
  mcol = mean(X);
  scol = std(X);
  X(:, 1:col) -= mcol;
  X(:, 1:col) ./= scol;
  col = col + 1;
  X(:, col) = 1;
  newy = X * w;
  nr = sum((sign(newy) == sign(y)));
  percentage = nr / length(y);
endfunction