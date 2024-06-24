% Read the grayscale image
grayImage = imread('cameraman.tif');
grayImage = im2double(grayImage); % Convert to double precision

% Add Gaussian noise to the image
noisyImage = imnoise(grayImage, 'gaussian', 0, 0.01);

% Display the original and noisy images
figure;
subplot(2, 3, 1);
imshow(grayImage);
title('Original Image');

subplot(2, 3, 2);
imshow(noisyImage);
title('Noisy Image');

% 1. Mean Filtering
meanFilter = fspecial('average', [3 3]);
meanFiltered = imfilter(noisyImage, meanFilter, 'replicate');

% Display the mean filtered image
subplot(2, 3, 3);
imshow(meanFiltered);
title('Mean Filtered Image');

% 2. Median Filtering
medianFiltered = medfilt2(noisyImage, [3 3]);

% Display the median filtered image
subplot(2, 3, 4);
imshow(medianFiltered);
title('Median Filtered Image');

% 3. Wiener Filtering
wienerFiltered = wiener2(noisyImage, [5 5]);

% Display the Wiener filtered image
subplot(2, 3, 5);
imshow(wienerFiltered);
title('Wiener Filtered Image');