%1����tan(x),y=sinh(x)
x1= -1.5:0.1:1.5;
y11=tan(x1);
y12=sinh(x1);
figure
subplot(2,1,1);
plot(x1,y11)
title('y=tan(x)')
subplot(2,1,2)
plot(x1,y12)
title('y=sinh(x)')
%2
x2_1 = 0:0.1:10;
y2_1 = exp(x2_1);
subplot(2,2,1);
plot(x2_1,y2_1,'r');
title('y = exp(x)');
xlabel('x');
ylabel('y');
grid on;
x2_2 = 0:0.2:10;
y2_2 = sin(x2_2);
subplot(2,2,2);
plot(x2_2,y2_2,'k');
title('y = sin(x)');
xlabel('x');
ylabel('y');
grid on;
x2_3 = 0:0.3:10;
y2_3 = 5*x2_3.*x2_3 + 2*x2_3 + 4;
subplot(2,2,3);
plot(x2_3,y2_3,'b');
title('y = 5x^2 +2x + 4');
xlabel('x');
ylabel('y');
grid on;
x2_4 = 0:0.4:10;
y2_4 = sqrt(x2_4);
subplot(2,2,4);
plot(x2_4,y2_4,'c');
title('y = sqrt(x)');
xlabel('x');
ylabel('y');
grid on;
%3��֪�ɼ���� �����Գɼ�ͼ
x3=[68,83,61,70,75,82,57,5,76,85,62,71,96,78,76,68,72,75,83,93]
figure
subplot(1,2,1)
bar(x3)
hist(x3,50:10:90)
title('������ѧ��20��ѧ����ĩ���Գɼ�')
xlabel('ѧ��1-20');ylabel('�ɼ�/��')
axis square
grid on

x31=length(find(x3(:)<=60)) %���Ҳ���óɼ�С��60������
x32=length(find(x3(:)>=60&x3(:)<=70)) %�ɼ�60-70
x33=length(find(x3(:)>=71&x3(:)<=90)) %�ɼ�71-90
x34=length(find(x3(:)>90))%�ɼ�����90

subplot(1,2,2)
explode=[1 0 0 0] %������Ч�� ��ͻ����ʾ����������
pie([x31 x32 x33 x34],explode,{'������:2��','60-70:2��','71-90:11��','90����:2��'})
%ͳ�Ʒ�����
x=[numel(x3(x3<=60)) numel(x3(x3>=61&x3<=70)) numel(x3(x3>=71&x3<=90)) numel(x3(x3>=91))] %ͳ�Ƹ����ֶε�����
pie(x,[1 0 0 0],{'G<=60','G>=61&G<=70','G>=71&G<=90','G>=91'}) %���Ʊ�״ͼ����ʹ�ɼ�����60�Ĳ���ͻ��
%4������˫yͼ 
x4=[10,15,20,25,30,40,50,60,68]
y41=[275,310,340,360,375,390,400,407,410]
y42=[43,30,23,17,12,7,4,3,2]
figure
[AX,L1,L2]=plotyy(x4,y41,x4,y42)
set(get(AX(1),'Ylabel'),'String','�����ٶȣ�MPa��')
set(get(AX(2),'Ylabel'),'String','��չ�ԣ�%��')
set(get(AX(1),'Xlabel'),'string','�䴦���ٶ�')
grid on

%��5��
x=70+3.5*randn(1000,1);
hist(x);
%bar(x);
%6 ʸ��X Y ӳ��Ϊ��ά����X��Y ����Z
x6=-5:0.5:5;
y6=-5:0.5:5;
[X6,Y6]=meshgrid(x6,y6)%�ֱ�ӳ��Ϊ��ά����X6��Y6
Z=sin(sqrt(X6.^2+Y6.^2));%%��ƽ��
%(a)��mesh������άͼ
figure
subplot(2,2,1)
mesh(X6,Y6,Z)

%(b)surf
subplot(2,2,3)
surf(Z)
title('�������������Z��')
subplot(2,2,4)
surf(X6,Y6,Z)
title('�������������X,Y,Z��')  
%����������Ϊ�������������ʱ����������X��Y��ֵȡΪZ������Ԫ�ص������±ꡣ
%����������������ʱ����������X��Y��ȡֵ��СΪX��Y������Ԫ�ص���ֵ��

%(c)��������ͼ����Ⱦ��ӰЧ��������colormap���Բ�ͬЧ��
figure(1)
subplot(2,1,1)
colormap(cool)
surf(X6,Y6,Z)
shading interp
subplot(2,1,2)
surf(X6,Y6,Z)

colormap(hot)
colormap(gray);
colormap(spring);
colormap (pink);
colormap (hsv);
colormap (bone);
colormap (jet);
colormap (summer);
subplot(2,1,2)
surf(X6,Y6,Z)

%d ����Z�ĵȸ�ͼ
subplot(2,1,1)
contour(Z)

% ��������ͼ�����ϵȸ��� 
subplot(2,1,2)
contour3(Z)

%7MODISң����������������Ӧ����
x7=1:1:36
Y7=[21.8,24.7 ,35.3, 29.0, 5.4 ,7.3 ,1.0 ,44.9 ,41.9, 32.1 ,27.9 ,21.0 ,9.5 ,8.7 ,10.2 ,6.2 ,10.0 ,3.6 ,15.0, 0.45 ,2.38 ,0.67 ,0.79 ,0.17 ,0.59 ,6.00 ,1.16, 2.18, 9.58, 3.69 ,9.55 ,8.94 ,4.52, 3.76, 3.11, 2.08]
plot(x7,Y7)
set(gca,'xtick',0:1:36)
xlabel('���κ�(No.)')
ylabel('���׷����� (W m-2 ?m-1 sr-1)')
title('������Ӧ���� y=f(x)')
grid on
