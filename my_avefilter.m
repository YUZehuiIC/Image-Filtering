function [ newData ] = my_avefilter( oldData,n )
% 本函数用于对图像进行均值滤波
% oldData表示待处理的图像的灰度矩阵，n表示均值滤波的模板数目
% newData表示均值滤波得到的图像的灰度矩阵
model = double(ones(n)/(n*n)); %将模板的值转换为double
[M N] = size(oldData);
for i = (1+(n-1)/2):(M-(n-1)/2)
    for j = (1+(n-1)/2):(N-(n-1)/2)
          model2 = double(oldData((i-(n-1)/2):(i+(n-1)/2),(j-(n-1)/2):(j+(n-1)/2)));%在原图像中取出n*n的矩阵 
          Data = model.*model2; %模板上的系数与模板下的对应像素相乘
          Data = uint8(sum(Data(:)));%将矩阵相加，即将所有乘积相加
          newData(i,j) = Data;%赋值给对应的元素值
    end
end

