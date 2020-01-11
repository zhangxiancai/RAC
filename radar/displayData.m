d1=subplot(2,2,1);d2=subplot(2,2,2);d3=subplot(2,2,3);d4=subplot(2,2,4);
signals=csvread('E:\radar-data\室内测试数据\雷达数据\6号\无模具-水平.log');
plot(d1,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d1,'无模具-水平');
%figure


signals=csvread('E:\radar-data\室内测试数据\雷达数据\6号\无模具-倾斜.log');
plot(d2,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d2,'无模具-倾斜');
%figure


signals=csvread('E:\radar-data\室内测试数据\雷达数据\6号\有模具-水平.log');
plot(d3,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d3,'有模具-水平');
%figure


signals=csvread('E:\radar-data\室内测试数据\雷达数据\4号\有模具-倾斜.log');
plot(d4,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d4,'有模具-倾斜');
