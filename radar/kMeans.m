function [P,C]=kMeans(D,k)
%k均值聚类
%D=数据集，为2维矩阵,看成多条列向量
%k=设定的类别数
%P=原型向量组
%C=对D的分类结果

[n,s]=size(D);
C=zeros(1,s);
P=zeros(n,k);

%以下为选择初始解
P(:,1)=D(:,ceil((s-1)*rand()+1));
 DD=zeros(1,s);%
for i=2:k%每次选择
    for j=1:s%每条数据
        temp=1e+10;
        for t=1:i-1%每条已选向量
            temp1=distance(D(:,j),P(:,t))^2;
            if temp1<temp
                temp=temp1;
            end
        end
        DD(j)=temp;
    end
    
    ran=sum(DD)*rand();%
    temp=0;
    for j=1:s
        temp=temp+DD(j);
        if ran<=temp
             P(:,i)=D(:,j);%选择
             break
        end
    end
end
            
 %以上为选择初始解
    
%
e=2;
z=0;
while e~=0
    z=z+1;
    for j=1:s
        E=zeros(1,k);
        for t=1:k
           E(1,t)=distance(P(:,t),D(:,j));%距离
        end
        C(j)=min(find(E==min(E)));%更新C
    end
%     

P1=P;
for t=1:k
    CK=D(:,find(C==t))';%获得属于第t类的数据
    P(:,t)=mean(CK);%更新P
end
e=sum(sum((P1-P).^2));
end

z
end


function e=distance(p,d)
%向量p和d的距离
            e1=d-p;
            e=sqrt(e1'*e1);
            if e^2/10<10
                e=0;
            end     
end



















