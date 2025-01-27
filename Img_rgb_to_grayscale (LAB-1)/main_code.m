%%%%% This code has been developed by Dhanhanjay Pachori (BT22ECE024) 
%%%%% under the coursework Digital Image Processing 
%%%%% under the supervision of Dr. Tapan Kumar Jain
% Clear variables, close figures, and reset the command window
clear all;
close all;
clc;
% Load the image
imdata = imread('rgb_img.jpg');
imshow(imdata);
% Display pixel value at (1,3)
disp(imdata(1,3));
imshow(imdata(:,:,1));
% Extract RGB channels
[r,g,b] = imsplit(imdata);
allBlack = zeros(size(imdata, 1), size(imdata, 2), class(imdata));
% Create isolated channel images
justRed = cat(3, r, allBlack, allBlack);
justGreen = cat(3, allBlack, g, allBlack);
justBlue = cat(3, allBlack, allBlack, b);
% Display isolated channels
montage({justRed, justGreen, justBlue, imdata}, 'ThumbnailSize',[]);