%------------------定位携纱器位置------------------------------------------------
function [x,y]=locate_yarn_position(m,step_a,step_b,A,x,y,Mrou,dAngle,tighting_flag)
    for i=1:m
        [x_temp,y_temp] = find(A==i);
        x(i)=y_temp * step_a;
        y(i)=x_temp * step_b;
        if (tighting_flag == 1)
           [x(i),y(i)]=tight_yarn(x(i),y(i),Mrou,dAngle,x_temp,y_temp);
        end
    end
end
%------------------定位携纱器位置------------------------------------------

%------------------携纱器位置点收紧----------------------------------------
function [x_o,y_o]=tight_yarn(x,y,Mrou,dAngle,i,j)
        x_o = Mrou(i,j)*x*cos(dAngle) - Mrou(i,j)*y*sin(dAngle);
        y_o = Mrou(i,j)*y*sin(dAngle) - Mrou(i,j)*y*cos(dAngle);
end 
%------------------携纱器位置点收紧----------------------------------------