function out=smspline_opt_recurse(x,y,errmax,smoothing_params_init,maxloop)
	%%smoothing_params_init should include 1.

	x_orig=x;
	y_orig=y;
	x=x(:);
	y=y(:);
	smoothing_params=sort(smoothing_params_init,'ascend');
	smoothing_params_init = smoothing_params_init(smoothing_params_init<=1);%remove larger than 1
	if smoothing_params_init(end) ~= 1
		smoothing_params_init(end+1)=1;%add 1 to the end
	end
	n_para=length(smoothing_params_init);

	i_loop=0;
	%% search otpimal smoothing_param
	while 1
		i_loop=i_loop+1;
		
		%%smoothing spline
		err=ones(size(smoothing_params));
		for i_sm=1:length(smoothing_params)
			f = fit(x,y,'smoothingspline','SmoothingParam',smoothing_params(i_sm));
			% err(i_sm)=mean(abs(f(x)-y))./mean(abs(y));%in ratio
			err(i_sm)=mean(abs(f(x)-y))./std(y);%in ratio
		end
		% disp(err)
		
		% log for check
		% fprintf(1,'current params:[%f,%f]\n',smoothing_params(1),smoothing_params(end));
		% fprintf(1,'error:[%f,%f]\n',err(1),err(end));
		
		tmp=find(err<=errmax);
		ind_opt=min(tmp);%the smoothest among err<5%
	
		%% make new params or break
		if smoothing_params(ind_opt)==1
			%% make params denser
			ill='too_sparse_params';
			p1=smoothing_params(end-1);
			pe=1;
			smoothing_params_new=linspace(p1,pe,n_para);
		elseif isempty(tmp)
			%% make params larger
			ill='too_small_params';
			p1=smoothing_params(end);
			pe=smoothing_params(end)+(smoothing_params(end)-smoothing_params(1));
			pe=min(pe,1);
			smoothing_params_new=linspace(p1,pe,n_para);
		elseif ind_opt==1
			%% make params smaller
			ill='too_large_params';
			if smoothing_params(1)==0
				p1=0;
				pe=smoothing_params(1);
			else
				p1=smoothing_params(1)-(smoothing_params(end)-smoothing_params(1));
				p1=max(p1,0);
				pe=smoothing_params(1);
			end	
			smoothing_params_new=linspace(p1,pe,n_para);
		else
			ill='ok';
			break;
		end
		
		%% reaced max?
		if i_loop>=maxloop
			fprintf(1,'reached max_loop. current params:[%f,%f]\n',smoothing_params(1),smoothing_params(end));
			if isempty(tmp)
				ind_opt=length(smoothing_params);%most accurate one theoretically
			end				
			ill=sprintf('%s_reached_max_loop',ill);
			break;
		else
			smoothing_params=smoothing_params_new;
		end
		
	end%while 1	


	%optimal	
	smoothing_param_opt=smoothing_params(ind_opt);
	f = fit(x,y,'smoothingspline','SmoothingParam',smoothing_param_opt);
	y_est=f(x);
	% err_opt=mean(abs(f(x)-y))./mean(abs(y));%in ratio
	err_opt=mean(abs(f(x)-y))./std(y);%in ratio

			% figure(11); hold on;
			% plot(x,y,'b-');
			% plot(x,y_est,'r-');
			% disp(smoothing_param_opt);
		
	out.param_opt=smoothing_param_opt;
	out.x=reshape(x,size(x_orig));%same size as input
	out.y_est=reshape(y_est,size(y_orig));%same size as input
	out.err=err_opt;%in ratio
	out.ill=ill;%ill message
	out.fitobject=f;
	out.loopnum=i_loop;
	
	
end
