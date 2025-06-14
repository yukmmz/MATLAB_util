function v_tmp = finite_diff(x_tmp,t_tmp)
	if length(x_tmp)~=length(t_tmp)
		disp('*** length(x_tmp)~=length(t_tmp) !!! ***')
	end
	t_tmp=reshape(t_tmp,size(x_tmp));
	v_tmp=zeros(size(x_tmp));
	v_tmp(1)=(x_tmp(2)-x_tmp(1))/(t_tmp(2)-t_tmp(1));%forward difference
	v_tmp(end)=(x_tmp(end)-x_tmp(end-1))/(t_tmp(end)-t_tmp(end-1));%backward difference
	v_tmp(2:end-1)=(x_tmp(3:end)-x_tmp(1:end-2))./(t_tmp(3:end)-t_tmp(1:end-2));%cetral difference
end