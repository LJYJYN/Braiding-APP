%------------------角轮旋转一次-------------------------------------------------
function [A]=rotate_once(x,y,flag,A)
   if (flag == 1)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(6);
        A(x-1,y+1) = yArn_list(1);
        A(x,y+2) = yArn_list(2);
        A(x+1,y+1) = yArn_list(3);
        A(x+1,y-1) = yArn_list(4);
        A(x,y-2) = yArn_list(5);
   end
  
   if (flag == -1)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(2);
        A(x-1,y+1) = yArn_list(3);
        A(x,y+2) = yArn_list(4);
        A(x+1,y+1) = yArn_list(5);
        A(x+1,y-1) = yArn_list(6);
        A(x,y-2) = yArn_list(1);
  end      
          if (flag == 2)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(5);
        A(x-1,y+1) = yArn_list(6);
        A(x,y+2) = yArn_list(1);
        A(x+1,y+1) = yArn_list(2);
        A(x+1,y-1) = yArn_list(3);
        A(x,y-2) = yArn_list(4);
   end
  
   if (flag == -2)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(3);
        A(x-1,y+1) = yArn_list(4);
        A(x,y+2) = yArn_list(5);
        A(x+1,y+1) = yArn_list(6);
        A(x+1,y-1) = yArn_list(1);
        A(x,y-2) = yArn_list(2);
   end
    if (flag == 3)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(4);
        A(x-1,y+1) = yArn_list(5);
        A(x,y+2) = yArn_list(6);
        A(x+1,y+1) = yArn_list(1);
        A(x+1,y-1) = yArn_list(2);
        A(x,y-2) = yArn_list(3);
   end
   if (flag == -3)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(4);
        A(x-1,y+1) = yArn_list(5);
        A(x,y+2) = yArn_list(6);
        A(x+1,y+1) = yArn_list(1);
        A(x+1,y-1) = yArn_list(2);
        A(x,y-2) = yArn_list(3);
   end
   if (flag == 4)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(3);
        A(x-1,y+1) = yArn_list(4);
        A(x,y+2) = yArn_list(5);
        A(x+1,y+1) = yArn_list(6);
        A(x+1,y-1) = yArn_list(1);
        A(x,y-2) = yArn_list(2);
   end
   if (flag == -4)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(5);
        A(x-1,y+1) = yArn_list(6);
        A(x,y+2) = yArn_list(1);
        A(x+1,y+1) = yArn_list(2);
        A(x+1,y-1) = yArn_list(3);
        A(x,y-2) = yArn_list(4);
   end
   
   
   if (flag == 5)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(2);
        A(x-1,y+1) = yArn_list(3);
        A(x,y+2) = yArn_list(4);
        A(x+1,y+1) = yArn_list(5);
        A(x+1,y-1) = yArn_list(6);
        A(x,y-2) = yArn_list(1);
   end
   if (flag == -5)
        yArn_list = [A(x-1,y-1),A(x-1,y+1),A(x,y+2),A(x+1,y+1),A(x+1,y-1),A(x,y-2)];
        A(x-1,y-1) = yArn_list(6);
        A(x-1,y+1) = yArn_list(1);
        A(x,y+2) = yArn_list(2);
        A(x+1,y+1) = yArn_list(3);
        A(x+1,y-1) = yArn_list(4);
        A(x,y-2) = yArn_list(5);
   end
   
  
end
%------------------角轮旋转一次--------------------------------------------