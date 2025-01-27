%%%%% This code has been developed by Dhanhanjay Pachori (BT22ECE024) 
%%%%% under the coursework Digital Image Processing 
%%%%% under the supervision of Dr. Tapan Kumar Jain

clear all;
close all;
clc;
I = imread('human_img.jpeg');
if size(I, 3) == 3
    I = rgb2gray(I);
end
equalized_image = histeq(I);
figure;
subplot(2, 2, 1);
imshow(I);
title('Original Image');
subplot(2, 2, 2);
imshow(equalized_image);
title('Equalized Image');
subplot(2, 2, 3);
imhist(I);
title('Original Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');
subplot(2, 2, 4);
imhist(equalized_image);
title('Equalized Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');
