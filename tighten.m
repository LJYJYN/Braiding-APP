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
    a=ratio_tighten;%����ϵ��
    for i=1:yarnNum
        for j=2:pointnum-1
            A_1 = [x_change(i,j-1);y_change(i,j-1);z_change(i,j-1)];
            A_2 = [x_change(i,j);y_change(i,j);z_change(i,j)];
            A_3 = [x_change(i,j+1);y_change(i,j+1);z_change(i,j+1)];

            B_1 = A_1-A_2;
            B_2 = A_2-A_2;
            B_3 = A_3-A_2;

            %angle_1Ϊ��������ļн�
            angle_1 = acos((B_1(1,1)^2+ B_1(2,1)^2+B_1(3,1)^2 + B_3(1,1)^2+ B_3(2,1)^2+B_3(3,1)^2 - (B_1(1,1)-B_3(1,1))^2-...
                (B_1(2,1)-B_3(2,1))^2-(B_1(3,1)-B_3(3,1))^2)/(2*sqrt(B_1(1,1)^2+ B_1(2,1)^2+B_1(3,1)^2)*sqrt(B_3(1,1)^2+ B_3(2,1)^2+B_3(3,1)^2)));
            angle_1 = round(angle_1,4);
            if angle_1 == 3.1416     %���㹲�ߣ���������任��ֱ�����
                change_5 = A_2;

            else
                %��һ����ת��������AiAi+1��X��������ĽǶ�
                if B_3(1,1)==0 && B_3(2,1)==0   %���AiAi+1���������ֱ�ģ�������ǰ������ת
                    D_1 = B_1;
                    D_2 = B_2;
                    D_3 = B_3;
                else
                    if B_3(2,1)==0      %���AiAi+1�������XOZ���ڣ�������ǰ��1����ת
                        C_1 = B_1;
                        C_2 = B_2;
                        C_3 = B_3;
                    else          %�������������е�һ����ת
                        angle_2 = acos(B_3(1,1)/sqrt(B_3(1,1)^2+ B_3(2,1)^2));
                        angle_2 = round(angle_2,4);
                        if B_3(2,1)>=0 %˳ʱ����תangle_2
                            C_1(1,1) = B_1(1,1)*cos(angle_2) + B_1(2,1)*sin(angle_2);
                            C_1(2,1) = B_1(2,1)*cos(angle_2) - B_1(1,1)*sin(angle_2);
                            C_1(3,1) = B_1(3,1);
                            C_2 = B_2;
                            C_3(1,1) = B_3(1,1)*cos(angle_2) + B_3(2,1)*sin(angle_2);
                            C_3(2,1) = B_3(2,1)*cos(angle_2) - B_3(1,1)*sin(angle_2);
                            C_3(3,1) = B_3(3,1);
                        end
                        if B_3(2,1)<0 %��ʱ����תangle_2
                            C_1(1,1) = B_1(1,1)*cos(angle_2) - B_1(2,1)*sin(angle_2);
                            C_1(2,1) = B_1(2,1)*cos(angle_2) + B_1(1,1)*sin(angle_2);
                            C_1(3,1) = B_1(3,1);
                            C_2 = B_2;
                            C_3(1,1) = B_3(1,1)*cos(angle_2) - B_3(2,1)*sin(angle_2);
                            C_3(2,1) = B_3(2,1)*cos(angle_2) + B_3(1,1)*sin(angle_2);
                            C_3(3,1) = B_3(3,1);
                        end
                    end
                    %�ڶ�����ת��������AiAi+1��Z��������ĽǶȣ���z����תangle_3 ��ʹAiAi+1�����ֱ����
                    angle_3 = asin(C_3(1,1)/sqrt(C_3(1,1)^2+ C_3(3,1)^2));
                    D_1(1,1) = C_1(1,1)*cos(angle_3) - C_1(3,1)*sin(angle_3);
                    D_1(2,1) = C_1(2,1);
                    D_1(3,1) = C_1(3,1)*cos(angle_3) + C_1(1,1)*sin(angle_3);
                    D_2 = C_2;
                    D_3(1,1) = C_3(1,1)*cos(angle_3) - C_3(3,1)*sin(angle_3);
                    D_3(2,1) = C_3(2,1);
                    D_3(3,1) = C_3(3,1)*cos(angle_3) + C_3(1,1)*sin(angle_3);
                end

                %��������ת��������AiAi-1��X��������ĽǶȣ�ʹAiAi-1��XOZ��
                angle_4 = acos(D_1(1,1)/sqrt(D_1(1,1)^2+ D_1(2,1)^2));

                if D_1(2,1)>=0 %˳ʱ����תangle_4
                    E_1(1,1) = D_1(1,1)*cos(angle_4) + D_1(2,1)*sin(angle_4);
                    E_1(2,1) = D_1(2,1)*cos(angle_4) - D_1(1,1)*sin(angle_4);
                    E_1(3,1) = D_1(3,1);
                    E_2 = D_2;
                    E_3(1,1) = D_3(1,1)*cos(angle_4) + D_3(2,1)*sin(angle_4);
                    E_3(2,1) = D_3(2,1)*cos(angle_4) - D_3(1,1)*sin(angle_4);
                    E_3(3,1) = D_3(3,1);
                end
                if D_1(2,1)<0  %��ʱ����תangle_4
                    E_1(1,1) = D_1(1,1)*cos(angle_4) - D_1(2,1)*sin(angle_4);
                    E_1(2,1) = D_1(2,1)*cos(angle_4) + D_1(1,1)*sin(angle_4);
                    E_1(3,1) = D_1(3,1);
                    E_2 = D_2;
                    E_3(1,1) = D_3(1,1)*cos(angle_4) - D_3(2,1)*sin(angle_4);
                    E_3(2,1) = D_3(2,1)*cos(angle_4) + D_3(1,1)*sin(angle_4);
                    E_3(3,1) = D_3(3,1);
                end
                %��Ai���ת���㣨��ƽ��������һ���ߵĽ��㣩
                z = E_3(3,1)/(1-(E_1(3,1)- E_3(3,1))*tan(angle_1/2)/E_1(1,1));
                x = z*tan(angle_1/2);
                y = 0;
                change_1 = [x;y;z];

                %��ʼ������任
                %��һ����任����Z����תangle_4,���������任�෴
                if B_1(2,1)>=0  %��ʱ����תangle_4
                    change_2(1,1) = change_1(1,1)*cos(angle_4) - change_1(2,1)*sin(angle_4);
                    change_2(2,1) = change_1(2,1)*cos(angle_4) + change_1(1,1)*sin(angle_4);
                    change_2(3,1) = change_1(3,1);
                end
                if B_1(2,1)<0  %˳ʱ����תangle_4
                    change_2(1,1) = change_1(1,1)*cos(angle_4) + change_1(2,1)*sin(angle_4);
                    change_2(2,1) = change_1(2,1)*cos(angle_4) - change_1(1,1)*sin(angle_4);
                    change_2(3,1) = change_1(3,1);
                end

                if  B_3(2,1)==0        %���AiAi+1��Y=0�����ٿ�����һ����任��������
                    if B_3(1,1)==0     %���AiAi+1��ֱ������������任
                        change_4 = change_2;

                    else               %����AiAi+1��Y=0������ֻ��һ����任

                        change_3(1,1) = change_2(1,1)*cos(angle_3) + change_2(3,1)*sin(angle_3);
                        change_3(2,1) = change_2(2,1);
                        change_3(3,1) = change_2(3,1)*cos(angle_3) - change_2(1,1)*sin(angle_3);
                        change_4 = change_3;
                    end
                else %���������Ҫ����������任

                    %�ڶ�����任����XOZ���Z��Զ��angle_3,
                    change_3(1,1) = change_2(1,1)*cos(angle_3) + change_2(3,1)*sin(angle_3);
                    change_3(2,1) = change_2(2,1);
                    change_3(3,1) = change_2(3,1)*cos(angle_3) - change_2(1,1)*sin(angle_3);

                    %��������任����Z����ת�ص�ԭʼλ��
                    if B_3(2,1)<0 %˳ʱ����תangle_2
                        change_4(1,1) = change_3(1,1)*cos(angle_2) + change_3(2,1)*sin(angle_2);
                        change_4(2,1) = change_3(2,1)*cos(angle_2) - change_3(1,1)*sin(angle_2);
                        change_4(3,1) = change_3(3,1);

                    else %��ʱ����תangle_2
                        change_4(1,1) = change_3(1,1)*cos(angle_2) - change_3(2,1)*sin(angle_2);
                        change_4(2,1) = change_3(2,1)*cos(angle_2) + change_3(1,1)*sin(angle_2);
                        change_4(3,1) = change_3(3,1);
                    end
                end
                %����α任���ص�ԭ������ϵ
                change_5 = a*change_4 + A_2;
            end
            x_change(i,j)=change_5(1,1);
            y_change(i,j)=change_5(2,1);
            z_change(i,j)=change_5(3,1);
        end
    end
end