%1已知两个矩阵magic(3)和magic(4)，求它们的逆矩阵
A=magic(3);
B=magic(4);
%求逆矩阵
IA1=inv(A)
IA2=A^-1
IB1=inv(B)
IB2=B^-1
%2求上题中两个矩阵的行列式
det(A),det(B)
%3
clear
A=[1 2 3;2 4 6; 3 6 9]
[r,c]=size(A)
%基本判别方法
if r==c & det(A)==0
    disp('该矩阵是奇异矩阵')
else 
    disp('该矩阵不是奇异矩阵')
end
%条件数判别法
%Testing singularity using abs(det(X)) <= tolerance is not recommended as it is difficult to choose the correct tolerance. 
%The function cond(X) can check for singular and nearly singular matrices.
%奇异矩阵的条件数为无穷大
cond(A)
if rcond(A)==0
    disp('该矩阵是奇异矩阵')
else
    disp('该矩阵不是奇异矩阵')
end

%4 计算下面两组矢量的点积A.B,B.A并比较
%(a)
clear
A=[1,3,5];
B=[-3,-2,4]
d1=dot(A,B)
d2=dot(B,A)
d3=sum(A.*B)
d4=sum(B.*A)
%补充，叉乘
%The result, C, is a vector that is perpendicular to both A and B.
C = cross(A,B)
%Use dot products to verify that C is perpendicular to A and B.
dot(C,A)==0 & dot(C,B)==0
dot(C,A)
dot(C,B)

%(b)
A=[0,-1,-4,-8];
B=[4,-3,-2,24]
d1=dot(A,B)
d2=dot(B,A)
d3=sum(A.*B)
d4=sum(B.*A)
%5使用矢量计算下列成分的总质量
clear
density=[1.2 7.8 2.7]
vol=[700 200 300]
weight=sum(density.*vol)
%6
awi=[2 6 1]
zi=[12 1 16]
mw=sum(awi.*zi)
%7
aw=[1 4 1;2 6 1;3 8 1;4 10 1;5 12 1]
zi=[12;1;16]
mw=aw*zi
%8求矩阵乘
%(a)
clear
A=[12,4;3,-5]
B=[2,15;0,0]
C=A*B
D=B*A

if isequal(C,D) %C==D
    disp('A*B等于B*A');
else
    disp('A*B不等于B*A');
end

if ( C == D)
    disp('A*B和B*A相等'); %fprintf()
else
    disp('A*B和B*A不相等');
end
%(b)
A=[1,3,5;2,4,6]
B=[-2,4;3,8;12,-2]
C=A*B
D=B*A
if isequal(C,D) %C==D
    disp('A*B等于B*A');
else
    disp('A*B不等于B*A');
end

%9用两种方法求解线性方程组
%a
clear
A=[-2,1;1,1]
B=[3;10]
X=A\B
rank(A)
rank([A B])
cond(A)
X=inv(A)*B
%b
clear
A=[5,3,-1;3,2,1;4,-1,3]
B=[10;4;12]
X=A\B
rank(A)
rank([A B])
cond(A)
X=inv(A)*B
%c
clear
A=[3,1,1,1;1,-3,7,1;2,2,-3,4;1,1,1,1]
B=[24;12;17;0]
X=A\B
rank(A)
rank([A B])
cond(A)
X=inv(A)*B
%方法三
A3=[3,1,1,1;1,-3,7,1;2,2,-3,4;1,1,1,1];
B3=[24;12;17;0];
X3=linsolve(A3,B3);

%线性代数解法根据克拉默法则
Da1=[3 1;10 1];
Da2=[-2 3;1 10];
Da=[-2 1;1 1];
xa=(det(Da1)/det(Da))
ya=(det(Da2)/det(Da))
%方法二
DDa=[-2 1;1 1];
Day=[3;10];
x_y=DDa\Day
%方法三
DDa=[-2 1;1 1];
Day=[3;10];
rank(DDa);
rank([DDa Day]);
cond(DDa);
x_y=pinv(DDa)*Day
