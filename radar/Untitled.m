%ΪdireĿ¼�µ����ݼӱ�ǩ
dire='E:\radar-data\¥��-ͣ��-10bin\�״�\';
files=dir(dire);
[n,~]=size(files);
for i=3:n%
    files1=dir([dire,files(i).name]);
    [n1,~]=size(files1);
    for j=3:n1%
        if files1(j).isdir
            continue;
        end
        input1=[dire,files(i).name,'\',files1(j).name];
        mkdir([dire,files(i).name,'\data-lable']);
        addLable(input1,'E:\radar-data\¥��-ͣ��-10bin\lableTimestamp.txt',[dire,files(i).name,'\data-lable\',files1(j).name]);
    end
end

