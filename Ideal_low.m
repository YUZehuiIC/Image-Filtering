function [ freqData,newData,h ] = Ideal_low( oldData,D0 )
% �����ͨ�˲�������ֹƵ��ΪD0
oldData = double(oldData);
oldData = fftshift(fft2(oldData));
[M,N] = size(oldData);
h = zeros(M,N);
%�����˲��� h
for i = 1:M
    for j = 1:N
        D = sqrt( (i-M/2)^2 + (j-N/2)^2 );
        if(D<=D0)
            h(i,j) = 1;
    end
end
% �����˲�
% freqData = oldData.*h;
freqData = uint8(abs(ifftshift(log(oldData+1).*h)));%�õ�Ƶ��
newData = uint8(real((ifft2(ifftshift(oldData.*h)))));%�˲����ͼ��

end

