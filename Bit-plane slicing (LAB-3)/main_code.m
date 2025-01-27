%%%%% This code has been developed by Dhanhanjay Pachori (BT22ECE024) 
%%%%% under the coursework Digital Image Processing 
%%%%% under the supervision of Dr. Tapan Kumar Jain

% Clear variables, close figures, and reset the command window
clear all;
close all;
clc;
% Define the image path and load the grayscale image
imagePath = 'cameraman_image.png'; 
grayImage = imread(imagePath);
% Convert to grayscale if the image is RGB
if size(grayImage, 3) == 3
    grayImage = rgb2gray(grayImage);
end
% Get the size of the grayscale image
[rows, cols] = size(grayImage);
% Create a folder to store bit-plane outputs
outputFolder = 'BitPlaneOutputs';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end
% Display the original grayscale image
figure;
subplot(3, 3, 1);
imshow(grayImage, []);
title('Original Grayscale Image');
imwrite(grayImage, fullfile(outputFolder, 'Original_Grayscale_Image.png'));
% Perform bit-plane slicing and save results
for bp = 0:7
    bitPlaneImage = bitget(grayImage, bp + 1);
    outputFileName = fullfile(outputFolder, sprintf('BitPlane_%d.png', bp));
    imwrite(logical(bitPlaneImage), outputFileName);
    subplot(3, 3, bp + 2); 
    imshow(logical(bitPlaneImage)); 
    title(['Bit Plane ', num2str(bp)]);
end
% Save the figure with all bit-plane slicing results
set(gcf, 'Position', get(0, 'Screensize'));
saveas(gcf, fullfile(outputFolder, 'BitPlane_Slicing_Results.png'));
% Display completion message
disp(['Bit-plane slicing completed. Output saved in folder: ', outputFolder]);