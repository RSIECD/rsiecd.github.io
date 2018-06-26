%第一题
%（a）
syms x
f=sym(x^3-4*x^2+3*x+8)
df=diff(f)
ddf=diff(f,'x',2)
%(b)
syms x
f=sym((x^2-2*x+1)*(x-1))
df=diff(f)
ddf=diff(f,'x',2)
%(c)
syms x
f=sym(sin(x)*cos(2*x))
df=diff(f)
ddf=diff(f,'x',2)
%(d4)
syms x
f=sym(3*x*exp(4*x^2))
df=diff(f)
ddf=diff(f,'x',2)

%第二题
syms x
%(a)
s1=int(x^2+x)
%(b)
s2=int(x^2+x,0.3,1.3)
%(c)
syms x a b c
s3=int(a*x^2+b*x+c,x,3.5,24)
%第三题
syms t;
h=-0.12*t^4+12*t^3-380*t^2+4100*t+220;
%(a)
v=diff(h,t,1)%速度
%(b)
a=diff(h,t,2)%加速度
%(c)
h0=vpa(solve(h));
for i=1:length(h0)
    if isreal(h0(i))&&h0(i)>0
        T=h0(i)%落地时间
    end
end
%(d)
subplot(2,2,1);%高度与时间
ezplot(h,[0,double(T)]);
xlabel('t/h');
ylabel('h/m');
title('h(t)');

subplot(2,2,2);%速度与时间
ezplot(v,[0,double(T)]);
xlabel('t/h');
ylabel('v/(m/s)');
title('v(t)');

subplot(2,2,3);%加速度与时间
ezplot(a,[0,double(T)]);
xlabel('t/h');
ylabel('a/(m/s^2)');
title('a(t)');
%(e)
tm=vpa(solve(v))
for i=1:length(tm)
    if isreal(tm(i))&&tm(i)>0
        T0=tm(i)%最大高度对应时间
    end
end
H=subs(h,t,T0)%最大高度

%第四题 求反函数
syms x 
f_invers1=finverse(exp(x))
f_invers2=finverse(2*x^2+x+1)

%第五题 用6阶，8阶，10阶泰勒级数展开函数 并且以不同颜色画出
syms x y
y=sin(x)/x
ty6=taylor(y,x,0,'Order',6);
ty8=taylor(y,x,0,'Order',8);
ty10=taylor(y,x,0,'Order',10);
figure
h1=ezplot(ty6)%默认输出区间为-2pi到2pi 
set(h1,'color','r','Linewidth',2);
hold on
h2=ezplot(ty8)
set(h2,'color','g','Linewidth',2);
h3=ezplot(ty10)
set(h3,'color','b','Linewidth',2);
h4=ezplot(y)
set(h4,'color','c','Linewidth',2);
title('分别用6，8，10阶泰勒展开')
legend('6阶','8阶','10阶','原函数sin(x)/x')


