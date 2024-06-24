% Load the image
I = imread('cameraman.tif');

% Display the original image
figure;
subplot(2, 3, 1);
imshow(I);
title('Original Image');

% Translation
% Create a translation matrix
tx = 30; % translation along x-axis
ty = 50; % translation along y-axis
translationMatrix = [1 0 0; 0 1 0; tx ty 1];
tformTranslate = affine2d(translationMatrix);

% Apply the translation transformation
I_translate = imwarp(I, tformTranslate);

% Display the translated image
subplot(2, 3, 2);
imshow(I_translate);
title('Translated Image');

% Rotation
% Define the rotation angle (in degrees)
angle = 45;
tformRotate = affine2d([cosd(angle) sind(angle) 0; -sind(angle) cosd(angle) 0; 0 0 1]);

% Apply the rotation transformation
I_rotate = imwarp(I, tformRotate);

% Display the rotated image
subplot(2, 3, 3);
imshow(I_rotate);
title('Rotated Image');

% Scaling
% Define the scaling factors
scaleX = 1.5;
scaleY = 1.5;
scalingMatrix = [scaleX 0 0; 0 scaleY 0; 0 0 1];
tformScale = affine2d(scalingMatrix);

% Apply the scaling transformation
I_scale = imwarp(I, tformScale);

% Display the scaled image
subplot(2, 3, 4);
imshow(I_scale);
title('Scaled Image');

% Flipping
% Horizontal flip
I_flipH = flip(I, 2);

% Display the horizontally flipped image
subplot(2, 3, 5);
imshow(I_flipH);
title('Horizontally Flipped Image');

% Vertical flip
I_flipV = flip(I, 1);

% Display the vertically flipped image
subplot(2, 3, 6);
imshow(I_flipV);
title('Vertically Flipped Image');
