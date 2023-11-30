% this function applies the additive Exponential noise to an image
% taking the following parameters 
% input_Image: a matrix of integers
function result_image = exponentialNoise(input_Image, a, b)
    % reading the input image into a matrix of integers
    img = imread(input_Image);
    % transfering the matrix from integer to double 
    img = im2double(img);
    % saving the numbers of rows and columns of the function
    [rows, cols] = size(img);
    % applying the noise to the functions using the parameters in the
    % imnoise2.m file
    noise = imnoise2('exponential', rows, cols, a, b);
    result = img + noise;
    %saving the changes into the matrix
    result_image = result; 
end
