% this function  applies the salt and pepper noising to the image
function result_image = saltpepperNoise(input_Image, a, b)
    % transfering the matrix from integer to double 
    img = imread(input_Image);
    %checking if the size of the third dimention of the image and
    %accordingly transfers the image from rgb to gray colors 
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    % saving the numbers of rows and columns of the function
    [rows, cols, ~] = size(img);
    %applying the salt and pepper noise 
    noise = imnoise2('salt & pepper', rows, cols, a, b);
    %applying the pepper and salt coordinates using boolean operations 
    pepper = (noise == 0);
    salt = (noise == 1)
    noisy_Img = img;
    %applying the salt and pepper noise to the image 
    noisy_Img(pepper) = 0;  
    noisy_Img(salt) = 255;  
    result_image = uint8(noisy_Img);

end

