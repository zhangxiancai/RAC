function addLable(input1,input2,output)
%���ݼ�¼��ʱ��ӱ�ǩ
%input1=�����ļ�·����input2=ʱ���¼�ļ�·��
%output=����ļ�·��
s=dir(input1);
if s(1).bytes==0
    return;
end
signals=csvread(input1);

[n,s]=size(signals);
Y=zeros(n,2);%��ӱ�ǩ
S=sum(signals(:,2:11)')/10;

lable=csvread(input2);%
[l_n,~]=size(lable);

for l_i=1:l_n
for i=1:n
    if signals(i,1)>=lable(l_i,1)&&signals(i,1)<=lable(l_i,2)
        Y(i,:)=[1,1];%�г�,�и���
    end
    if l_i<l_n&&signals(i,1)>=lable(l_i,2)&&signals(i,1)<=lable(l_i+1,1)
        Y(i,:)=[0,1];%�޳����и���
    end
    
end
end
        
for i=1:n
    if S(i)>60&&Y(i,1)==0&&Y(i,2)==0
        Y(i,1)=1;%�г����޸���
    end
end
plot([signals(:,2:11),Y*300]);
        

csvwrite(output,[signals,Y]);

end

