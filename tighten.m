function [x_change,y_change,z_change]=tighten(x_Yarn,y_Yarn,z_Yarn,ratio_tighten)
   if ratio_tighten == 0
    x_change = x_Yarn;
    y_change = y_Yarn;
    z_change = z_Yarn; 
   else
       ratio_tighten ~= 0;
    x_change = round(x_Yarn,2);
    y_change = round(y_Yarn,2);
    z_change = round(z_Yarn,2);
    h=size(x_change);
    yarnNum=h(1);
    pointnum=h(2);
    a=ratio_tighten;%收缩系数
    for i=1:yarnNum
        for j=2:pointnum-1
            A_1 = [x_change(i,j-1);y_change(i,j-1);z_change(i,j-1)];
            A_2 = [x_change(i,j);y_change(i,j);z_change(i,j)];
            A_3 = [x_change(i,j+1);y_change(i,j+1);z_change(i,j+1)];

            B_1 = A_1-A_2;
            B_2 = A_2-A_2;
            B_3 = A_3-A_2;

            %angle_1为两向量间的夹角
            angle_1 = acos((B_1(1,1)^2+ B_1(2,1)^2+B_1(3,1)^2 + B_3(1,1)^2+ B_3(2,1)^2+B_3(3,1)^2 - (B_1(1,1)-B_3(1,1))^2-...
                (B_1(2,1)-B_3(2,1))^2-(B_1(3,1)-B_3(3,1))^2)/(2*sqrt(B_1(1,1)^2+ B_1(2,1)^2+B_1(3,1)^2)*sqrt(B_3(1,1)^2+ B_3(2,1)^2+B_3(3,1)^2)));
            angle_1 = round(angle_1,4);
            if angle_1 == 3.1416     %三点共线，则不用坐标变换，直接输出
                change_5 = A_2;

            else
                %第一次旋转：计算与AiAi+1与X轴正方向的角度
                if B_3(1,1)==0 && B_3(2,1)==0   %如果AiAi+1本身就是竖直的，则跳过前两步旋转
                    D_1 = B_1;
                    D_2 = B_2;
                    D_3 = B_3;
                else
                    if B_3(2,1)==0      %如果AiAi+1本身就在XOZ面内，则跳过前第1步旋转
                        C_1 = B_1;
                        C_2 = B_2;
                        C_3 = B_3;
                    else          %正常情况，则进行第一步旋转
                        angle_2 = acos(B_3(1,1)/sqrt(B_3(1,1)^2+ B_3(2,1)^2));
                        angle_2 = round(angle_2,4);
                        if B_3(2,1)>=0 %顺时针旋转angle_2
                            C_1(1,1) = B_1(1,1)*cos(angle_2) + B_1(2,1)*sin(angle_2);
                            C_1(2,1) = B_1(2,1)*cos(angle_2) - B_1(1,1)*sin(angle_2);
                            C_1(3,1) = B_1(3,1);
                            C_2 = B_2;
                            C_3(1,1) = B_3(1,1)*cos(angle_2) + B_3(2,1)*sin(angle_2);
                            C_3(2,1) = B_3(2,1)*cos(angle_2) - B_3(1,1)*sin(angle_2);
                            C_3(3,1) = B_3(3,1);
                        end
                        if B_3(2,1)<0 %逆时针旋转angle_2
                            C_1(1,1) = B_1(1,1)*cos(angle_2) - B_1(2,1)*sin(angle_2);
                            C_1(2,1) = B_1(2,1)*cos(angle_2) + B_1(1,1)*sin(angle_2);
                            C_1(3,1) = B_1(3,1);
                            C_2 = B_2;
                            C_3(1,1) = B_3(1,1)*cos(angle_2) - B_3(2,1)*sin(angle_2);
                            C_3(2,1) = B_3(2,1)*cos(angle_2) + B_3(1,1)*sin(angle_2);
                            C_3(3,1) = B_3(3,1);
                        end
                    end
                    %第二次旋转：计算与AiAi+1与Z轴正方向的角度，向z轴旋转angle_3 ，使AiAi+1变成竖直向上
                    angle_3 = asin(C_3(1,1)/sqrt(C_3(1,1)^2+ C_3(3,1)^2));
                    D_1(1,1) = C_1(1,1)*cos(angle_3) - C_1(3,1)*sin(angle_3);
                    D_1(2,1) = C_1(2,1);
                    D_1(3,1) = C_1(3,1)*cos(angle_3) + C_1(1,1)*sin(angle_3);
                    D_2 = C_2;
                    D_3(1,1) = C_3(1,1)*cos(angle_3) - C_3(3,1)*sin(angle_3);
                    D_3(2,1) = C_3(2,1);
                    D_3(3,1) = C_3(3,1)*cos(angle_3) + C_3(1,1)*sin(angle_3);
                end

                %第三次旋转：计算与AiAi-1与X轴正方向的角度，使AiAi-1到XOZ面
                angle_4 = acos(D_1(1,1)/sqrt(D_1(1,1)^2+ D_1(2,1)^2));

                if D_1(2,1)>=0 %顺时针旋转angle_4
                    E_1(1,1) = D_1(1,1)*cos(angle_4) + D_1(2,1)*sin(angle_4);
                    E_1(2,1) = D_1(2,1)*cos(angle_4) - D_1(1,1)*sin(angle_4);
                    E_1(3,1) = D_1(3,1);
                    E_2 = D_2;
                    E_3(1,1) = D_3(1,1)*cos(angle_4) + D_3(2,1)*sin(angle_4);
                    E_3(2,1) = D_3(2,1)*cos(angle_4) - D_3(1,1)*sin(angle_4);
                    E_3(3,1) = D_3(3,1);
                end
                if D_1(2,1)<0  %逆时针旋转angle_4
                    E_1(1,1) = D_1(1,1)*cos(angle_4) - D_1(2,1)*sin(angle_4);
                    E_1(2,1) = D_1(2,1)*cos(angle_4) + D_1(1,1)*sin(angle_4);
                    E_1(3,1) = D_1(3,1);
                    E_2 = D_2;
                    E_3(1,1) = D_3(1,1)*cos(angle_4) - D_3(2,1)*sin(angle_4);
                    E_3(2,1) = D_3(2,1)*cos(angle_4) + D_3(1,1)*sin(angle_4);
                    E_3(3,1) = D_3(3,1);
                end
                %找Ai点的转换点（角平分线与另一条线的交点）
                z = E_3(3,1)/(1-(E_1(3,1)- E_3(3,1))*tan(angle_1/2)/E_1(1,1));
                x = z*tan(angle_1/2);
                y = 0;
                change_1 = [x;y;z];

                %开始进行逆变换
                %第一次逆变换，沿Z轴旋转angle_4,方向与正变换相反
                if B_1(2,1)>=0  %逆时针旋转angle_4
                    change_2(1,1) = change_1(1,1)*cos(angle_4) - change_1(2,1)*sin(angle_4);
                    change_2(2,1) = change_1(2,1)*cos(angle_4) + change_1(1,1)*sin(angle_4);
                    change_2(3,1) = change_1(3,1);
                end
                if B_1(2,1)<0  %顺时针旋转angle_4
                    change_2(1,1) = change_1(1,1)*cos(angle_4) + change_1(2,1)*sin(angle_4);
                    change_2(2,1) = change_1(2,1)*cos(angle_4) - change_1(1,1)*sin(angle_4);
                    change_2(3,1) = change_1(3,1);
                end

                if  B_3(2,1)==0        %如果AiAi+1的Y=0，则再考虑跳一步逆变换还是两步
                    if B_3(1,1)==0     %如果AiAi+1竖直，则跳两步逆变换
                        change_4 = change_2;

                    else               %仅是AiAi+1的Y=0，所以只跳一步逆变换

                        change_3(1,1) = change_2(1,1)*cos(angle_3) + change_2(3,1)*sin(angle_3);
                        change_3(2,1) = change_2(2,1);
                        change_3(3,1) = change_2(3,1)*cos(angle_3) - change_2(1,1)*sin(angle_3);
                        change_4 = change_3;
                    end
                else %正常情况，要进行两次逆变换

                    %第二次逆变换，在XOZ面从Z轴远离angle_3,
                    change_3(1,1) = change_2(1,1)*cos(angle_3) + change_2(3,1)*sin(angle_3);
                    change_3(2,1) = change_2(2,1);
                    change_3(3,1) = change_2(3,1)*cos(angle_3) - change_2(1,1)*sin(angle_3);

                    %第三次逆变换，饶Z轴旋转回到原始位置
                    if B_3(2,1)<0 %顺时针旋转angle_2
                        change_4(1,1) = change_3(1,1)*cos(angle_2) + change_3(2,1)*sin(angle_2);
                        change_4(2,1) = change_3(2,1)*cos(angle_2) - change_3(1,1)*sin(angle_2);
                        change_4(3,1) = change_3(3,1);

                    else %逆时针旋转angle_2
                        change_4(1,1) = change_3(1,1)*cos(angle_2) - change_3(2,1)*sin(angle_2);
                        change_4(2,1) = change_3(2,1)*cos(angle_2) + change_3(1,1)*sin(angle_2);
                        change_4(3,1) = change_3(3,1);
                    end
                end
                %第五次变换，回到原有坐标系
                change_5 = a*change_4 + A_2;
            end
            x_change(i,j)=change_5(1,1);
            y_change(i,j)=change_5(2,1);
            z_change(i,j)=change_5(3,1);
        end
    end
end