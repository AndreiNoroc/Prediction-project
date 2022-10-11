function [H S V] = RGB2HSV(R, G, B)
  row = rows(R);

  matrgb = [ ];
  matrgb = [matrgb; (R ./ 255)'];
  matrgb = [matrgb; (G ./ 255)'];
  matrgb = [matrgb; (B ./ 255)'];
  matrgb = double(matrgb);
  V = maxrgb = max(matrgb);
  V = V';
  minrgb = min(matrgb);
  difmaxmin = maxrgb - minrgb;
  
  S = H = zeros(1, row);

  indmaxdifzero = find(maxrgb > 0);
  parc_ind = 1:length(indmaxdifzero);
  S(1, indmaxdifzero(1, parc_ind)) = difmaxmin(1, indmaxdifzero(1, parc_ind)) ./ maxrgb(1, indmaxdifzero(1, parc_ind));
  S = S';
  
  inddifdifzero = find(difmaxmin > 0);
  
  r = intersect(find(maxrgb(1, :) == matrgb(1, :)), inddifdifzero);
  if (length(r) > 0)
    parc_r = 1:length(r);
    H(1, r(1, parc_r)) = mod((matrgb(2, r(1, parc_r)) - matrgb(3, r(1, parc_r))) ./ difmaxmin(1, r(1, parc_r)), 6) / 6;
  endif
  
  g = intersect(find(maxrgb(1, :) == matrgb(2, :)), inddifdifzero);
  if (length(g) > 0)
    parc_g = 1:length(g);
    H(1, g(1, parc_g)) = ((matrgb(3, g(1, parc_g)) - matrgb(1, g(1, parc_g))) ./ difmaxmin(1, g(1, parc_g)) + 2) / 6;
  endif
  
  b = intersect(find(maxrgb(1, :) == matrgb(3, :)), inddifdifzero);
  if (length(b) > 0)
    parc_b = 1:length(b);
    H(1, b(1, parc_b)) = ((matrgb(1, b(1, parc_b)) - matrgb(2, b(1, parc_b))) ./ difmaxmin(1, b(1, parc_b)) + 4) / 6;
  endif

  H = H';
endfunction