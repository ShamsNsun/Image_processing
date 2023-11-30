% this function applies the additive gaussian noise to the input image
function result_image = gaussianNoise(input_Image, average, std)
    % reading the input image into a matrix of integers
    img = imread(input_Image);
    % transfering the matrix from integer to double 
    img = im2double(img);
    % saving the numbers of rows and columns of the function
    [rows, cols] = size(img);
    % applying the noise to the functions using the parameters in the
    % imnoise2.m file
    noise = imnoise2('gaussian', rows, cols, average, std);
    result = img + noise;
    %saving the changes into the matrix
    result_image = result;
end
