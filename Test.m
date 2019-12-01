
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
T1=Util.changeF(D,50,@Util.myMin);%先腐蚀
T2=Util.changeF(T1,50,@Util.myMax);%后膨胀
T3=Util.changeF(T2,50,@Util.myMax);
T4=Util.changeF(T3,50,@Util.myMin);

T5=Util.changeF(T4,50,@Util.myMax);
T6=Util.changeF(T5,50,@Util.myMin);
T7=Util.changeF(T6,50,@Util.myMin);
T8=Util.changeF(T7,50,@Util.myMax);

Util.display1(T2,'开运算');
Util.display1(T4,'开-闭运算');

Util.display1(T8,'开-闭,闭-开运算');

Util.display1(D-0.5*T8,'噪声');
