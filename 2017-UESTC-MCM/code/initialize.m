
%ѡ��һ����ȡ��Ե�����ķ�ʽ��ʹ�����ܱ���ͼƬԭ�е�λ����Ϣͬʱ��Ҫ��������
% ������ͼƬ������ȡ���Ҳ���canny����
target_plane = cannyBW; 
init_num = planes_num(5);

ones_pos = find(target_plane==1);
target_real_plane = zeros(size(target_plane));
all_planes_num = 900; %�涨ÿ��ͼƬ��Ҫ��900���ɻ����
row = 30;
target_real_plane(ones_pos(floor(linspace(1,init_num,all_planes_num)))) = 1;
imshow(target_real_plane)

ground_pos = cell(row,row); % 16*16�ķɻ�
dl1 = 0.5; %��ʼ���ڵķɻ����0.5m
% ��ʼ����������[1 1 0]
for i = 1:row
    for j = 1:row
       ground_pos{i,j}=(1+[(i-1)*dl1,1+(j-1)*dl1,0]);
    end
end

target_pos = cell(row,row);
[hh_cen,ww_cen] = size(target_real_plane);
dl2 = 1; %�����ȶ���ķɻ����������ھ���1m
height0 = 144; %������и߶�,���Լ�����Ŷ�
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
%ָ������
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

