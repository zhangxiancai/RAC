function [P,C]=kMeans(D,k)
%k均值聚类
%D=数据集，为2维矩阵,看成多条列向量
%k=设定的类别数
%P=原型向量组
%C=对D的分类结果

[n,s]=size(D);
J=ceil((s-1)*rand(k,1)+1);
P=D(:,J);%初始解
C=zeros(1,s);

for g=1:100
    for j=1:s
        E=zeros(1,k);
        for t=1:k
            E1=D(:,j)-P(:,t);
            E(1,t)=sqrt(E1'*E1);
        end
        C(j)=min(find(E==min(E)));%更新C
    end

for t=1:k
    CK=D(:,find(C==k))';
    P(:,k)=mean(CK);%更新P
end


end

end
function d1=myMax(d)
%结构元为矩形的膨胀子函数
%d=输入向量
d1=max(d-10);
end

function d1=myMin(d)
%结构元为矩形的腐蚀子函数
%d=输入向量
d1=min(d-10);
end