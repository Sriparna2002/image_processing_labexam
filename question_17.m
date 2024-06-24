% Load an example grayscale image (replace with your own image path if needed)
image = imread('cameraman.tif');

% Convert image to double precision for accurate calculations
image_double = double(image);

% Compute mean and standard deviation
mean_value = mean(image_double(:));
std_deviation = std(image_double(:));

% Compute correlation coefficient (since it's the image with itself, it will be 1)
correlation_coefficient = 1;

% Display results
fprintf('Mean of the image: %.2f\n', mean_value);
fprintf('Standard deviation of the image: %.2f\n', std_deviation);
fprintf('Correlation coefficient of the image: %.2f\n', correlation_coefficient);

% Display the original image
figure;
imshow(image, []);
title('Original Image');

% Show mean and std deviation on the image
text(10, 20, sprintf('Mean: %.2f', mean_value), 'Color', 'red', 'FontSize', 12);
text(10, 40, sprintf('Std Dev: %.2f', std_deviation), 'Color', 'red', 'FontSize', 12);

% Show correlation coefficient on the image
text(10, 60, sprintf('Corr Coef: %.2f', correlation_coefficient), 'Color', 'red', 'FontSize', 12);
