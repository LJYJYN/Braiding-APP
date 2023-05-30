%---------------------六角纺织模拟程序--------------------------------------
%用来。。。。
%
%--------------------------------------------------------------------------
clear all
close all
%-----------------------------主要参数定义----------------------------------
ratio_tighten = 0.4; %拉直系数
M=30;  %矩阵研Y轴方向，行数
N=60;  %矩阵研X轴方向，列数
%a=r
a=1;%坐标单位长度
% step_a=0.523*a;%运动沿Y方向步长(无穿模)
step_a=0.5*a;%运动沿Y方向步长(有穿模)
% step_b=sqrt(5)/2*a;
step_b=sqrt(3)/2*a;%运动沿Y方向步长
% h=1
h=1; %运动沿Z方向步长
n=10; %纺织步数
m=120 ;%携纱轮数目
tighting_enable = 0;
number_tighten = 3;
switch_tighten = 1; %收紧开关  0-off ; 1-on
dAngle = (15/180)*pi; %收紧绕X周然转角度
r = 0.3; %实体化纺织线半径，粗细
R = 1;


%携纱器坐标及标记
A_Yarn = zeros(M,N);
A_Yarn(3,11)=1;A_Yarn(3,13)=2;A_Yarn(3,15)=3;A_Yarn(3,17)=4;A_Yarn(3,19)=5;A_Yarn(3,21)=6;
A_Yarn(3,23)=7;A_Yarn(3,25)=8;A_Yarn(4,10)=9;A_Yarn(4,14)=10;A_Yarn(4,18)=11;
A_Yarn(4,22)=12;A_Yarn(4,26)=13;A_Yarn(5,9)=14;A_Yarn(5,11)=15;A_Yarn(5,13)=16;
A_Yarn(5,15)=17;A_Yarn(5,17)=18;A_Yarn(5,19)=19;A_Yarn(5,21)=20;A_Yarn(5,23)=21;
A_Yarn(5,25)=22;A_Yarn(5,27)=23;A_Yarn(6,8)=24;A_Yarn(6,12)=25;A_Yarn(6,16)=26;
A_Yarn(6,20)=27;A_Yarn(6,24)=28;A_Yarn(6,28)=29;A_Yarn(7,7)=30;A_Yarn(7,9)=31;
A_Yarn(7,11)=32;A_Yarn(7,13)=33;A_Yarn(7,15)=34;A_Yarn(7,17)=35;A_Yarn(7,19)=36;
A_Yarn(7,21)=37;A_Yarn(7,23)=38;A_Yarn(7,25)=39;A_Yarn(7,27)=40;A_Yarn(7,29)=41;
A_Yarn(8,6)=42;A_Yarn(8,10)=43;A_Yarn(8,14)=44;A_Yarn(8,22)=45;A_Yarn(8,26)=46;
A_Yarn(8,30)=47;A_Yarn(9,5)=48;A_Yarn(9,7)=49;A_Yarn(9,9)=50;A_Yarn(9,11)=51;
A_Yarn(9,13)=52;A_Yarn(9,23)=53;A_Yarn(9,25)=54;A_Yarn(9,27)=55;A_Yarn(9,29)=56;
A_Yarn(9,31)=57;A_Yarn(10,4)=58;A_Yarn(10,8)=59;A_Yarn(10,12)=60;A_Yarn(10,24)=61;
A_Yarn(10,28)=62;A_Yarn(10,32)=63;A_Yarn(11,5)=64;A_Yarn(11,7)=65;A_Yarn(11,9)=66;
A_Yarn(11,11)=67;A_Yarn(11,13)=68;A_Yarn(11,23)=69;A_Yarn(11,25)=70;A_Yarn(11,27)=71;
A_Yarn(11,29)=72;A_Yarn(11,31)=73;A_Yarn(12,6)=74;A_Yarn(12,10)=75;A_Yarn(12,14)=76;
A_Yarn(12,22)=77;A_Yarn(12,26)=78;A_Yarn(12,30)=79;A_Yarn(13,7)=80;A_Yarn(13,9)=81;
A_Yarn(13,11)=82;A_Yarn(13,13)=83;A_Yarn(13,15)=84;A_Yarn(13,17)=85;A_Yarn(13,19)=86;
A_Yarn(13,21)=87;A_Yarn(13,23)=88;A_Yarn(13,25)=89;A_Yarn(13,27)=90;A_Yarn(13,29)=91;
A_Yarn(14,8)=92;A_Yarn(14,12)=93;A_Yarn(14,16)=94;A_Yarn(14,20)=95;A_Yarn(14,24)=96;
A_Yarn(14,28)=97;A_Yarn(15,9)=98;A_Yarn(15,11)=99;A_Yarn(15,13)=100;A_Yarn(15,15)=101;
A_Yarn(15,17)=102;A_Yarn(15,19)=103;A_Yarn(15,21)=104;A_Yarn(15,23)=105;A_Yarn(15,25)=106;
A_Yarn(15,27)=107;A_Yarn(16,10)=108;A_Yarn(16,14)=109;A_Yarn(16,18)=110;A_Yarn(16,22)=111;
A_Yarn(16,26)=112;A_Yarn(17,11)=113;A_Yarn(17,13)=114;A_Yarn(17,15)=115;A_Yarn(17,17)=116;
A_Yarn(17,19)=117;A_Yarn(17,21)=118;A_Yarn(17,23)=119;A_Yarn(17,25)=120;
%角轮中心坐标及矩阵
M_1 = zeros(M,N);
M_2 = zeros(M,N);
M_3 = zeros(M,N);
M_4 = zeros(M,N);
% M_1(6,14) = 1;     M_1(6,22) = 1;     M_1(10,10) = 1;     M_1(10,26) = 1;      M_1(14,14) = 1;     M_1(14,22) = 1;
% M_2(6,18) = (-1)*1;M_2(8,24) = (-1)*1;M_2(12,24) = (-1)*1;M_2(14,18) = (-1)*1 ;M_2(12,12) = (-1)*1;M_2(8,12) = (-1)*1;
% M_3(4,12) = 1;     M_3(4,20) = 1;     M_3(6,26) = 1;     M_3(10,30) = 1;     M_3(14,26) = 1;     M_3(16,20) = 1;     M_3(16,12) = 1;     M_3(12,8) = 1;     M_3(8,8) = 1;
% M_4(4,16) = (-1)*1;M_4(4,24) = (-1)*1;M_4(8,28) = (-1)*1;M_4(12,28) = (-1)*1;M_4(16,24) = (-1)*1;M_4(16,16) = (-1)*1;M_4(14,10) = (-1)*1;M_4(10,6) = (-1)*1;M_4(6,10) = (-1)*1;

% %C型
% M_1(6,14) = 0;M_1(6,22) = R;M_1(10,10) = R;M_1(10,26) = R;M_1(14,14) = R;M_1(14,22) = R;
% M_2(6,18) = -R;M_2(8,24) = -R;M_2(12,24) = -R;M_2(14,18) = -R;M_2(12,12) = -R;M_2(8,12) = -R;
% M_3(4,12) = 0;M_3(4,20) = R;M_3(6,26) = R;M_3(10,30) = R;M_3(14,26) = R;M_3(16,20) = R;M_3(16,12) = R;M_3(12,8) = R;M_3(8,8) = R;
% M_4(4,16) = 0;M_4(4,24) = -R;M_4(8,28) = -R;M_4(12,28) = -R;M_4(16,24) = -R;M_4(16,16) = -R;M_4(14,10) = -R;M_4(10,6) = -R;M_4(6,10) = 0;

% % U型
% M_1(6,14) = 0;M_1(6,22) = R;M_1(10,10) = R;M_1(10,26) = R;M_1(14,14) = R;M_1(14,22) = R;
% M_2(6,18) = 0;M_2(8,24) = -R;M_2(12,24) = -R;M_2(14,18) = -R;M_2(12,12) = -R;M_2(8,12) = 0;
% M_3(4,12) = 0;M_3(4,20) = R;M_3(6,26) = R;M_3(10,30) = R;M_3(14,26) = R;M_3(16,20) = R;M_3(16,12) = R;M_3(12,8) = R;M_3(8,8) = R;
% M_4(4,16) = 0;M_4(4,24) = -R;M_4(8,28) = -R;M_4(12,28) = -R;M_4(16,24) = -R;M_4(16,16) = -R;M_4(14,10) = -R;M_4(10,6) = -R;M_4(6,10) = 0;

% % L型
% M_1(6,10) = 0;M_1(6,14) = R;M_1(6,18) = 0;M_1(6,22) = R;M_1(8,24) = 0;M_1(10,26) = R;M_1(12,28) = 0;
% M_2(6,10) = -R;M_2(6,14) = 0;M_2(6,18) = -R;M_2(6,22) = 0;M_2(8,24) = -R;M_2(10,26) = 0;M_2(12,28) = -R;
% M_3(4,12) = R;M_3(4,16) = 0;M_3(4,20) = R;M_3(4,24) = 0;M_3(6,26) = R;M_3(8,28) =0;M_3(10,30) = R;
% M_4(4,12) = 0;M_4(4,16) = -R;M_4(4,20) = 0;M_4(4,24) = -R;M_4(6,26) = 0;M_4(8,28) = -R;M_4(10,30) = 0;

% %梯型
% M_1(6,14) = 0;M_1(6,22) = 0;M_1(10,10) = R;M_1(10,26) = 0;M_1(14,14) = R;M_1(14,22) = 0;
% M_2(6,18) = 0;M_2(8,24) = 0;M_2(12,24) = 0;M_2(14,18) = 0;M_2(12,12) = -R;M_2(8,12) = 0;%-R;
% M_3(4,12) = 0;M_3(4,20) = 0;M_3(6,26) = 0;M_3(10,30) = 0;M_3(14,26) = 0;M_3(16,20) = 0;M_3(16,12) = R;M_3(12,8) = R;M_3(8,8) =R;% R;
% M_4(4,16) = 0;M_4(4,24) = 0;M_4(8,28) = 0;M_4(12,28) = 0;M_4(16,24) = 0;M_4(16,16) = -R;M_4(14,10) = -R;M_4(10,6) = -R;M_4(6,10) = 0;


% %四边形
% M_1(6,14) = 0;M_1(6,22) = 0;M_1(10,10) = R;M_1(10,26) = 0;M_1(14,14) = R;M_1(14,22) = 0;
% M_2(6,18) = 0;M_2(8,24) = 0;M_2(12,24) = 0;M_2(14,18) = 0;M_2(12,12) = -R;M_2(8,12) = 0;%-R;
% M_3(4,12) = 0;M_3(4,20) = 0;M_3(6,26) = 0;M_3(10,30) = 0;M_3(14,26) = 0;M_3(16,20) = 0;M_3(16,12) = R;M_3(12,8) = R;M_3(8,8) =0;% R;
% M_4(4,16) = 0;M_4(4,24) = 0;M_4(8,28) = 0;M_4(12,28) = 0;M_4(16,24) = 0;M_4(16,16) = -R;M_4(14,10) = -R;M_4(10,6) = -R;M_4(6,10) = 0;


% % 双梯型
% M_1(6,14) = 0;M_1(6,22) = R;M_1(10,10) = R;M_1(10,26) = R;M_1(14,14) = R;M_1(14,22) = 0;
% M_2(6,18) = 0;M_2(8,24) = -R;M_2(12,24) = 0;M_2(14,18) = 0;M_2(12,12) = -R;M_2(8,12) = 0;
% M_3(4,12) = 0;M_3(4,20) = R;M_3(6,26) = R;M_3(10,30) = R;M_3(14,26) = 0;M_3(16,20) = 0;M_3(16,12) = R;M_3(12,8) = R;M_3(8,8) = 0;
% M_4(4,16) = 0;M_4(4,24) = -R;M_4(8,28) = -R;M_4(12,28) = -R;M_4(16,24) = 0;M_4(16,16) = -R;M_4(14,10) = -R;M_4(10,6) = -R;M_4(6,10) = 0;


%R
M_1(6,14) = R;M_1(6,22) = R;M_1(10,10) = R;M_1(10,26) = R;M_1(14,14) = R;M_1(14,22) = R;
M_2(6,18) = -R;M_2(8,24) = -R;M_2(12,24) = -R;M_2(14,18) = -R;M_2(12,12) = -R;M_2(8,12) = -R;
M_3(4,12) = R;M_3(4,20) = R;M_3(6,26) = R;M_3(10,30) = R;M_3(14,26) = R;M_3(16,20) = R;M_3(16,12) = R;M_3(12,8) = R;M_3(8,8) = R;
M_4(4,16) = -R;M_4(4,24) = -R;M_4(8,28) = -R;M_4(12,28) = -R;M_4(16,24) = -R;M_4(16,16) = -R;M_4(14,10) = -R;M_4(10,6) = -R;M_4(6,10) = -R;



%收紧delta矩阵
Mrou = zeros(M,N);
% Mrou(5,:) = [0,0,0,0,0,0,0,0,0,0,0,1,0,-1,0,-1,0,1,0,0,0,0,0,0,0,0,0,0,0];
% Mrou(6,:) = [0,0,0,0,0,0,0,0,0,0,1,0,0,0,-1,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
% Mrou(7,:) = [0,0,0,0,0,0,0,0,0,1,0,1,0,-1,0,-1,0,1,0,1,0,0,0,0,0,0,0,0,0];
% Mrou(8,:) = [0,0,0,0,0,0,0,0,1,0,0,0,-1,0,0,0,-1,0,0,0,1,0,0,0,0,0,0,0,0];
% Mrou(9,:) = [0,0,0,0,0,0,0,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,1,0,0,0,0,0,0,0,0,0];
% Mrou(10,:) = [0,0,0,0,0,0,0,0,0,0,-1,0,0,0,1,0,0,0,-1,0,0,0,0,0,0,0,0,0,0];
% Mrou(11,:) = [0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0];

%织线的位置坐标
x_Yarn=zeros(m,4*n+1);
y_Yarn=zeros(m,4*n+1);
z_Yarn=zeros(m,4*n+1);

%Z方向所有位置初始化
for i=1:4*n
    z_Yarn(:,i) = (i-1)* h;
end

%初始化携纱器位置
[x_Yarn(:,1),y_Yarn(:,1)] = locate_yarn_position(m,step_a,step_b,A_Yarn,x_Yarn(:,1),y_Yarn(:,1),Mrou,dAngle,tighting_enable); %(m,n,step_a,step_b,A,x,y)

%---------------------------纺织过程---------------------------------------
%矩阵变化法纺织，调用locate_yarn_position和rotate_once函数


for k=1:n%n
     %内圈顺时针旋转，变换纺织过程，利用M1与携纱器A的矩阵  
    for x=1:M
        for y=1:N
            if (M_1(x,y) == R)
                A_Yarn = rotate_once_1(x,y,R,A_Yarn,step_a,step_b);  %x,y,flag,A
                [x_Yarn(:,4*k-2),y_Yarn(:,4*k-2)] = locate_yarn_position(m,step_a,step_b,A_Yarn,x_Yarn(:,4*k-3),y_Yarn(:,4*k-3),Mrou,dAngle,tighting_enable);  
            end
        end
    end
    % 内圈逆时针旋转，变换纺织过程，利用M2与携纱器A的矩阵
    for x=1:M
        for y=1:N
            if (M_2(x,y) == -R)
                A_Yarn = rotate_once_1(x,y,-R,A_Yarn,step_a,step_b);
                [x_Yarn(:,4*k-1),y_Yarn(:,4*k-1)] = locate_yarn_position(m,step_a,step_b,A_Yarn,x_Yarn(:,4*k-2),y_Yarn(:,4*k-2),Mrou,dAngle,tighting_enable);
            end
        end
    end
     %外圈顺时针旋转，变换纺织过程，利用M1与携纱器A的矩阵
     for x=1:M
        for y=1:N
            if (M_3(x,y) == R)
                A_Yarn = rotate_once_1(x,y,R,A_Yarn,step_a,step_b);  %x,y,flag,A
                [x_Yarn(:,4*k),y_Yarn(:,4*k)] = locate_yarn_position(m,step_a,step_b,A_Yarn,x_Yarn(:,4*k-1),y_Yarn(:,4*k-1),Mrou,dAngle,tighting_enable);  
            end
        end
    end
    % 外圈逆时针旋转，变换纺织过程，利用M2与携纱器A的矩阵
    for x=1:M
        for y=1:N
            if (M_4(x,y) == -R)
                A_Yarn = rotate_once_1(x,y,-R,A_Yarn,step_a,step_b);
                [x_Yarn(:,4*k+1),y_Yarn(:,4*k+1)] = locate_yarn_position(m,step_a,step_b,A_Yarn,x_Yarn(:,4*k),y_Yarn(:,4*k),Mrou,dAngle,tighting_enable);
            end
        end
    end
end
if switch_tighten ==1   
    h1=size(x_Yarn);
    yarnNum1=h1(1);
    pointnum1=h1(2);
    X_center = ones(yarnNum1,pointnum1)*N/2;
    Y_center = ones(yarnNum1,pointnum1)*sqrt(3)*M/2;
    x_Yarn = (x_Yarn - X_center)/1;
    y_Yarn = (y_Yarn - Y_center)/1;
    z_Yarn = z_Yarn*2;
end
 
%纺织路径作图
figure (1)
% subplot(1,2,1)
% draw the pic
% scatter(x_Yarn(1,1),y_Yarn(1,1),'*','black');
% hold on
% plot3(x_Yarn(1,1:n),y_Yarn(1,1:n),z_Yarn(1,1:n))
for i=1:m
%     scatter(x_Yarn(i,1),y_Yarn(i,1),'*','black');
%     hold on;
%     plot3(x_Yarn(i,1:4*n),y_Yarn(i,1:4*n),z_Yarn(i,1:4*n));
%     plot3(x_Yarn(i,1:4*n),y_Yarn(i,1:4*n),z_Yarn(i,1:4*n),'linewidth',3);
    plot3(x_Yarn(i,1:n),y_Yarn(i,1:n),z_Yarn(i,1:n),'linewidth',3);
%     scatter3(x_Yarn(i,1:4*n),y_Yarn(i,1:4*n),z_Yarn(i,1:4*n),'MarkerFaceColor','0 0.5 0.5');
%     scatter3(x_Yarn(i,1:n),y_Yarn(i,1:n),z_Yarn(i,1:n),'MarkerFaceColor');
%     scatter3(x_Yarn(i,1:4*n),y_Yarn(i,1:4*n),z_Yarn(i,1:4*n),'MarkerEdgeColor','black','MarkerFaceColor','white');
%     scatter3(x_Yarn(i,1:n),y_Yarn(i,1:n),z_Yarn(i,1:n),'MarkerEdgeColor','black','MarkerFaceColor','white');
%     plot3(x_Yarn(i,1:4*n),y_Yarn(i,1:4*n),z_Yarn(i,1:4*n),'red','linewidth',3)
    box on
    ax = gca;
    ax.BoxStyle = 'full';
    hold on;
end
% hold off;
zlim([0 20])
% [x_change,y_change,z_change]=tighten(x_Yarn,y_Yarn,z_Yarn,ratio_tighten);
% [x_change,y_change,z_change]=tighten(x_change,y_change,z_change,ratio_tighten);
% [x_change,y_change,z_change]=tighten(x_change,y_change,z_change,ratio_tighten);
grid on
% view(45,15)
% for i=1:m
%     plot3(x_Yarn(i,1:n),y_Yarn(i,1:n),z_Yarn(i,1:n))
%     hold on
% end
%%   对携纱器坐标进行拉直处理
if number_tighten ==1
[x_change,y_change,z_change]=tighten(x_Yarn,y_Yarn,z_Yarn,ratio_tighten);
else
    [x_change,y_change,z_change]=tighten(x_Yarn,y_Yarn,z_Yarn,ratio_tighten);
    for i=2:number_tighten
[x_change,y_change,z_change]=tighten(x_change,y_change,z_change,ratio_tighten);
    end
end
[x_change,y_change,z_change]=tighten(x_Yarn,y_Yarn,z_Yarn,ratio_tighten);
[x_change,y_change,z_change]=tighten(x_change,y_change,z_change,ratio_tighten);

%%
%---------------------------平滑操作--------------------------------------
% %B-spline样条平滑纺织路径
figure (2)
l=0;
% subplot(1,3,2)
B=[-1 3 -3 1;3 -6 3 0;-3 0 3 0;1 4 1 0]/6.0;
for k = 1:m
    l=0;
    for i=1:(n-3)
    j=0;
%     xi=x_Yarn(k,i:i+3);  
%     yi=y_Yarn(k,i:i+3);
%     zi=z_Yarn(k,i:i+3);
      xi=x_change(k,i:i+3);
      yi=y_change(k,i:i+3);
      zi=z_change(k,i:i+3);
    
    
        for t=0:0.1:0.9
        U=[t^3 t^2 t 1];
        j=j+1;
        l=l+1;
        xt(j)=U*B*reshape(xi,4,1);
        yt(j)=U*B*reshape(yi,4,1);
        zt(j)=U*B*reshape(zi,4,1);
        xq(k,l)=xt(j);
        yq(k,l)=yt(j);
        zq(k,l)=zt(j);
        end
    end
    plot3(xq(k,:),yq(k,:),zq(k,:),'linewidth',3)
hold on
end
xq=round(xq,8);
yq=round(yq,8);
zq=round(zq,8);
zlim([0 20])
grid on
%%
%收紧过程，携纱器点位收紧
% xq = 0.15*xq;
% yq = 0.2*yq;
% zq = 1*zq;
% xq = xq*cos(dAngle)-yq*sin(dAngle);
% yq = yq*cos(dAngle)+xq*sin(dAngle);
% zq = zq * 1;
%%
% subplot(1,3,3)
figure (3)
% %------------------实体化纺织路径，调用TubeLike函数-------------------------
col=['r','g','b','c','y','m','w'];
h=size(xq);
yarnNum=h(1);
pointnum=h(2);
for i=1:yarnNum
[X,Y,Z]=TubeLike(xq(i,1:pointnum),yq(i,1:pointnum),zq(i,1:pointnum),r);% [X1,Y1,Z1]=TubeLike(xq(1,1:pointnum),yq(1,1:pointnum),zq(1,1:pointnum),r);
surf(X,Y,Z,'FaceColor',col(mod(i,7)+1),'LineStyle','-','linewidth',0.3,'EdgeAlpha',0.3);% surf(X,Y,Z,'FaceColor','b','LineStyle',':');
% patch(X(:,1),Y(:,1),Z(:,1),'b');% patch(X(:,pointnum),Y(:,pointnum),Z(:,pointnum),'b');
patch(X(:,1),Y(:,1),Z(:,1),col(mod(i,7)+1));
patch(X(:,pointnum),Y(:,pointnum),Z(:,pointnum),col(mod(i,7)+1));

hold on;
% light;
mycolor7 = [
    1 0 0 
    0 1 0 
    0 0 1 
    0 1 1 
    1 1 0 
    1 0 1 
    1 1 1];
colormap(mycolor7)
% colorbar('southoutside')
colorbar('off')
end
hold off;
zlim([0 20])
view(-10,2)



%%坐标点
figure (4)
% subplot(1,2,1)
% draw the pic
for i=1:m
    scatter3(x_Yarn(i,n),y_Yarn(i,n),z_Yarn(i,n),'MarkerEdgeColor','black','MarkerFaceColor','0.93,0.69,0.13');
    hold on;   
end
   grid on
   
figure (5)
[row_1,col_1] = find(M_1==1);
   [number_1,q_1]=size(row_1);
   for i=1:number_1
       plot(col_1(i,1)*step_a,row_1(i,1)*step_b,'o','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r')
       hold on
   end
   [row_2,col_2] = find(M_2==-1);
   [number_2,q_2]=size(row_2);
   for i=1:number_2
       plot(col_2(i,1)*step_a,row_2(i,1)*step_b,'o','MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor','k')
       hold on
   end
   [row_3,col_3] = find(M_3==1);
   [number_3,q_3]=size(row_3);
   for i=1:number_3
       plot(col_3(i,1)*step_a,row_3(i,1)*step_b,'o','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r')
       hold on
   end
   [row_4,col_4] = find(M_4==-1);
   [number_4,q_4]=size(row_4);
   for i=1:number_4
       plot(col_4(i,1)*step_a,row_4(i,1)*step_b,'o','MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor','k')
       hold on
   end 
  grid on
  

%%
%收紧变换，非控制点收紧（暂未完全实现）
% phi=getAngle();
%%
%----designed by xxx，copyrights@xxxx--------------------------------------
%时间：
%设计：
%--------------------------------------------------------------------------