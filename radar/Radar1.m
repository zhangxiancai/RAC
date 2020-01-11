% signals=csvread('E:\radar-data\楼下-停车-10bin\雷达\4号\20191229_103155.log');
signals=csvread('E:\radar-data\楼下-停车-10bin\雷达\4号\20191229_113007.log');


% 
% date= (signals(:,1)+28800000)/86400000 + datenum(1970,1,1);
% 
% 
% plot(date(1:100),signals(1:100,2));
%  dateaxis('x',13);
%  set(gca,'XTickLabelRotation',90);
[n,s]=size(signals);
Y=zeros(n,2);%添加标签
S=sum(signals(:,2:11)')/10;
for i=1:n
    if S(i)>60
        Y(i,1)=1;
    end
end

plot([signals(:,2:11),Y*300]);
mkdir('E:\radar-data\楼下-停车-10bin\雷达\4号\有标签\');
csvwrite('E:\radar-data\楼下-停车-10bin\雷达\4号\有标签\20191229_103155.log',[signals,Y]);

