%�����״�power_bin�����ж���������㷨1
% [start_m,length_m,power_bins]=[0.2,0.8,5];
clear all
start_m=0.2;length_m=0.8;power_bins=5;
signals=csvread('C:\Users\�Ȳ�\Desktop\ľ��2-0.73m.txt')';
res=zeros(1,58);
for i=1:58
res(i)=changeIndex(min(find(signals(:,i)==max(signals(:,i)))));
end






