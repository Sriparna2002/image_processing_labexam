% Load an example grayscale image (replace with your own image path if needed)
image = imread('cameraman.tif');

% Convert image to double precision for FFT computation
image_double = double(image);

% Compute 2-D FFT
fft_result = fft2(image_double);

% Shift the zero frequency component to the center
fft_result_shifted = fftshift(fft_result);

% Compute magnitude spectrum (absolute values, logarithmic scale for better visualization)
magnitude_spectrum = log(1 + abs(fft_result_shifted));

% Display the original image and its FFT magnitude spectrum
figure;

% Display the original image
subplot(1, 2, 1);
imshow(image, []);
title('Original Image');

% Display the magnitude spectrum of FFT
subplot(1, 2, 2);
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum of FFT');

% Label axes
xlabel('Frequency (u)');
ylabel('Frequency (v)');
