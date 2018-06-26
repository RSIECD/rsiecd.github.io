%a
2^3-4/(5+3)
%b
5^(2+1)/(4-1)
%c
(4+1/2)*(5+2/3)
%d
(5+6*7/3-2^2)/(2*3/(3*3*6))
%1
z=4*exp(pi/4j)+5
%或者 
z=4*exp(pi/4i)+5
real_z=real(z)
imag_z=imag(z)
angle_z=angle(z)
%2
%直接求解复数根
c=-5
res_c=c^(1/4)
%构造多项式p(r)=r^4-c
p=[1,0,0,0,-c];
r=roots(p)
%3
log(3.5)+log10(5)
%4
floor(8.375) %8
ceil(8.375) %9
%5题
a=[2.3 5.8 9]
b=[5.2 3.14 2]
%(1)
sin_a=sin(a)
%(2)
a=a+3
%(3)
a_b=a+b
%(4)
ab=a.*b
%(5)
A2=a.^2

%6
A=[1 2 3]
B=repmat(A,3,1)
C=repmat(A,3,2)

%7
ran=5 + 5.*rand(1,10)

