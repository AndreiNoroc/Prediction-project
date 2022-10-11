function [sol] = hsvHistogram(path_to_image, count_bins)
  sol = [ ];
  img = double(imread(path_to_image));
  R = img(:,:,1);
  G = img(:,:,2);
  B = img(:,:,3);
  [H S V] = RGB2HSV(R(:), G(:), B(:));
  bin = 1.01 / count_bins;
  IH = idivide(H, bin) + 1;
  IS = idivide(S, bin) + 1;
  IV = idivide(V, bin) + 1;
  histH = accumarray(IH, 1, [count_bins 1]);
  histS = accumarray(IS, 1, [count_bins 1]);
  histV = accumarray(IV, 1, [count_bins 1]);
  sol = [sol, histH'];
  sol = [sol, histS'];
  sol = [sol, histV'];
end