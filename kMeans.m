function [P,C]=kMeans(D,k)
%k��ֵ����
%D=���ݼ���Ϊ2ά����,���ɶ���������
%k=�趨�������
%P=ԭ��������
%C=��D�ķ�����

[n,s]=size(D);
J=ceil((s-1)*rand(k,1)+1);
P=D(:,J);%��ʼ��
C=zeros(1,s);

for g=1:100
    for j=1:s
        E=zeros(1,k);
        for t=1:k
            E1=D(:,j)-P(:,t);
            E(1,t)=sqrt(E1'*E1);
        end
        C(j)=min(find(E==min(E)));%����C
    end

for t=1:k
    CK=D(:,find(C==k))';
    P(:,k)=mean(CK);%����P
end


end

end
function d1=myMax(d)
%�ṹԪΪ���ε������Ӻ���
%d=��������
d1=max(d-10);
end

function d1=myMin(d)
%�ṹԪΪ���εĸ�ʴ�Ӻ���
%d=��������
d1=min(d-10);
end