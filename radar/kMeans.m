function [P,C]=kMeans(D,k)
%k��ֵ����
%D=���ݼ���Ϊ2ά����,���ɶ���������
%k=�趨�������
%P=ԭ��������
%C=��D�ķ�����

[n,s]=size(D);
C=zeros(1,s);
P=zeros(n,k);

%����Ϊѡ���ʼ��
P(:,1)=D(:,ceil((s-1)*rand()+1));
 DD=zeros(1,s);%
for i=2:k%ÿ��ѡ��
    for j=1:s%ÿ������
        temp=1e+10;
        for t=1:i-1%ÿ����ѡ����
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
             P(:,i)=D(:,j);%ѡ��
             break
        end
    end
end
            
 %����Ϊѡ���ʼ��
    
%
e=2;
z=0;
while e~=0
    z=z+1;
    for j=1:s
        E=zeros(1,k);
        for t=1:k
           E(1,t)=distance(P(:,t),D(:,j));%����
        end
        C(j)=min(find(E==min(E)));%����C
    end
%     

P1=P;
for t=1:k
    CK=D(:,find(C==t))';%������ڵ�t�������
    P(:,t)=mean(CK);%����P
end
e=sum(sum((P1-P).^2));
end

z
end


function e=distance(p,d)
%����p��d�ľ���
            e1=d-p;
            e=sqrt(e1'*e1);
            if e^2/10<10
                e=0;
            end     
end



















