signals=csvread('E:\radar-data\楼下-停车-10bin\雷达\4号\20191229_103155.log');

signals1=csvread('E:\radar-data\人\雷达\5号\20191227_211153.log');
signals2=csvread('E:\radar-data\自行车\雷达\5号\20191228_151742.log');
D=[signals(1:1000,2:11);signals1(1:1000,2:11);signals2(800:1800,2:11)];
[P,C]=kMeans(D',4);
plot(P');
figure
plot([D,200*C']);
% DD=sum(D')/10;
% plot([DD']);
