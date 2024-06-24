grayImage = imread('cameraman.tif');
% Contrast stretching
stretchedImage = imadjust(grayImage, stretchlim(grayImage), []);
% Histogram equalization
equalizedImage = histeq(grayImage);
figure, subplot(1,3,1), imshow(grayImage), title('Original Image');
subplot(1,3,2), imshow(stretchedImage), title('Contrast Stretched Image');
subplot(1,3,3), imshow(equalizedImage), title('Histogram Equalized Image');