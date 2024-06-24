% Load the image
I = imread('grayscale_output.jpg'); 

% Convert the image to grayscale if it is a color image
if size(I, 3) == 3
    I_gray = rgb2gray(I);
else
    I_gray = I;
end

% Apply a median filter to reduce noise
I_filt = medfilt2(I_gray, [3 3]);

% Compute the gradient magnitude using the Sobel operator
gmag = imgradient(I_filt, 'sobel');

% Compute the watershed transform of the gradient magnitude
L = watershed(gmag);

% Mark the foreground objects
se = strel('disk', 20);
Io = imopen(I_filt, se);
Ioc = imclose(Io, se);
Iobrd = imerode(Ioc, se);
Iobrcbr = imreconstruct(Iobrd, I_filt);

% Compute the regional maxima of the reconstructed image
fgm = imregionalmax(Iobrcbr);

% Modify the foreground marker image
fgm = imclose(fgm, ones(5, 5));
fgm = imerode(fgm, ones(5, 5));
fgm = bwareaopen(fgm, 20);

% Create markers for the watershed transform
D = bwdist(~fgm);
DL = watershed(D);
bgm = DL == 0;

% Create a binary mask
mask = imextendedmin(I_filt, 2);
I_mod = imimposemin(gmag, bgm | mask);

% Perform the watershed transform
L = watershed(I_mod);

% Label the objects in the original image
Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');

% Display the result
imshow(Lrgb, 'InitialMagnification', 'fit');
title('Watershed Segmentation');

% Overlay the segmented regions on the original image
figure;
imshow(I);
hold on;
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
title('Overlay of Segmented Regions');
