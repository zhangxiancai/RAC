function addLable(input1,input2,output)
%根据记录的时间加标签
%input1=数据文件路径，input2=时间记录文件路径
%output=输出文件路径
s=dir(input1);
if s(1).bytes==0
    return;
end
signals=csvread(input1);

[n,s]=size(signals);
Y=zeros(n,2);%添加标签
S=sum(signals(:,2:11)')/10;

lable=csvread(input2);%
[l_n,~]=size(lable);

for l_i=1:l_n
for i=1:n
    if signals(i,1)>=lable(l_i,1)&&signals(i,1)<=lable(l_i,2)
        Y(i,:)=[1,1];%有车,有干扰
    end
    if l_i<l_n&&signals(i,1)>=lable(l_i,2)&&signals(i,1)<=lable(l_i+1,1)
        Y(i,:)=[0,1];%无车，有干扰
    end
    
end
end
        
for i=1:n
    if S(i)>60&&Y(i,1)==0&&Y(i,2)==0
        Y(i,1)=1;%有车，无干扰
    end
end
plot([signals(:,2:11),Y*300]);
        

csvwrite(output,[signals,Y]);

end

