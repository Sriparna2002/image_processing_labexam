colorImage = imread('peppers.png');
imshow(colorImage);
title('Color Image');
imwrite(colorImage, 'color_output.jpg');