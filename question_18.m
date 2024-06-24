grayImage = imread('cameraman.tif');
% Mean filter
meanFiltered = imfilter(grayImage, fspecial('average', [5 5]));
% Median filter
medianFiltered = medfilt2(grayImage, [5 5]);
figure, subplot(1,3,1), imshow(grayImage), title('Original Image');
subplot(1,3,2), imshow(meanFiltered), title('Mean Filtered Image');
subplot(1,3,3), imshow(medianFiltered), title('Median Filtered Image');