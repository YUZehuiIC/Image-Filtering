function [ newData ] = my_avefilter( oldData,n )
% ���������ڶ�ͼ����о�ֵ�˲�
% oldData��ʾ�������ͼ��ĻҶȾ���n��ʾ��ֵ�˲���ģ����Ŀ
% newData��ʾ��ֵ�˲��õ���ͼ��ĻҶȾ���
model = double(ones(n)/(n*n)); %��ģ���ֵת��Ϊdouble
[M N] = size(oldData);
for i = (1+(n-1)/2):(M-(n-1)/2)
    for j = (1+(n-1)/2):(N-(n-1)/2)
          model2 = double(oldData((i-(n-1)/2):(i+(n-1)/2),(j-(n-1)/2):(j+(n-1)/2)));%��ԭͼ����ȡ��n*n�ľ��� 
          Data = model.*model2; %ģ���ϵ�ϵ����ģ���µĶ�Ӧ�������
          Data = uint8(sum(Data(:)));%��������ӣ��������г˻����
          newData(i,j) = Data;%��ֵ����Ӧ��Ԫ��ֵ
    end
end

