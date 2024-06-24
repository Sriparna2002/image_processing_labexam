% Load the image
I = imread('grayscale_output.jpg'); 

% Display the original image
figure;
subplot(2, 3, 1);
imshow(I);
title('Original Image');

% Convert the image to grayscale if it is a color image
if size(I, 3) == 3
    I_gray = rgb2gray(I);
else
    I_gray = I;
end

% Display the grayscale image
subplot(2, 3, 2);
imshow(I_gray);
title('Grayscale Image');

% Compute the negative of the grayscale image
I_gray_negative = imcomplement(I_gray);

% Display the negative grayscale image
subplot(2, 3, 3);
imshow(I_gray_negative);
title('Negative Grayscale Image');

% Convert the grayscale image to binary using a threshold
threshold = graythresh(I_gray);
I_binary = imbinarize(I_gray, threshold);

% Display the binary image
subplot(2, 3, 4);
imshow(I_binary);
title('Binary Image');

% Compute the negative of the binary image
I_binary_negative = imcomplement(I_binary);

% Display the negative binary image
subplot(2, 3, 5);
imshow(I_binary_negative);
title('Negative Binary Image');

% Save the images (optional)
imwrite(I_gray, 'grayscale_image.jpg');
imwrite(I_gray_negative, 'negative_grayscale_image.jpg');
imwrite(I_binary, 'binary_image.jpg');
imwrite(I_binary_negative, 'negative_binary_image.jpg');

% Link axes of all subplots for zoom/pan consistency
linkaxes(findall(gcf,'Type','axes'),'xy');
