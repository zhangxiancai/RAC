classdef Util
    %工具类
    methods(Static)
      %%  数据格式转换
      
      
        function D=changeDate1(S)
            %将.csv文件转成多行3列矩阵，为X Y Z方向上一定时间内的磁场大小信号
            %S=文件地址
            %D=多行3列矩阵
            
            D1=csvread(S);
            [n,~]=size(D1);
            n1=floor(n/7);
            D=zeros(n1,3);
            for i=1:n1
                D(i,1)=D1(7*i-2,1)'; D(i,2)=D1(7*i-1,1)'; D(i,3)=D1(7*i,1)';
            end
        end
        
          function D=changeDate2(D1,d)
            %将D1转成3维矩阵，第三维是轴方向，一二维构成的矩阵的每一列是每个采样点特定邻域内数据，边缘列当0向量处理
            %D1=多行3列矩阵，为X Y Z方向上一定时间内的磁场大小信号
            %d=邻域半径
            %D=三维矩阵
         
            [n,~]=size(D1);
            D=zeros(2*d+1,n,3);%初始化D
            for k=1:3
                for j=d+1:n-d
                    D(:,j,k)=D1(j-d:j+d,k);
                end
            end   
           
        end
        
        
   
        %% 数据显示
        
        
        
        function display1(D,headName)
            %显示3列数据
            %D=待显示数据
            %headName=总标题
            figure;
            d1=subplot(3,1,1);d2=subplot(3,1,2);d3=subplot(3,1,3);
            plot(d1,D(:,1));plot(d2,D(:,2));plot(d3,D(:,3));
            title(d1,'X');title(d2,'Y');title(d3,'Z');
            suptitle(headName);
        end
        
        function display2(D1,D2,headName)
            %显示处理前后数据
            %D1=待显示处理前数据
            %D2=待显示处理后数据
            %headName=总标题
            
            figure;
            d1=subplot(3,1,1);d2=subplot(3,1,2);d3=subplot(3,1,3);
            plot(d1,D1(:,1));plot(d2,D1(:,2));plot(d3,D1(:,3));
            hold(d1,'on');hold(d2,'on');hold(d3,'on');
            plot(d1,D2(:,1));plot(d2,D2(:,2));plot(d3,D2(:,3));
            title(d1,'X');title(d2,'Y');title(d3,'Z');
            suptitle([headName,'，蓝色=前，棕色=后']);
            
        end
        
        
 
          %%   数据处理
        
        
        function D1=changeRate(D)
            %求一阶导
            %D=多行三列矩阵，为X Y Z方向上一定时间内的磁场大小信号
            D1=D;
            [n,~]=size(D);
            for j=1:3
                for i=1:n-1
                    D1(i,j)=100*(D(i+1,j)-D(i,j));%求导
                end
            end
            
        end
        
        function D1=changeAvg(D,s)
            %均值滤波，边缘数据直接输出
            %D=多行三列矩阵，为X Y Z方向上一定时间内的磁场大小信号
            %s=邻域半径
            %D1=均值滤波后数据
            [n,~]=size(D);
            D1=zeros(n,3);
            for j=1:3
                for i=1+s:n-s
                    for t=-s:s
                        D1(i,j)=D(i+t,j)+D1(i,j);
                    end
                    D1(i,j)=D1(i,j)/(2*s+1);%D1为D的钝化信号
                end
            end
            D1(1:s,:)=D(1:s,:);
            D1(n-s+1:n,:)=D(n-s+1:n,:);
            
        end
        
        function D1=changeF(D,s,f)
            %f型滤波，边缘数据直接输出
            %f=滤波处理函数（max median，mean）
            %D=多行三列矩阵，为X Y Z方向上一定时间内的磁场大小信号
            %s=邻域半径
            %D1=f滤波后数据
            
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
            %结构元为矩形的膨胀子函数
            %d=输入向量
            m=max(d-10);
        end
        
        function m=myMin(d)
            %结构元为矩形的腐蚀子函数
            %d=输入向量
            m=min(d-10);
        end
        
        function m=myMore(d)
            %取d中出现次数最多的元素
            %d=输入向量
            t=tabulate(d);
            n=max(find(t(:,2)==max(t(:,2))));
            m=t(n,1);
        end


    end
end
