% signals=csvread('E:\radar-data\¥��-ͣ��-10bin\�״�\4��\20191229_103155.log');
signals=csvread('E:\radar-data\¥��-ͣ��-10bin\�״�\4��\20191229_113007.log');


% 
% date= (signals(:,1)+28800000)/86400000 + datenum(1970,1,1);
% 
% 
% plot(date(1:100),signals(1:100,2));
%  dateaxis('x',13);
%  set(gca,'XTickLabelRotation',90);
[n,s]=size(signals);
Y=zeros(n,2);%��ӱ�ǩ
S=sum(signals(:,2:11)')/10;
for i=1:n
    if S(i)>60
        Y(i,1)=1;
    end
end

plot([signals(:,2:11),Y*300]);
mkdir('E:\radar-data\¥��-ͣ��-10bin\�״�\4��\�б�ǩ\');
csvwrite('E:\radar-data\¥��-ͣ��-10bin\�״�\4��\�б�ǩ\20191229_103155.log',[signals,Y]);

