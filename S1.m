%停车检测脚本1
clear
D1=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_113957_2.log');
D2=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_115554_2.log');
D3=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_123554_2.log');
D4=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_125506_2.log');
D5=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_130523_2.log');
D6=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_132129_2.log');

D7=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_132338_2.log');
D8=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_133920_2.log');
D9=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_133934_2.log');
D10=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_160424_2.log');
D11=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_160606_2.log');

D12=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_161428_2.log');
D13=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_163056_2.log');
D14=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_164119_2.log');
D15=Util.changeDate1('C:\Users\先才\Desktop\pcr10c\Matlab_Source\M\20190323_171242_2.log');
D=[D1;D2;D3;D4;D5;D6;D7;D8;D9;D10;D11;D12;D13;D14;D15];
Util.display1(D,'原始数据');
D1=Util.changeF(D,4,@mean);%均值滤波
D2=Util.changeDate2(D1,5);%将每个采样点特定邻域内的数据看作该采样点信息
[~,s,~]=size(D2);
%D3=getFeatures(D2(:,6:s-5,:));%获得每条数据的特征信息
[P,C]=kMeans(D2(:,:,1),3);%k均值聚类
figure;
plot(C);
Util.display1(Util.changeF([C' C' C'],200,@Util.myMore),'1');

% figure;
% hold on;
% for j=1:10
%     plot(D2(:,j,1));
% 
% end
figure;
hold on;
for j=1:3
    plot(P(:,j));
end





