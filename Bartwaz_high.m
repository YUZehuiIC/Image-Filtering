function [ freqData,newData,h ] = Bartwaz_high( oldData,n,D0 )
% n�װ�����˹��ͨ�˲�������ֹƵ��ΪD0
[M,N] = size(oldData);
h = zeros(M,N);
%�����˲���h
for i = 1:M
    for j = 1:N
        D = sqrt( (i-M/2)^2 + (j-N/2)^2 );
        h(i,j) = 1/(1+(D/D0)^(2*n));
    end
end
% �����˲�
% freqData = oldData.*h;
% freqData = ifftshift(freqData);%�õ�Ƶ��
% newData = real(ifft2(freqData));
freqData = uint8(abs(ifftshift(log(oldData+1).*h)));%�õ�Ƶ��
newData = uint8(real((ifft2(ifftshift(oldData.*h)))));
end

