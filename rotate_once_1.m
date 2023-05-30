%------------------角轮旋转一次--------------------------------------------
function [A]=rotate_once_1(x,y,R,A_Yarn,step_a,step_b)
Yarn_x=[-1 1 2 1 -1 -2];
Yarn_y=[-1 -1 0 1 1 0];
Yarn_0_x=Yarn_x*step_a;
Yarn_0_y=Yarn_y*step_b;
Yarn=[Yarn_0_x; Yarn_0_y]  %设定周围六个携纱器的子坐标系坐标
d_angle=-1*R/3*pi;
matrix_rotate=[cos(d_angle) -1*sin(d_angle); sin(d_angle) cos(d_angle)];
for i=1:6
    Yarn_1(:,i)=matrix_rotate*Yarn(:,i);
end
Yarn_1_x=round((Yarn_1(1,:)/step_a));
Yarn_1_y=round((Yarn_1(2,:)/step_b));
for i=1:6
    A_Yarn_1(x-Yarn_1_y(1,i),y+Yarn_1_x(1,i)) =A_Yarn(x-Yarn_y(1,i),y+Yarn_x(1,i)) ;
end
for i=1:6
    A_Yarn(x-Yarn_1_y(1,i),y+Yarn_1_x(1,i)) = A_Yarn_1(x-Yarn_1_y(1,i),y+Yarn_1_x(1,i));
end
A=A_Yarn;
end