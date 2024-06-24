% Read the grayscale image
grayImage = imread('cameraman.tif');

% Step 1: DCT Compression
% Perform 2D DCT on the image
dctTransformed = dct2(grayImage);

% Thresholding small DCT coefficients
dctThreshold = dctTransformed;
dctThreshold(abs(dctThreshold) < 10) = 0;

% Inverse DCT to get the compressed image
compressedImageDCT = idct2(dctThreshold);

% Display the DCT Compressed Image
figure;
imshow(uint8(compressedImageDCT));
title('DCT Compressed Image');

% Step 2: DPCM Encoding
% Flatten the DCT coefficients to a 1D array
dctFlattened = dctThreshold(:);

% Differential Pulse Code Modulation (DPCM)
dpcmEncoded = [dctFlattened(1); diff(dctFlattened)];

% Quantization (simple rounding in this case)
quantizedDPCM = round(dpcmEncoded);

% Step 3: Huffman Coding
% Calculate the frequency of each unique value
symbols = unique(quantizedDPCM);
counts = histc(quantizedDPCM, symbols);

% Create a Huffman dictionary based on symbol frequencies
[dict, avglen] = huffmandict(symbols, counts / numel(quantizedDPCM));

% Encode the quantized DPCM coefficients using the Huffman dictionary
huffmanEncoded = huffmanenco(quantizedDPCM, dict);

% Display the compression results
disp(['Original Image Size: ', num2str(numel(grayImage)), ' bytes']);
disp(['DCT Compressed Image Size: ', num2str(numel(compressedImageDCT)), ' bytes']);
disp(['DPCM Encoded Size: ', num2str(numel(dpcmEncoded)), ' values']);
disp(['Huffman Encoded Size: ', num2str(numel(huffmanEncoded)), ' bits']);

% For reconstruction (Decoding)
% Decode Huffman
huffmanDecoded = huffmandeco(huffmanEncoded, dict);

% Decode DPCM
dpcmDecoded = cumsum(huffmanDecoded);

% Reshape to original DCT coefficient matrix
dctReconstructed = reshape(dpcmDecoded, size(dctTransformed));

% Inverse DCT to reconstruct the image
reconstructedImage = idct2(dctReconstructed);

% Display the reconstructed image
figure;
imshow(uint8(reconstructedImage));
title('Reconstructed Image after DPCM and Huffman Decoding');
