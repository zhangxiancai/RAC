d1=subplot(2,2,1);d2=subplot(2,2,2);d3=subplot(2,2,3);d4=subplot(2,2,4);
signals=csvread('E:\radar-data\���ڲ�������\�״�����\6��\��ģ��-ˮƽ.log');
plot(d1,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d1,'��ģ��-ˮƽ');
%figure


signals=csvread('E:\radar-data\���ڲ�������\�״�����\6��\��ģ��-��б.log');
plot(d2,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d2,'��ģ��-��б');
%figure


signals=csvread('E:\radar-data\���ڲ�������\�״�����\6��\��ģ��-ˮƽ.log');
plot(d3,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d3,'��ģ��-ˮƽ');
%figure


signals=csvread('E:\radar-data\���ڲ�������\�״�����\4��\��ģ��-��б.log');
plot(d4,signals(:,2:6));
legend('r1','r2','r3','r4','r5');
title(d4,'��ģ��-��б');
