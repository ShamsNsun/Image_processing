function result_Image = gaussianFilter(img, std)
    % making a matrix the same size of the the input image but the type of
    % double
    img = double(img);
    [rows, cols] = size(img);
    % making an empty matrix with all zeros 
    result_Image = zeros(rows, cols);
    % calculating the karnel size according to the std 
    kernel = std * 6;
    if mod(kernel, 2) == 0
        kernel = kernel + 1; % making sure the karnel size is odd
    end
    
    % calculating the padding size which is the size of the karnel divided
    % by 2 
    paddingSize = floor(kernel / 2);
    % making the grid of the coordinates x and y 
    [x, y] = meshgrid(-(kernel-1)/2:(kernel-1)/2, -(kernel-1)/2:(kernel-1)/2);

    % making the gaussian karnel calculation 
    % making the sigma which is equal to the standard diviation 
    sigma = std;
    % making the gaussian karnel value according to th equation 
    gaussianKernel = exp(-(x.^2 + y.^2) / (2 * sigma^2));
    gaussianKernel = gaussianKernel / sum(gaussianKernel(:)); % Normalizing the kernel
    

    % applying the gaussian karnel to the image and setting the values into
    % the result image 
    for i = 1:rows
        for j = 1:cols
            if i <= paddingSize || i > rows - paddingSize || j <= paddingSize || j > cols - paddingSize
                result_Image(i, j) = img(i, j);
                continue;
            else
                % making the neighbourhood value 
                neighborhood = img(i-paddingSize:i+paddingSize, j-paddingSize:j+paddingSize);
                % assigning the values to the output image 
                result_Image(i, j) = sum(neighborhood(:) .* gaussianKernel(:));
            end
        end
    end

end