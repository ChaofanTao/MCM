
lr = 0.5;
iter_max = 300;
Q = ground_pos;
Qg = cell(row,row);
for i = 1:row*row
    if mod(distribute(i),row^2) ~= 0
        xi = mod(distribute(i),row^2);  % xi=ground plane code
    else
        xi = row*row;
    end
    yi = (distribute(i)-xi)/(row^2)+1; % yi=target plane code
	Qg{xi} = target_pos{yi};
end

State = cell(1,iter_max);
for j = 1:iter_max
    State{j} = Q;
	for i =1:row*row
		f_attr = get_attr(Qg{i},Q{i});
		Qo = ground_pos{[1:i-1,i+1:end]};
		f_rep = get_rep(Qg{i},Qo,Q{i});
		Q{i} = Q{i} + lr*(f_attr+f_rep)/norm([f_attr,f_rep],2);
    end
	lr = lr*0.99;
end

err = zeros(1,iter_max);
for j =1:iter_max
    for i = 1:row*row  %暂时忽略原点
        err(j) = err(j)+distanceCost(State{j}{i},Qg{i});
    end
end

%************************************************************************%
% visualization

% iteration process
for j = 1:5:row*row
    for i = 1:5:iter_max
        plot3( State{i}{j}(1),State{i}{j}(2),State{i}{j}(3),'g-' )
        hold on
    end
end

% fianl position
for j = 1:row*row
    plot3(State{end}{j}(1),State{end}{j}(2),State{end}{j}(3),'k+','LineWidth',10)
    hold on
end

%%**********************************************************************%
% animation

colormap(hot);
M=moviein(20);          %建立一个20列的大矩阵
for i=1:20
	view(-37.5+24*(i-1),30)    %改变视点
	M(:,i)=getframe;           %将图形保存到M矩阵
end

 movie(M,2)              %播放画面2次





