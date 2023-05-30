%------------------纺织路径实体化----------------------------------------
function [Xgrid,Ygrid,Zgrid] = TubeLike(xd,yd,zd,r)
    t = linspace(0,2*pi,30)'; % 角度向量
    %一阶差分操作
    % x
    dx = diff(xd);
    dx = [dx(end) dx];
    % y
    dy = diff(yd);
    dy = [dy(end) dy];
    % z
    dz = diff(zd);
    dz = [dz(end) dz];
    %计算法线与y轴正向夹角余弦，法线与y轴正向夹角正弦负值
    d1 = sqrt(dx.^2 + dy.^2);
    cosy = dy./(d1);
    cosy(d1 == 0) = 1;
    siny = -dx./(d1);
    siny(d1 == 0) = 0;
    % 计算法线与z轴正向夹角余弦，法线与z轴正向夹角正弦负值
    d2 = sqrt(dx.^2 + dy.^2 + dz.^2);
    cosz = dz./(d2);
    cosz(d2 == 0) = 1;
    sinz = -sqrt(dx.^2 + dy.^2)./(d2);
    sinz(d2 == 0) = 0;
    OneVect = ones(numel(t),1); % 取与t等长的单位1向量,numel(t)返回t的长度
    % 管道中心线坐标矩阵
    Xcenter = OneVect*xd;
    Ycenter = OneVect*yd;
    Zcenter = OneVect*zd;
    % 单位圆坐标数据
    x0 = cos(t);
    y0 = sin(t);
    % 计算三维管道型几何体的网格数据Xgrid，Ygrid和Zgrid， 并返回
    Xgrid = Xcenter + x0*(r.*cosy) - y0*(r.*cosz.*siny);
    Ygrid = Ycenter + x0*(r.*siny) + y0*(r.*cosz.*cosy);
    Zgrid = Zcenter + y0*(r.*sinz);
end
%------------------纺织路径实体化----------------------------------------
