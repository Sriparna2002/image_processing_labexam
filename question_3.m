grayImage = imread('cameraman.tif');
% Apply median filter
filteredImage = medfilt2(grayImage);
% Edge detection using Sobel operator
edges = edge(filteredImage, 'sobel');
imshow(edges);
title('Edge Detection after NonLinear Filtering');