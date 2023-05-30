%------------------角轮旋转一次-------------------------------------------------
function [A]=rotate_once(x,y,R,A)
      Y(k)=[x(k),y(k),1];
      yArn_list = [Y(k),Y(k+1),0;Y(k+5),R,Y(k+2);0,Y(k+4),Y(k+3)];
      
      if(R == 1)
        RZ = [cos(60) sin(60) 0; -sin(60) cos(60) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
     if(R == 2)
        RZ = [cos(120) sin(120) 0; -sin(120) cos(120) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == 3)
        RZ = [cos(180) sin(180) 0; -sin(180) cos(180) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == 4)
        RZ = [cos(240) sin(240) 0; -sin(240) cos(240) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == 5)
        RZ = [cos(300) sin(300) 0; -sin(300) cos(300) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == 6)
        RZ = [cos(360) sin(360) 0; -sin(360) cos(360) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == -1)
        RZ = [cos(-60) sin(-60) 0; -sin(-60) cos(-60) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
     if(R == -2)
        RZ = [cos(-120) sin(-120) 0; -sin(-120) cos(-120) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == -3)
        RZ = [cos(-180) sin(-180) 0; -sin(-180) cos(-180) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == -4)
        RZ = [cos(-240) sin(-240) 0; -sin(-240) cos(-240) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == -5)
        RZ = [cos(-300) sin(-300) 0; -sin(-300) cos(-300) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
      if(R == -6)
        RZ = [cos(-360) sin(-360) 0; -sin(-360) cos(-360) 0;0 0 1]%绕Z轴逆时针的旋转矩阵  
        PL = RZ*Y(k)*(yArn_list);%旋转矩阵相乘
      end
