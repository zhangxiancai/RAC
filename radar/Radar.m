%根据雷达power_bin数据判断物体距离算法1
% [start_m,length_m,power_bins]=[0.2,0.8,5];
clear all
start_m=0.2;length_m=0.8;power_bins=5;
signals=csvread('C:\Users\先才\Desktop\木板2-0.73m.txt')';
res=zeros(1,58);
for i=1:58
res(i)=changeIndex(min(find(signals(:,i)==max(signals(:,i)))));
end






