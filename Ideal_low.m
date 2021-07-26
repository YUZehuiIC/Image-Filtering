function [ freqData,newData,h ] = Ideal_low( oldData,D0 )
% 理想低通滤波器，截止频率为D0
oldData = double(oldData);
oldData = fftshift(fft2(oldData));
[M,N] = size(oldData);
h = zeros(M,N);
%构造滤波器 h
for i = 1:M
    for j = 1:N
        D = sqrt( (i-M/2)^2 + (j-N/2)^2 );
        if(D<=D0)
            h(i,j) = 1;
    end
end
% 进行滤波
% freqData = oldData.*h;
freqData = uint8(abs(ifftshift(log(oldData+1).*h)));%得到频谱
newData = uint8(real((ifft2(ifftshift(oldData.*h)))));%滤波后的图像

end

