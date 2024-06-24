grayImage = imread('cameraman.tif');
% Sobel operator
edgesSobel = edge(grayImage, 'sobel');
% Prewitt operator
edgesPrewitt = edge(grayImage, 'prewitt');
% Canny operator
edgesCanny = edge(grayImage, 'canny');
% Display results
figure, subplot(1,3,1), imshow(edgesSobel), title('Sobel');
subplot(1,3,2), imshow(edgesPrewitt), title('Prewitt');
subplot(1,3,3), imshow(edgesCanny), title('Canny');