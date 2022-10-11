function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X, y] = preprocess(path_to_testset, histogram, count_bins);
  X(:, columns(X) + 1) = 1;
  newy = X * w;
  poz_elem = (sign(newy()) == sign(y));
  nr = sum(poz_elem);
  percentage = nr / length(y);
endfunction