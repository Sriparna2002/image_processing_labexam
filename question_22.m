% Read the grayscale image
grayImage = imread('cameraman.tif');
grayImage = im2double(grayImage); % Convert to double precision

% Define the intensity range for slicing
lowerBound = 0.3;
upperBound = 0.6;

% Create an output image initialized to zeros (same size as the input image)
slicedImage = zeros(size(grayImage));

% Apply intensity slicing
slicedImage((grayImage >= lowerBound) & (grayImage <= upperBound)) = 1;

% Display the original and sliced images
figure;
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 2, 2);
imshow(slicedImage);
title('Intensity Sliced Image');

% Highlighting the intensity range by adding a specific value (enhancement)
enhancedImage = grayImage;
enhancedImage((grayImage >= lowerBound) & (grayImage <= upperBound)) = 1;

% Display the enhanced image
figure;
imshow(enhancedImage);
title('Enhanced Image with Intensity Slicing');
