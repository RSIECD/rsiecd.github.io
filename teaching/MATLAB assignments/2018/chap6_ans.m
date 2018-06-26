%1ˮ���е�ˮ��ʹ�ò�ͬ����ʽ������ ������
X_waterHeight=[0,1.7,1.95,2.60,2.92,4.04,5.24 ];
Y_waterFlow=[0,2.6,3.6,4.03,6.45,11.22,30.61 ];

p1_1=polyfit(X_waterHeight,Y_waterFlow,1);
p1_2=polyfit(X_waterHeight,Y_waterFlow,2);
p1_3=polyfit(X_waterHeight,Y_waterFlow,3);

xi_height=[0,1.7,1.95,2.60,2.92,4.04,5.24 ];
y1_Flow=polyval(p1_1,xi_height);
y2_Flow=polyval(p1_2,xi_height);
y3_Flow=polyval(p1_3,xi_height);%�������

plot(X_waterHeight,Y_waterFlow,'-o')%��ͼ����
hold on;
plot(xi_height,y1_Flow,'k:')
plot(xi_height,y2_Flow,'r-.')
plot(xi_height,y3_Flow,'m--')

xlabel('�߶ȣ�ft��');
ylabel('������ft3/s��');
legend('ԭʼ����','һ�ζ���ʽ���','���ζ���ʽ���','���ζ���ʽ���');
title('ˮ���˶��߶���������ϵ')
%��������ʵ����֪����ƽ����������������ζ���ʽ�����С�����Ч�����
ss1=sum((y1_Flow-Y_waterFlow).^2) %154.4225
ss2=sum((y2_Flow-Y_waterFlow).^2) %26.1068
ss3=sum((y3_Flow-Y_waterFlow).^2) %3.0951

%2
x2=-1:0.1:1;
y2=sin(x2);
x22=-1:0.1:1;
p2_2=polyfit(x2,y2,2);
p2_3=polyfit(x2,y2,3);%�ֱ����������׶���ʽ���
y2_2=polyval(p2_2,x22);
y2_3=polyval(p2_3,x22);%�����µ�yֵ
figure
plot(x2,y2,'-o');
hold on
plot(x22,y2_2,'r')
hold on
plot(x22,y2_3,'g');

ylabel('sin(x)')
title('sin(x)�Ķ��Σ����ζ���ʽ���')
legend('���ζ���ʽ���','���ζ���ʽ���','ԭʼ����');
fprintf('\n������϶���ʽΪ��%.3fx^2+%.3fx+%.3f=0\n', p2_2(1), p2_2(2), p2_2(3));
fprintf('\n������϶���ʽΪ��%.4fx^3+%.4fx^2+%.4fx+%.4f=0\n', p2_3(1), p2_3(2), p2_3(3),p2_3(4));
%��������ʵ����֪����ƽ����������������ζ���ʽ�����С�����Ч�����
ss1=sum((y2_2-y2).^2) %0.0153
ss2=sum((y2_3-y2).^2) %2.8239e-06

%3 �������
f_3=@(x)sin(x).^2-cos(x);
figure
fplot(f_3,[-2*pi,2*pi]);
grid on
hold on
%�۲�ͼ�� ����Ѱ���������
x0_1=fzero(f_3,[-6,-4]);
x0_2=fzero(f_3,[-2,0]);
x0_3=fzero(f_3,[4,6]);
x0_4=fzero(f_3,[0,2]);
plot(x0_1,f_3(x0_1),'ro',x0_2,f_3(x0_2),'ro',x0_3,f_3(x0_3),'ro',x0_4,f_3(x0_4),'ro');
legend('f(x)','���')
title('f=sin(x)^2-cos(x)�������')

%4����quad��quadl�����
f_4=@(x)x.^3+2*x.^2-x+3;
inter1=quad(f_4,-1,1)  %������integral(f_4,-1,1)�滻
inter2=quadl(f_4,-1,1) %integral(f_4,-1,1)
fprintf('\n��quad��quadl���ֺ����Ľ���ֱ�Ϊ%f��%f\n',inter1,inter2)

%5��������¶�������
a=25.48;
b=1.520*10^(-2);
c=0.7155*10^(-5);
d=1.312*10^(-9);
f_Cp=@(T)a+b*T+c*(T.^2)+d*(T.^3);
inter_h=quad(f_Cp,300,500);%inter_h=integral(f_Cp,300,500);
fprintf('\n������ 300K ���ȵ� 500K ʱ�ʵı仯��Ϊ%f\n',inter_h);

%������ ���ź�������
syms a x b c d
y=int(a+b.*x+c.*x.^2+d.*x.^3,'x','300','500'); 
a=25.48;
b=1.520e-2;
c=-0.7155e-5;
d=1.312e-9;
eval(y)

%6����Ż�����
%����һ ��������Լ�����Ž�fminunc
%�ں����ļ��ж���fun6.m
options = optimset('GradObj', 'on', 'MaxIter', 400);
initialX=[-2,1];
[optX,fuctionVal,exitflag]=fminunc(@fun6,initialX,options);
%��ͼ�б�ʾ��Сֵ��
[x1,x2]=meshgrid(-20:0.2:20,-20:0.2:20);
z=3.*x1.^2+2.*x1.*x2+x2.^2;
figure
mesh(x1,x2,z);
hold on
title('��������Լ���Ż��������Ž�')
plot3(optX(1),optX(2),fuctionVal,'r.','markersize',30);
legend('','���Ž��')

%������ Լ�������µķ������Ż�fmincon
f=@(x)3*x(1).^2+2*x(1).*x(2)+x(2).^2;
lb=[-20 -20];
ub=[20 20];
x0=[1;1];
[optx,fval]=fmincon(f,x0,[],[],[],[],lb,ub);
[x1,x2]=meshgrid(-20:0.2:20,-20:0.2:20);
z=3*x1.^2+2*x1.*x2+x2.^2;
mesh(x1,x2,z);
hold on
plot3(optx(1), optx(2), fval, 'r.','markersize',30);

