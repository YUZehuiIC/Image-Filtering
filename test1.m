clc;clear all;close all;
%% ��ȡԭͼ����ʾ��Ҷ�ͼ
Data = imread('lena.bmp');
grayData = rgb2gray(Data);
figure(1)
subplot(211)
imshow(grayData);title('ԭʼ�Ҷ�ͼ')
%% ���ж�ά��ɢ����Ҷ�任
grayData = im2double(grayData);
% ��fft����ʵ��dft
fftData = abs(fft2(grayData)); 
fftData = log(fftData + 1);
% ����Ƶ�׾���
fftData_center_temp = fftshift(fftData);
fftData_center = abs(fftData_center_temp);
fftData_center = log(fftData_center + 1);
% ��ʾ���к�Ƶ��
subplot(212)
imshow(fftData_center,[]);title('��άDFT�����ľ���Ƶ��ͼ')
%% ��һ���˲��������ͨ�˲�
[freqIdea_lowData,idea_lowData,idea_low_h] = Ideal_low(grayData,100);% ��ֹƵ��Ϊ30
figure(2)
subplot(231) % ��ʾԭʼͼ���Ա����
imshow(grayData);title('ԭʼ�Ҷ�ͼ��')
subplot(232)
imshow(idea_lowData,[]);title('�����ͨ�˲����')
%% �ڶ����˲��������ͨ�˲�
[freqIdea_highData,idea_highData,idea_high_h] = Ideal_high(grayData,30);% ��ֹƵ��Ϊ30
subplot(233)
imshow(idea_highData,[]);title('�����ͨ�˲����')
%% �������˲���������˹��ͨ�˲�
[freqBartwaz_lowData,Bartwaz_lowData,Bartwaz_low_h] = Bartwaz_low(fftData_center_temp,1,50);% ��ֹƵ��Ϊ30
subplot(234)
imshow(Bartwaz_lowData,[]);title('ͨ��������˹��ͨ�˲��Ľ��')
%% �������˲���������˹��ͨ�˲�
[freqBartwaz_highData,Bartwaz_highData,Bartwaz_high_h] = Bartwaz_high(fftData_center_temp,1,30);% ��ֹƵ��Ϊ30
subplot(235)
imshow(Bartwaz_highData,[]);title('ͨ��������˹��ͨ�˲��Ľ��')
%% �������˲���

