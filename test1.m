clc;clear all;close all;
%% 读取原图像并显示其灰度图
Data = imread('lena.bmp');
grayData = rgb2gray(Data);
figure(1)
subplot(211)
imshow(grayData);title('原始灰度图')
%% 进行二维离散傅里叶变换
grayData = im2double(grayData);
% 用fft函数实现dft
fftData = abs(fft2(grayData)); 
fftData = log(fftData + 1);
% 进行频谱居中
fftData_center_temp = fftshift(fftData);
fftData_center = abs(fftData_center_temp);
fftData_center = log(fftData_center + 1);
% 显示居中后频谱
subplot(212)
imshow(fftData_center,[]);title('二维DFT处理后的居中频谱图')
%% 第一种滤波：理想低通滤波
[freqIdea_lowData,idea_lowData,idea_low_h] = Ideal_low(grayData,100);% 截止频率为30
figure(2)
subplot(231) % 显示原始图像，以便对照
imshow(grayData);title('原始灰度图像')
subplot(232)
imshow(idea_lowData,[]);title('理想低通滤波结果')
%% 第二种滤波：理想高通滤波
[freqIdea_highData,idea_highData,idea_high_h] = Ideal_high(grayData,30);% 截止频率为30
subplot(233)
imshow(idea_highData,[]);title('理想高通滤波结果')
%% 第三种滤波：巴特沃斯低通滤波
[freqBartwaz_lowData,Bartwaz_lowData,Bartwaz_low_h] = Bartwaz_low(fftData_center_temp,1,50);% 截止频率为30
subplot(234)
imshow(Bartwaz_lowData,[]);title('通过巴特沃斯低通滤波的结果')
%% 第四种滤波：巴特沃斯高通滤波
[freqBartwaz_highData,Bartwaz_highData,Bartwaz_high_h] = Bartwaz_high(fftData_center_temp,1,30);% 截止频率为30
subplot(235)
imshow(Bartwaz_highData,[]);title('通过巴特沃斯高通滤波的结果')
%% 第五种滤波：

