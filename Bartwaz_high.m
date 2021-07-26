function [ freqData,newData,h ] = Bartwaz_high( oldData,n,D0 )
% n阶巴特沃斯低通滤波器，截止频率为D0
[M,N] = size(oldData);
h = zeros(M,N);
%构造滤波器h
for i = 1:M
    for j = 1:N
        D = sqrt( (i-M/2)^2 + (j-N/2)^2 );
        h(i,j) = 1/(1+(D/D0)^(2*n));
    end
end
% 进行滤波
% freqData = oldData.*h;
% freqData = ifftshift(freqData);%得到频谱
% newData = real(ifft2(freqData));
freqData = uint8(abs(ifftshift(log(oldData+1).*h)));%得到频谱
newData = uint8(real((ifft2(ifftshift(oldData.*h)))));
end

