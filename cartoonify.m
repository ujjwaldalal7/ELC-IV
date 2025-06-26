clc;
clear;

cam = webcam;
disp('Real-time Cartoonify (Final Enhanced) started. Press Ctrl+C to stop.');

figure;
frame_count = 0;

try
    while true
        frame_count = frame_count + 1;

        % Step 1: Capture and resize
        img = snapshot(cam);
        img = imresize(img, 1); 

        % Step 2: Skip every 3rd frame
        if mod(frame_count, 3) == 0
            continue;
        end
        smooth = imbilatfilt(img);  

        % Step 3: Better quantization (keep detail)
        quantized = floor(double(smooth) / 32) * 32;  % 8-bit step
        quantized = uint8(quantized);

        % Step 4: Smarter edge detection
        try
            gray = adapthisteq(rgb2gray(img));         % enhance contrast
            blurred = medfilt2(gray, [3 3]);            % denoise

            if std2(blurred) < 1
                continue;
            end

            edges = edge(blurred, 'Canny', [0.08, 0.2]);    % adjusted for detail
            edges = imdilate(edges, strel('line', 2, 90));  % thin vertical edge boost
            edges = imcomplement(edges);
        catch
            disp('Edge detection failed. Skipping frame.');
            continue;
        end

        % Step 5: Merge
        edges3 = uint8(repmat(edges, [1, 1, 3])) * 255;
        cartoon = uint8(double(quantized) .* double(edges3) / 255);

        % Step 6: Show
        try
            imshow(cartoon);
            title('Live Cartoonified Video');
            drawnow;
        catch
            disp('Display interrupted.');
            break;
        end
    end

catch
    disp('Program manually stopped.');
end

clear cam
disp('Webcam released.');
