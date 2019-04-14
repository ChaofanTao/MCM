function f_attr = get_attr(Qg,Q)
k = 3; % gain coefficient
d_thre = distanceCost(Qg,Q)/3; % attractive force threshold
if distanceCost(Qg,Q) <= d_thre
	f_attr = k*(Qg-Q);
else
	f_attr = d_thre*k*(Qg-Q)/distanceCost(Q,Qg);
end

	