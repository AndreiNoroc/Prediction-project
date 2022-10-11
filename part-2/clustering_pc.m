function [centroids] = clustering_pc(points, NC)
  row = rows(points);
  col = columns(points);
  if (row < NC)
    centroids = points;
  else
    centroids = zeros(NC, col);
    centroidsrow = zeros(NC, 1);
    
    for i=1:row
      poz = mod(i, NC) + 1;
      centroids(poz, 1:col) += points(i, 1:col);
      centroidsrow(poz, 1)++;
    endfor
      
    centroids(1:NC, 1:col) ./= centroidsrow(1:NC, 1);
    
    O = zeros(NC, col);

    while (1)
      actcentroids = zeros(NC, col);
      actcentroidsrow = zeros(NC, 1);
      for i=1:row
        Min = inf;
        ind = -1;
        for j=1:NC
          dif = points(i, 1:col) - centroids(j, 1:col);
          deucl = sqrt(dif * dif');
          if (deucl < Min)
            Min = deucl;
            ind = j;
          endif
        endfor
        actcentroids(ind, 1:col) += points(i, 1:col);
        actcentroidsrow(ind, 1)++;
      endfor
      
      actcentroids(1:NC, 1:col) ./= actcentroidsrow(1:NC, 1);

      if (centroids - actcentroids == O)
        break;
      endif
      
      centroids = actcentroids;
    endwhile
  endif
endfunction