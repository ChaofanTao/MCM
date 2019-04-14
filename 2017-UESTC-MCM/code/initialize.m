
%选择一种提取边缘特征的方式，使尽可能保留图片原有的位置信息同时需要点数较少
% 对龙的图片特征提取，我采用canny算子
target_plane = cannyBW; 
init_num = planes_num(5);

ones_pos = find(target_plane==1);
target_real_plane = zeros(size(target_plane));
all_planes_num = 900; %规定每个图片都要用900个飞机组成
row = 30;
target_real_plane(ones_pos(floor(linspace(1,init_num,all_planes_num)))) = 1;
imshow(target_real_plane)

ground_pos = cell(row,row); % 16*16的飞机
dl1 = 0.5; %初始相邻的飞机相距0.5m
% 初始引导点坐标[1 1 0]
for i = 1:row
    for j = 1:row
       ground_pos{i,j}=(1+[(i-1)*dl1,1+(j-1)*dl1,0]);
    end
end

target_pos = cell(row,row);
[hh_cen,ww_cen] = size(target_real_plane);
dl2 = 1; %空中稳定后的飞机的理想相邻距离1m
height0 = 144; %理想飞行高度,可以加随机扰动
k = 1;
index = find(target_real_plane ==1);

for i =1:row
    for j = 1:row
        if  mod(index(k),hh_cen)~= 0
            ii = mod(index(k),hh_cen);  % xi=ground plane code
        else
            ii = hh_cen;
        end
        %height = height0 +0.01*height0*rand();
        jj = (index(k)-ii)/hh_cen+1;
        target_pos{i,j} = ([(ii-1)*dl2 ,(jj-1)*dl2, height0 ]);
        k = k+1;
    end
end

distance_mat =  zeros(row*row,row*row);
for i =1:row*row
    for j = 1:row*row
        distance_mat(i,j) = sqrt(sum((ground_pos{i} - target_pos{j}).^2));
    end
end

%*************************************************************************%
%指派问题
[order,fval]=fenpei(distance_mat);

for i =1:row*row
    plot3(ground_pos{i}(1),ground_pos{i}(2),ground_pos{i}(3),'b*');
    hold on
end
hold on
for i =1:row*row
    plot3(target_pos{i}(1),target_pos{i}(2),target_pos{i}(3),'r-','linewidth',5,'markersize',5);
    hold on
end

%*************************************************************************%

distribute = find(order==1);

