function output_image = adaptiveMedianFilter(input_image, max_filter_size)

    [rows, cols] = size(input_image);
    output_image = zeros(rows, cols);

    for i = 1:rows
        for j = 1:cols
            region = getNeighborhood(input_image, i, j, max_filter_size);
            output_image(i, j) = computeAdaptiveMedian(region);
        end
    end
end

function neighborhood = getNeighborhood(image, x, y, max_filter_size)
    half_filter_size = floor(max_filter_size / 2);
    neighborhood = image(max(1, x - half_filter_size):min(size(image, 1), x + half_filter_size), ...
                         max(1, y - half_filter_size):min(size(image, 2), y + half_filter_size));
end

function result = computeAdaptiveMedian(region)
    [rows, cols] = size(region);
    max_filter_size = numel(region);
    
    z_min = min(region(:));
    z_max = max(region(:));
    z_med = median(region(:));
    
    A1 = z_med - z_min;
    A2 = z_med - z_max;
    
    if A1 > 0 && A2 < 0
        B1 = region - z_min;
        B2 = region - z_max;
        
        result = z_med;
        
        if all(B1(:) > 0) && all(B2(:) < 0)
            return;
        else
            result = computeAdaptiveMedian(region(2:end-1, 2:end-1));
        end
    else
        result = z_med;
    end
end

