grayImage = imread('cameraman.tif');
bitPlanes = cell(1, 8);
for k = 1:8
bitPlanes{k} = bitget(grayImage, k);
end
figure;
for k = 1:8
subplot(2, 4, k), imshow(logical(bitPlanes{k})), title(['Bit Plane ',num2str(k)]);
end