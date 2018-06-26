%第一题
%能买到的苹果数为a
a=floor(5/0.52);
%第二题
sin(2*pi);
%第三题
A=0:0.2*pi:2*pi;
cos(A);
%第四题
red=rand(100,100);
green=rand(100,100);
blue=rand(100,100);
%方法一
Img(:,:,1)=red;
Img(:,:,2)=green;
Img(:,:,3)=blue;
imshow(Img);
%方法二
Img=cat(3,red,green,blue);
imshow(Img);
%方法三
Img=reshape(([red green blue]),100,100,3);
imshow(Img)
%第五题
X=[4 90 85 75;2 55 65 75;3 78 82 79;1 84 92 93];
%(1)
[max_Xc]=max(X) %每列的最大值
%(2)
[max_Xc,index]=max(X)
%(3)
max(X');%每行的最大值
max_Xr=max(X,[],2)
[max_Xr,index]=max(X,[],2)
%(4)
max(max(X))
Max_X=max(reshape(X,numel(X),1))
%第六题
A1=zeros(3,3);
A2=ones(5,3);
A3=pi*ones(4,6);
%第七题
v=[1,2,3]
A=diag(v);
%第八题
%(1)
A=magic(10);
diag(A);%(对角线元素)；
B=rot90(A) %逆时针旋转90度
diag(B)
a=sum(diag(A))
b=sum(diag(B))
if (a==b)
   fprintf('true\n')
else
    fprintf('false\n') 
end
%(2)
%tril(A) %下三角矩阵
%triu(A) %上三角
%flipud(A)   %上下镜像
%fliplr(A)   %左右镜像
diag(A) %对角线元素
diag(flipud(A))%提取从左下角到右上角元素
t=sum(diag(A)-diag(flipud(A)));%若t=0则说明对角线元素相等
if (t==0)
   fprintf('true\n')
else
    fprintf('false\n') 
end
%第九题
%(1)
y=2*randn(1,121)+70;
y=normrnd(70,2,1,121);
y=random('norm',70,2,1,121)

%(2)
x=0:1:120;
plot(x,y);
xlabel('x (time)');
ylabel('y (temperature)');

%(3)
minx=min(y)
maxx=max(y)
mu=mean(y)



