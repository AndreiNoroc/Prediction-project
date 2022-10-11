function [cost] = compute_cost_pc(points, centroids)
  row = rows(points);
  col = columns(points);
  rowcentr = rows(centroids);
  cost = 0;
  for i=1:row
    dif = centroids - ones(rowcentr, 1) * points(i, 1:col);
    minCost = inf;
    for j=1:rowcentr
      minCost = min(minCost, sqrt(dif(j, 1:col) * dif(j, 1:col)'));
    endfor
    cost += minCost; 
  endfor
endfunction

