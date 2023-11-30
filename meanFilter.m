function result_image = meanFilter(input_image, kernelSize)
    %reading the input image file
    img = imread(input_image);
    averaging_karnel = ones(kernelSize)/(kernelSize^2);
    % Apply the filtering using conv2, since conv is just for 1
    % dimentionall arrays and we are using matrices
    result_image = uint8(conv2(img, averaging_karnel, 'same'));
end