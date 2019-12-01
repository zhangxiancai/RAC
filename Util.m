classdef Util
    %������
    methods(Static)
      %%  ���ݸ�ʽת��
      
      
        function D=changeDate1(S)
            %��.csv�ļ�ת�ɶ���3�о���ΪX Y Z������һ��ʱ���ڵĴų���С�ź�
            %S=�ļ���ַ
            %D=����3�о���
            
            D1=csvread(S);
            [n,~]=size(D1);
            n1=floor(n/7);
            D=zeros(n1,3);
            for i=1:n1
                D(i,1)=D1(7*i-2,1)'; D(i,2)=D1(7*i-1,1)'; D(i,3)=D1(7*i,1)';
            end
        end
        
          function D=changeDate2(D1,d)
            %��D1ת��3ά���󣬵���ά���᷽��һ��ά���ɵľ����ÿһ����ÿ���������ض����������ݣ���Ե�е�0��������
            %D1=����3�о���ΪX Y Z������һ��ʱ���ڵĴų���С�ź�
            %d=����뾶
            %D=��ά����
         
            [n,~]=size(D1);
            D=zeros(2*d+1,n,3);%��ʼ��D
            for k=1:3
                for j=d+1:n-d
                    D(:,j,k)=D1(j-d:j+d,k);
                end
            end   
           
        end
        
        
   
        %% ������ʾ
        
        
        
        function display1(D,headName)
            %��ʾ3������
            %D=����ʾ����
            %headName=�ܱ���
            figure;
            d1=subplot(3,1,1);d2=subplot(3,1,2);d3=subplot(3,1,3);
            plot(d1,D(:,1));plot(d2,D(:,2));plot(d3,D(:,3));
            title(d1,'X');title(d2,'Y');title(d3,'Z');
            suptitle(headName);
        end
        
        function display2(D1,D2,headName)
            %��ʾ����ǰ������
            %D1=����ʾ����ǰ����
            %D2=����ʾ���������
            %headName=�ܱ���
            
            figure;
            d1=subplot(3,1,1);d2=subplot(3,1,2);d3=subplot(3,1,3);
            plot(d1,D1(:,1));plot(d2,D1(:,2));plot(d3,D1(:,3));
            hold(d1,'on');hold(d2,'on');hold(d3,'on');
            plot(d1,D2(:,1));plot(d2,D2(:,2));plot(d3,D2(:,3));
            title(d1,'X');title(d2,'Y');title(d3,'Z');
            suptitle([headName,'����ɫ=ǰ����ɫ=��']);
            
        end
        
        
 
          %%   ���ݴ���
        
        
        function D1=changeRate(D)
            %��һ�׵�
            %D=�������о���ΪX Y Z������һ��ʱ���ڵĴų���С�ź�
            D1=D;
            [n,~]=size(D);
            for j=1:3
                for i=1:n-1
                    D1(i,j)=100*(D(i+1,j)-D(i,j));%��
                end
            end
            
        end
        
        function D1=changeAvg(D,s)
            %��ֵ�˲�����Ե����ֱ�����
            %D=�������о���ΪX Y Z������һ��ʱ���ڵĴų���С�ź�
            %s=����뾶
            %D1=��ֵ�˲�������
            [n,~]=size(D);
            D1=zeros(n,3);
            for j=1:3
                for i=1+s:n-s
                    for t=-s:s
                        D1(i,j)=D(i+t,j)+D1(i,j);
                    end
                    D1(i,j)=D1(i,j)/(2*s+1);%D1ΪD�Ķۻ��ź�
                end
            end
            D1(1:s,:)=D(1:s,:);
            D1(n-s+1:n,:)=D(n-s+1:n,:);
            
        end
        
        function D1=changeF(D,s,f)
            %f���˲�����Ե����ֱ�����
            %f=�˲���������max median��mean��
            %D=�������о���ΪX Y Z������һ��ʱ���ڵĴų���С�ź�
            %s=����뾶
            %D1=f�˲�������
            
            [n,~]=size(D);
            D1=zeros(n,3);
            for j=1:3
                for i=1+s:n-s
                    D1(i,j)=f(D(i-s:i+s,j));
                end
            end
            D1(1:s,:)=D(1:s,:);
            D1(n-s+1:n,:)=D(n-s+1:n,:);
            
        end
        
        
        
        
        function m=myMax(d)
            %�ṹԪΪ���ε������Ӻ���
            %d=��������
            m=max(d-10);
        end
        
        function m=myMin(d)
            %�ṹԪΪ���εĸ�ʴ�Ӻ���
            %d=��������
            m=min(d-10);
        end
        
        function m=myMore(d)
            %ȡd�г��ִ�������Ԫ��
            %d=��������
            t=tabulate(d);
            n=max(find(t(:,2)==max(t(:,2))));
            m=t(n,1);
        end


    end
end
