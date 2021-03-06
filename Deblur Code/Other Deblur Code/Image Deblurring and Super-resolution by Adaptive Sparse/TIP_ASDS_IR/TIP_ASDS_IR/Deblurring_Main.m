%----------------------------------------------------
% Sparse modeling with adaptive sparse domain selection 
% For Image Deblurring
% Data: Nov. 20, 2010
% Author: Weisheng Dong, Lei Zhang, {wsdong@mail.xidian.edu.cn; cslzhang@comp.polyu.edu.hk}
%----------------------------------------------------
clc;
clear;
close all;
addpath('Codes\PCA_functions');
addpath('Codes\Utilities');


Test_image_dir     =    'Data\TestData';

blur_type          =    1;          % 1: uniform blur kernel;  2: Gaussian blur kernel; 

if blur_type == 1                   % When blur_type = 1, blur_par denotes the kernel size; When blur_type = 2, blur_par denotes the standard variance of Gaussian kernel
    blur_par       =    3;          % the default blur kernel size is 9 for uniform blur;
    Output_dir         =    'Data\TestData';
else
    blur_par       =    1;          % the default standard deviation of Gaussian blur kernel is 3
    Output_dir         =    'Data\TestData'; 
end

nSig               =    sqrt(2);    % The standard variance of the additive Gaussian noise;
method             =    2;          % 0: ASDS;  1: ASDS_AR;  2: ASDS_AR_NL;
dict               =    2;          % 1: dictionary 1 trained from dataset 1; 2: dictionary 2 trained from dataset 2;

image_name         =    'GroundTruth_0023.tif';    % input the test image name;

blur_dir           =    'Data\TestData';
blur_name          =    'NML_Denoise.tif';

% The following codes start to perform the deblurring experiment with the above input parameters;

[im PSNR SSIM]   =   Image_Deblurring(method, dict, nSig, Output_dir, Test_image_dir, image_name, blur_type, blur_par, blur_dir, blur_name);

disp( sprintf('%s: PSNR = %3.2f  SSIM = %f\n', image_name, PSNR, SSIM) ); 
