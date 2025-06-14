function Z=fmtimes(A,B)
% fast-mtimes
% appropriate for a large number of multiplication of small matrices.
% so, appropriate for large N1*N2*...*Nn, small k*l*m where
% 	A is k*l*N1*N2*...*Nn array.
% 	B is l*m*N1*N2*...*Nn array.
% 	Z is l*m*N1*N2*...*Nn array.
% 	A(:,:,i1,...,in) is k*l matrix of data (i1,...,in)
% 	B(:,:,i1,...,in) is l*m matrix of data (i1,...,in)
% 	Z(:,:,i1,...,in) is k*m matrix of data (i1,...,in)
% 	Z(:,:,i1,...,in) = A(:,:,i1,...,in) * B(:,:,i1,...,in)

% maybe spped up for 
% k*l*m<8*8*8, N1*N2*...*Nn>100
	
	size_A=size(A);
	size_B=size(B);
	
	if ~all(size_A([2 3:end])==size_B([1 3:end]))
		fprintf(1,'\n\n inappropriate size for A,B \n\n');
		size_A
		size_B
		return
	end

	n=ndims(A)-2;%% dimention of data
	permarr1=[(n+3) 1 3:(n+2) 2];
	permarr2=[1 (n+3) 3:(n+2) 2];
	
	%%% output
	%%% cf.35-47-49
	Z = permute(sum(bsxfun(@times, A ,permute( B ,permarr1)),2),permarr2);

	return

end


%%%%%%%%%%%%%%%%%%%%%
%%% check_speed_up_fmtimes.m

% clear all 
% close all
% %%% ***********************
% % N_mullist=2.^linspace(11:20);
% k=3;
% l=4;
% m=5;
% n_dim_data=3;
% n_cal=5;
% %%% ***********************
% set(0, 'DefaultLineMarkerSize', 10);%% default:6
% set(0, 'DefaultLineLineWidth', 1);%% default:0.5
% primes=[2,3,5,7,11,13,17,19,23,29,31,37];
% N_data=primes(1:n_dim_data);
% if n_cal*n_dim_data==1
% primes=[1]; N_data=1;
% end

% for i_cal=1:n_cal
	% fprintf(1,'i_cal=%d\n',i_cal);
	
	% %%% decide number of data, make matrix
	% i_tmp=rem(i_cal-1,n_dim_data)+1;
	% N_data(i_tmp)=N_data(i_tmp)*primes(i_tmp);
	% A=rand([k l N_data]);
	% B=rand([l m N_data]);

	% n_rep=1e1;	
	% %%% func_fmtimes
	% ts1=tic;
	% for i=1:n_rep
		% Z=func_fmtimes(A,B);
	% end
	% te1=toc(ts1);

	% %%% mtimes
	% Y=zeros([k m N_data]);
	% command_for='';
	% command_end='';
	% command_Y='Y(:,:';
	% command_A='A(:,:';
	% command_B='B(:,:';
	% for i_dim=1:n_dim_data
		% command_for=sprintf('%sfor i%d=1:N_data(%d);\n',command_for,i_dim,i_dim);
		% command_end=sprintf('%send; ',command_end);
		% command_Y=sprintf('%s,i%d',command_Y,i_dim);
		% command_A=sprintf('%s,i%d',command_A,i_dim);
		% command_B=sprintf('%s,i%d',command_B,i_dim);
	% end
	% command_Y=sprintf('%s)',command_Y);
	% command_A=sprintf('%s)',command_A);
	% command_B=sprintf('%s)',command_B);
	% commandtxt=sprintf('%s\t%s=%s*%s;\n%s',command_for,command_Y,command_A,command_B,command_end);
			
	% ts2=tic;
	% for i=1:n_rep
		% eval(commandtxt);
	% end
	% te2=toc(ts2);

	% %%% for debug
	% % N_data
	% % commandtxt
	% err=sum(abs(Z(:)-Y(:)));
	% fprintf(1,'  err=%.2e\n',err);

	% %%% for plot data
	% te1s(i_cal)=te1;
	% te2s(i_cal)=te2;
	% N_data_cell{i_cal}=N_data;
	% N_mullist(i_cal)=prod(N_data)*n_rep;
		
% end%for i_cal

% %%% plot
% figure; hold on;
% yyaxis left;
% plot(log10(N_mullist),te1s,'r.-');
% plot(log10(N_mullist),te2s,'b.-');
% ylabel('calc time[s]')
% yyaxis right;
% plot(log10(N_mullist),te2s./te1s,'g.-');
% plot(log10(N_mullist),ones(size(N_mullist)),'k--');
% ylabel('spped-up ratio')
% legend('func fmtimes', 'mtimes', 'speed-up ratio');
% xlabel('log10(# of multiplication)')

	
% return
	