% Create a binary image
I = zeros(10, 10);
I(5, 5) = 1; % Set a pixel to 1 (object pixel)

% Display the binary image
figure;
subplot(2, 3, 1);
imshow(I);
title('Binary Image');

% 4-connectivity
conn4 = bwconncomp(I, 4);

% Display 4-connectivity result
subplot(2, 3, 2);
imshow(labelmatrix(conn4), []);
title('4-Connectivity');

% 8-connectivity
conn8 = bwconncomp(I, 8);

% Display 8-connectivity result
subplot(2, 3, 3);
imshow(labelmatrix(conn8), []);
title('8-Connectivity');

% Adjacency of a pixel (for demonstration, we will use pixel (5,5))
adj4 = false(size(I));
adj8 = false(size(I));
[x, y] = size(I);
for i = 1:x
    for j = 1:y
        if I(i, j) == 1
            % 4-adjacency
            if i > 1, adj4(i-1, j) = true; end
            if i < x, adj4(i+1, j) = true; end
            if j > 1, adj4(i, j-1) = true; end
            if j < y, adj4(i, j+1) = true; end
            % 8-adjacency
            if i > 1 && j > 1, adj8(i-1, j-1) = true; end
            if i > 1, adj8(i-1, j) = true; end
            if i > 1 && j < y, adj8(i-1, j+1) = true; end
            if j > 1, adj8(i, j-1) = true; end
            if j < y, adj8(i, j+1) = true; end
            if i < x && j > 1, adj8(i+1, j-1) = true; end
            if i < x, adj8(i+1, j) = true; end
            if i < x && j < y, adj8(i+1, j+1) = true; end
        end
    end
end
adj4(5, 5) = true;
adj8(5, 5) = true;

% Display 4-adjacency
subplot(2, 3, 4);
imshow(adj4);
title('4-Adjacency');

% Display 8-adjacency
subplot(2, 3, 5);
imshow(adj8);
title('8-Adjacency');

% Distance Metrics
% Create a binary image with two pixels
D = zeros(10, 10);
D(5, 5) = 1;
D(8, 8) = 1;

% Compute Euclidean distance transform
euclideanDist = bwdist(D, 'euclidean');

% Compute City-block distance transform
cityblockDist = bwdist(D, 'cityblock');

% Compute Chessboard distance transform
chessboardDist = bwdist(D, 'chessboard');

% Display distance metrics
figure;
subplot(1, 3, 1);
imshow(euclideanDist, []);
title('Euclidean Distance');

subplot(1, 3, 2);
imshow(cityblockDist, []);
title('City-block Distance');

subplot(1, 3, 3);
imshow(chessboardDist, []);
title('Chessboard Distance');
