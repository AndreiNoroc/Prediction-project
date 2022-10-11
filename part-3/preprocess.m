function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  cats = strcat(path_to_dataset, "cats/");
  x = getImgPaths(cats);
  x_len = rows(x);
  
  not_cats = strcat(path_to_dataset, "not_cats/");
  z = getImgPaths(not_cats);
  z_len = rows(z);
  
  f_len = x_len + z_len;
  
  y = size(f_len, 1);
  y(1:x_len, 1) = 1;
  y(x_len+1:f_len, 1) = -1;
  
  X = size(f_len, 3 * count_bins);
  l = 1:3*count_bins;
  if (strcmp(histogram, 'RGB') == 1)
    C = cellfun(@(elem) rgbHistogram(elem, count_bins), x, "UniformOutput", false);
    X(1:x_len, l) = cat(1, C{:});

    C = cellfun(@(elem) rgbHistogram(elem, count_bins), z, "UniformOutput", false);
    X(x_len+1:f_len, l) = cat(1, C{:});
  elseif (strcmp(histogram, 'HSV') == 1)
    C = cellfun(@(elem) hsvHistogram(elem, count_bins), x, "UniformOutput", false);
    X(1:x_len, l) = cat(1, C{:});

    C = cellfun(@(elem) hsvHistogram(elem, count_bins), z, "UniformOutput", false);
    X(x_len+1:f_len, l) = cat(1, C{:});
  endif
endfunction
