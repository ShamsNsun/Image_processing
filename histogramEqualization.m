% File: histogramEqualization.m

function equalization = histogramEqualization(img)
    if ischar(img) || isstring(img)
        input_img = imread(img);
    elseif isnumeric(img)
        input_img = img;  % Assuming img is the image matrix
    else
        error('Invalid input for image');
    end
    
    % Perform histogram equalization on the input_img
    histogram = zeros(256, 1);
    [row, col] = size(input_img);

    for i = 1:row
        for j = 1:col
            pixelColor = input_img(i, j);
            histogram(pixelColor + 1) = histogram(pixelColor + 1) + 1;
        end
    end

    cdf = zeros(256, 1);
    cdf(1) = histogram(1);
    for i = 2:256
        cdf(i) = cdf(i - 1) + histogram(i);
    end

    cdf = uint8((cdf - min(cdf)) * 255 / (max(cdf) - min(cdf)));
    equalization = cdf(input_img + 1);
end
