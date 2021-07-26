% imageprocessing6 频域滤波器设计
clear all;clc;close all ;
ImageDataTemp=imread('lena.bmp');     % 读入图像
ImageDataGray=rgb2gray(ImageDataTemp);%灰度图像
ImageDataGray=im2double(ImageDataGray);
[M,N] = size(ImageDataGray);
D0=30;
%FFT
FImageData=fft2(ImageDataGray);
absFImageDataX=abs(FImageData);%居中前
T=log(absFImageDataX+1);

SFImageData=fftshift(FImageData); %居中后
absSFImageDataX=abs(SFImageData);
ST=log(absSFImageDataX+1); 

figure(1);
subplot(221),imshow(ImageDataGray),title('lena灰度图');
subplot(222),imshow(T,[]),title('原始图像居中前的频谱图');
subplot(223),imshow(ST,[]),title('原始图像居中后的频谱图');
%% 理想低通
m=M/2;n=N/2;         % D
for u=1:M
    for v=1:N
        D(u,v)=sqrt((u-m)^2+(v-n)^2);
    end
end
for u=1:M           % 理想低通
    for v=1:N
        if(D(u,v)<D0) H_ideal_low(u,v)=1; 
        else H_ideal_low(u,v)=0;end
    end
end
for u=1:M           % 理想高通
    for v=1:N
        if(D(u,v)<D0) H_ideal_high(u,v)=0; 
        else H_ideal_high(u,v)=1;end
    end
end
figure(2);
subplot(221),imshow(H_ideal_low,[]),title('理想低通滤波器频谱图')
subplot(222),imshow(H_ideal_high,[]),title('理想高通滤波器频谱图')
%% 巴特沃斯
for u=1:M    %巴特沃斯低通滤波器
    for v=1:N
        H_but_low(u,v)=1/(1+(D(u,v)/D0)^2);
    end
end
for u=1:M    %巴特沃斯高通滤波器
    for v=1:N
        H_but_high(u,v)=1/(1+(D0/D(u,v))^2);
    end
end
subplot(223),imshow(H_but_low,[]),title('巴特沃斯低通滤波器频谱图');
subplot(224),imshow(H_but_high,[]),title('巴特沃斯高通滤波器频谱图');
%% 
%理想低通滤波
ideal_low= H_ideal_low.*ST;
ideal_low1=H_ideal_low.*SFImageData;
ideal_low_result=ifft2(ifftshift(ideal_low1));
%理想高通滤波
ideal_high= H_ideal_high.*ST;
ideal_high1= H_ideal_high.*SFImageData;
ideal_high_result= ifft2(ifftshift(ideal_high1));
%巴特沃斯低通滤波
but_low= H_but_low.*ST;
but_low1= H_but_low.*SFImageData;
but_low_result= ifft2(ifftshift(but_low1));
%巴特沃斯高通滤波
but_high= H_but_high.*ST;
but_high1= H_but_high.*SFImageData;
but_high_result= ifft2(ifftshift(but_high1));
figure(3);
subplot(221);imshow(ideal_low_result,[]),title('理想低通滤波');
subplot(222);imshow(uint8(ideal_high_result*255)),title('理想高通滤波');
subplot(223);imshow(but_low_result,[]),title('巴特沃斯低通滤波');
subplot(224);imshow(uint8(but_high_result*255)),title('巴特沃斯高通滤波');


