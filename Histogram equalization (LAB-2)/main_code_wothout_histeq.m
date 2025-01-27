%%%%% This code has been developed by Dhanhanjay Pachori (BT22ECE024) 
%%%%% under the coursework Digital Image Processing 
%%%%% under the supervision of Dr. Tapan Kumar Jain

% Clear variables, close figures, and reset the command window
clear all;
close all;
clc;
% Load the image
image = imread('human_img.jpeg');
% Check if the image is RGB and convert to grayscale if necessary
if size(image, 3) == 3
    image = rgb2gray(image);
end
% Initialize histogram with 256 bins
histogram = zeros(1, 256);
% Get the dimensions of the grayscale image
[rows, cols] = size(image);
% Calculate the histogram
for ii = 1:rows
    for jj = 1:cols
        intensity = image(ii, jj);
        histogram(intensity + 1) = histogram(intensity + 1) + 1; 
    end
end
% Compute the cumulative distribution function (CDF)
cdf = cumsum(histogram);
cdf_min = min(cdf);
cdf_max = max(cdf);
% Normalize the CDF to range [0, 255]
h_v = round((cdf - cdf_min) / (cdf_max - cdf_min) * 255);
% Perform histogram equalization
equalized_image = zeros(size(image), 'uint8');
for ii = 1:rows
    for jj = 1:cols
        intensity = image(ii, jj);
        equalized_image(ii, jj) = h_v(intensity + 1);
    end
end
% Display results: original image, original histogram, equalized image, and equalized histogram
figure;
% Display the original grayscale image
subplot(2, 2, 1);
imshow(image);
title('Original Image');
% Display the histogram of the original image
subplot(2, 2, 2);
bar(0:255, histogram, 'BarWidth', 1, 'FaceColor', 'b');
hold on;
% Overlay the normalized CDF on the histogram
normalized_cdf = cdf / max(cdf) * max(histogram);
plot(0:255, normalized_cdf, 'r', 'LineWidth', 1.5);
hold off;
xlabel('Pixel Intensity');
ylabel('Frequency');
title('Histogram of Original Image');
% Display the histogram-equalized image
subplot(2, 2, 3);
imshow(equalized_image);
title('Equalized Image');
% Display the histogram of the equalized image
subplot(2, 2, 4);
imhist(equalized_image);
title('Histogram of Equalized Image');
xlabel('Pixel Intensity');
ylabel('Frequency');
