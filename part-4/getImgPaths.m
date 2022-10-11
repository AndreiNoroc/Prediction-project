function [ imgs ]  = getImgPaths(directory)
	path_to_imgs = strcat( directory,  '*jpg');
	img_files = dir(path_to_imgs);
  imgs = cellfun(@(elem) strcat(directory, elem.name), num2cell(img_files), "UniformOutput", false);
end