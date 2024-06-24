% Open color selection dialog
selected_color = uisetcolor;

% Check if the user canceled the dialog
if length(selected_color) == 1 && selected_color == 0
    disp('No color selected.');
else
    % Display the selected color
    figure;
    patch([0 1 1 0], [0 0 1 1], selected_color);
    title('Selected Color');

    % Extract and display RGB values
    R = selected_color(1);
    G = selected_color(2);
    B = selected_color(3);

    fprintf('Selected Color RGB Values:\n');
    fprintf('R: %.4f\n', R);
    fprintf('G: %.4f\n', G);
    fprintf('B: %.4f\n', B);
end
