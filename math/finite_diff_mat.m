function dxdt = finite_diff_mat(x,time,time_direction)

	if ~all(size(x)==size(time))
		disp('*** ~all(size(x)==size(time)) !!! ***')
		size_x=size(x)
		size_time=size(time)
	end

	if time_direction==1
		%% as i_row increases, corrsponding time increases.
		%         /                        \    
		%         | t_a1 t_b1 ... ... t_z1 |
		%         | t_a2 t_b2 ... ... t_z2 |
		%   time= |  :    :            :   |
		%         |  :    :            :   |
		%         | t_an t_bn ... ... t_zn |
		%         \                        /  
		dxdt=zeros(size(x));
		dxdt(1,:)=(x(2,:)-x(1,:))./(time(2,:)-time(1,:));%forward difference
		dxdt(end,:)=(x(end,:)-x(end-1,:))/(time(end,:)-time(end-1,:));%backward difference
		dxdt(2:end-1,:)=(x(3:end,:)-x(1:end-2,:))./(time(3:end,:)-time(1:end-2,:));%central difference
	elseif time_direction==2
		
		%% as i_col increases, corrsponding time increases.
		%         /                        \    
		%         | t_a1 t_a2 ... ... t_an |
		%         | t_b1 t_b2 ... ... t_bn |
		%   time= |  :    :            :   |
		%         |  :    :            :   |
		%         | t_z1 t_z2 ... ... t_zn |
		%         \                        /   
		dxdt=zeros(size(x));
		dxdt(:,1)=(x(:,2)-x(:,1))./(time(:,2)-time(:,1));%forward difference
		dxdt(:,end)=(x(:,end)-x(:,end-1))./(time(:,end)-time(:,end-1));%backward difference
		dxdt(:,2:end-1)=(x(:,3:end)-x(:,1:end-2))./(time(:,3:end)-time(:,1:end-2));%central difference
	else
		disp('undefined time_direction!!!');
		% dxdt='undefined';
	end
	
	
end