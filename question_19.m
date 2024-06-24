grayImage = imread('cameraman.tif');
% Sharpening using unsharp masking
sharpenedImage = imsharpen(grayImage);
% Edge detection using gradient filters
[gradientX, gradientY] = gradient(double(grayImage));
gradientMagnitude = sqrt(gradientX.^2 + gradientY.^2);
figure, subplot(1,3,1), imshow(grayImage), title('Original Image');
subplot(1,3,2), imshow(sharpenedImage), title('Sharpened Image');
subplot(1,3,3), imshow(gradientMagnitude, []), title('Gradient Magnitude');