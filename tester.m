filename = 'Lena.pgm'; % Replace with your .pgm file
noise_amplitude = 0.1;



std = 0.96;
AF = averageFiltering(filename, 7); 
figure;
% making a loop to display the pics in one figure 

    % displaying the output for each size of the karnel averaging
    subplot(1, 2, 1);
    imshow(filename);
    title(['original img ']);

%     subplot(1, 3, 2);
%     imshow(AUN);
%     title(['AUN ']);

    subplot(1, 2, 2);
    imshow(AF);
    title(['af']);

% subplot(1, 2, 2);
% imagesc(AUN);
% colorbar;
% title('Converted Matrix (Double Precision)');
% axis equal;
% axis tight;