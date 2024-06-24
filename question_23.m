grayImage = imread('cameraman.tif');
edgesCanny = edge(grayImage, 'canny');
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');
subplot(1, 2, 2);
imshow(edgesCanny);
title('Canny Edge Detection');