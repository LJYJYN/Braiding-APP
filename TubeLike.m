%------------------��֯·��ʵ�廯----------------------------------------
function [Xgrid,Ygrid,Zgrid] = TubeLike(xd,yd,zd,r)
    t = linspace(0,2*pi,30)'; % �Ƕ�����
    %һ�ײ�ֲ���
    % x
    dx = diff(xd);
    dx = [dx(end) dx];
    % y
    dy = diff(yd);
    dy = [dy(end) dy];
    % z
    dz = diff(zd);
    dz = [dz(end) dz];
    %���㷨����y������н����ң�������y������н����Ҹ�ֵ
    d1 = sqrt(dx.^2 + dy.^2);
    cosy = dy./(d1);
    cosy(d1 == 0) = 1;
    siny = -dx./(d1);
    siny(d1 == 0) = 0;
    % ���㷨����z������н����ң�������z������н����Ҹ�ֵ
    d2 = sqrt(dx.^2 + dy.^2 + dz.^2);
    cosz = dz./(d2);
    cosz(d2 == 0) = 1;
    sinz = -sqrt(dx.^2 + dy.^2)./(d2);
    sinz(d2 == 0) = 0;
    OneVect = ones(numel(t),1); % ȡ��t�ȳ��ĵ�λ1����,numel(t)����t�ĳ���
    % �ܵ��������������
    Xcenter = OneVect*xd;
    Ycenter = OneVect*yd;
    Zcenter = OneVect*zd;
    % ��λԲ��������
    x0 = cos(t);
    y0 = sin(t);
    % ������ά�ܵ��ͼ��������������Xgrid��Ygrid��Zgrid�� ������
    Xgrid = Xcenter + x0*(r.*cosy) - y0*(r.*cosz.*siny);
    Ygrid = Ycenter + x0*(r.*siny) + y0*(r.*cosz.*cosy);
    Zgrid = Zcenter + y0*(r.*sinz);
end
%------------------��֯·��ʵ�廯----------------------------------------
