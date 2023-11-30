% this function applies the additive uniform noise to an image
% taking the following parameters 
% input_Image: a matrix of integers
function result_image = uniformNoise(input_Image, a, b)
    % reading the input image into a matrix of integers
    img = imread(input_Image);
    % transfering the matrix from integer to double 
    img = im2double(img);
    % saving the numbers of rows and columns of the function
    [rows, cols] = size(img);
    % applying the noise to the functions using the parameters in the
    % imnoise2.m file
    noise = imnoise2('uniform', rows, cols, a, b);
    result = img + noise;
    %saving the changes into the matrix
    result_image = result; 
end






% % this function applies the additive uniform noise to an image
% % taking the following parameters 
% % input_Image: a matrix of integers
% % noise amplitude: a floating number
% function result_image = additiveUniformNoise(input_Image, noise_amplitude)
%     % making the uniform noise for the matrix that is the same size of the
%     % matrix
%      img = imread(input_Image);
% 
%     applied_noise = -noise_amplitude + (2 * noise_amplitude) * randn(size(img));
%     uniform_noise_image = img + (b - a) * rand(size(img)) + a;
%     % Add the noise to the image
%     result_image = double(img) + applied_noise;
% end