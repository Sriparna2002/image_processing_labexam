% Load grayscale image
grayscale_image = imread('grayscale_output.jpg');

% Check if the image is already in grayscale, if not convert it
if size(grayscale_image, 3) == 3
    grayscale_image = rgb2gray(grayscale_image);
end

% Display the grayscale image
figure;
subplot(2,2,1);
imshow(grayscale_image);
title('Grayscale Image');

% Compute and display histogram of grayscale image
subplot(2,2,2);
imhist(grayscale_image);
title('Histogram of Grayscale Image');

% Load color image
color_image = imread('peppers.png');

% Display the color image
subplot(2,2,3);
imshow(color_image);
title('Color Image');

% Compute and display histograms for each color channel
subplot(2,2,4);
hold on;
colors = {'Red', 'Green', 'Blue'};
for i = 1:3
    [counts, binLocations] = imhist(color_image(:,:,i));
    plot(binLocations, counts, 'DisplayName', colors{i});
end
hold off;
title('Histograms of Color Image');
legend;

% Adjust the layout for better visualization
sgtitle('Image Histograms');
