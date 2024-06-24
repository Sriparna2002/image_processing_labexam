grayImage = imread('cameraman.tif');
imshow(grayImage);
title('Grayscale Image');
imwrite(grayImage, 'grayscale_output.jpg');
