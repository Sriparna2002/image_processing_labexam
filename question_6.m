% Read the input image
image = imread('grayscale_output.jpg');

% Display the original image
figure;
subplot(1, 3, 1);
imshow(image);
title('Original Image');

% Convert to grayscale if the image is in color
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Apply a Gaussian filter to the image
% 'fspecial' creates a Gaussian filter
h = fspecial('gaussian', [15, 15], 2.0); % Adjust the filter size and sigma as needed
filtered_image = imfilter(image, h);

% Display the filtered image
subplot(1, 3, 2);
imshow(filtered_image);
title('Filtered Image (Low-pass)');

% Display the difference to show the high-frequency components removed
high_freq_image = imsubtract(image, filtered_image);

subplot(1, 3, 3);
imshow(high_freq_image, []);
title('High-frequency Components');

% Adjust the layout for better visualization
sgtitle('High-frequency Component Elimination');
