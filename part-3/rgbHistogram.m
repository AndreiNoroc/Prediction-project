function [sol] = rgbHistogram(path_to_image, count_bins)
  sol = [ ];
  img = double(imread(path_to_image));
  bin = 256 / count_bins;
  IR = idivide(img(:,:,1), bin) .+ 1;
  IG = idivide(img(:,:,2), bin) .+ 1;
  IB = idivide(img(:,:,3), bin) .+ 1;
  histR = accumarray(IR(:), 1, [count_bins 1]);
  histG = accumarray(IG(:), 1, [count_bins 1]);
  histB = accumarray(IB(:), 1, [count_bins 1]);
  sol = [sol, histR'];
  sol = [sol, histG'];
  sol = [sol, histB'];
end