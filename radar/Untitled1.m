signals=csvread('C:\Users\œ»≤≈\Desktop\µÿ¥≈1.txt');
[n,s]=size(signals);
tar=zeros(1,n*s);

for i=1:n
    tar(15*(i-1)+1:15*i)=signals(i,:);
end
plot(tar);