% Read the input image
image = imread('grayscale_output.jpg');

% Convert to grayscale if the image is in color
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Display the original image
figure;
subplot(2,2,1);
imshow(image);
title('Original Image');

% Perform a single-level 2D discrete wavelet transform
[LL, LH, HL, HH] = dwt2(image, 'haar'); % Using 'haar' wavelet

% Display the approximation (LL) and detail coefficients (LH, HL, HH)
subplot(2,2,2);
imshow(LL, []);
title('Approximation Coefficients (LL)');

subplot(2,2,3);
imshow(LH, []);
title('Horizontal Detail Coefficients (LH)');

subplot(2,2,4);
imshow(HL, []);
title('Vertical Detail Coefficients (HL)');

figure;
imshow(HH, []);
title('Diagonal Detail Coefficients (HH)');
