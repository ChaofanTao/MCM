function f_rep = get_rep(Qg,Qo,Q)
m = 10; % reg force coefficient
n =2;  % capital adjustment
fr1 = [0 0 0];
fr2 = [0 0 0];
for i = 1:size(Qo(:),1)
	Q_thre = distanceCost(Qo(i),Q)/2;
	if distanceCost(Q,Qo(i)) <= Q_thre
		fr1 = fr1+m*(1/distanceCost(Q,Qo(i)) - 1/Q_thre)*(distanceCost(Q,Qg)^n)/(distanceCost(Q,Qg)^2)...
					*(Q-Qo(i))/distanceCost(Q,Qo(i));
				
		fr2 = fr2+m*n/2*((1/distanceCost(Q,Qo(i)) - 1/Q_thre)^2)*(distanceCost(Q,Qg)^(n-1))...
				 *(Qg-Q)/distanceCost(Qg,Q);
	end
 end
 f_rep = fr1+fr2;