function output_image = medianFilter(input_image, filter_size)
    % Check if the filter size is even, and make it odd if needed
    if mod(filter_size, 2) == 0
        filter_size = filter_size + 1;
    end

    % Get the image size and padding size
    [m, n] = size(input_image); 
    pad_size = (filter_size - 1) / 2;

    % Initialize the output image
    output_image = zeros(m, n);

    % Pad the input image
    padded_image = padarray(input_image, [pad_size, pad_size], 'replicate');

    % Apply median filtering
    for i = 1:m
        for j = 1:n
            % Extract the local region from the padded image
            local_region = padded_image(i:i+filter_size-1, j:j+filter_size-1);
            
            % Compute the median value for the local region and assign it to the output image
            output_image(i, j) = median(local_region(:));
        end
    end
    output_image = uint8(output_image);
end
