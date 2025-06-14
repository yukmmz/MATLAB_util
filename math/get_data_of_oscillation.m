%%% get data of oscillation. 
%%% max,min,mean of amplitude, offset(osc. center)
%%% number of periods, durations of period, indices of peaks, peak values
function [ampdata,ofsdata,oscdata]=get_data_of_oscillation(x)

	dx=x(2:end)-x(1:end-1);
	%includes maxima and minima alternately
	ind_peak=find(dx(2:end-1).*dx(1:end-2)<=0) + 1;%cf.33-56
	% disp(ind_peak);
	
	%%% select one peak if peak indices exists in a row. cf.34-25
		% this does not includes...
		%	min-max, max-min in a row
	d_ind_peak=ind_peak(2:end)-ind_peak(1:end-1);
		% disp(ind_peak);
		% disp(d_ind_peak);
	d_ind1s=find(d_ind_peak==1);%check list. ind_peak(d_ind1s+1) are also peak.
	rmv_indinds=[];%indices of ind_peak that will be removed.
	while 1		
		
		if isempty(d_ind1s); break; end;
		
		dind_1=min(d_ind1s);
		inds_peak_inarow=[dind_1];%x(ind_peak(inds_peak_inarow)) have same peak value.
		peak_val=x(ind_peak(dind_1));
		while 1
			dind_1=dind_1+1;
			if peak_val==x(ind_peak(dind_1))
				inds_peak_inarow=[inds_peak_inarow dind_1];
			else
				break;
			end
		end
		
		%% remove peaks in a row except one of them.
		%% if min-max in a row, length(inds_peak_inarow)==1, then, inds_tmp is empty.
		ind_1s_mean=round(mean(inds_peak_inarow));%ind that will be kept
		inds_tmp=setdiff(inds_peak_inarow,ind_1s_mean);
		rmv_indinds=[rmv_indinds inds_tmp];
		
		%% remove inds from check list
		d_ind1s=setdiff(d_ind1s,inds_peak_inarow);
		
			% disp(inds_tmp)
			% ans = input('---:');
			% disp('---')
	end
	
	inds_new=setdiff(1:length(ind_peak),rmv_indinds);
	ind_peak=sort(ind_peak(inds_new),'ascend');
	
	
	
	x_peak=x(ind_peak);%minima/maxima values
	n_period=length(ind_peak)/2;%number of periods
	
	%calc durations of period
	all_numbers=1:length(ind_peak);
	odd_numbers=all_numbers(rem(all_numbers, 2) == 1);
	% even_numbers=all_numbers(rem(all_numbers, 2) == 0);
	ind_split_period=ind_peak(odd_numbers);%indices of only maxima (or only minima)
	% ind_split_amari=ind_peak(even_numbers);
	dur_period=ind_split_period(2:end)-ind_split_period(1:end-1);
	
	
	%list of oscilation amp, center
	amps=abs(x_peak(2:end)-x_peak(1:end-1));
	ofss=(x_peak(2:end)+x_peak(1:end-1))/2;
	
	
	%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%
	%%% output
	%representative value of amp/offset, and other data.
	ampdata.amps=amps;%all amplitude
	ampdata.max=max(amps);
	ampdata.min=min(amps);
	ampdata.mean=mean(amps,'omitnan');
	ampdata.med=median(amps,'omitnan');
	
	ofsdata.ofss=ofss;%all ofsets(oscilation center)
	ofsdata.max=max(ofss);
	ofsdata.min=min(ofss);
	ofsdata.mean=mean(ofss,'omitnan');
	ofsdata.med=median(ofss,'omitnan');
	
	oscdata.n_period=n_period;%number of periods
	oscdata.dur_period=dur_period;%durations of period
	oscdata.ind_peak=ind_peak;%indices of maxima and minima alternately
	oscdata.x_peak=x_peak;%minima/maxima values=x(ind_peak)
	%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%
	
	
	% ind_valid=find(abs(ofss-ofs_med)<30);%remove outlier
	% if isempty(ind_valid)
		% ofs_min=nan;
		% ofs_max=nan;
	% else
		% ofs_min=min(ofss(ind_valid));
		% ofs_max=max(ofss(ind_valid));
	% end
	
	%%% plot for check
	% ind_peak_mid=round((ind_peak(2:end)+ind_peak(1:end-1))/2);%for plot
	% figure(1);hold on;
	% plot(1:length(x),x,'b.-');
	% plot(ind_peak,x_peak,'bo');
	% plot(ind_peak_mid,ofss,'r*-');
	% plot(ind_peak_mid,ofss+amps/2,'m+-');
	% plot(ind_peak_mid,ofss-amps/2,'m+-');
	
	% fprintf(1,'amp_max=%f[deg]\n',amp_max);
	% fprintf(1,'ofs_min=%f[deg]\n',ofs_min);
	% fprintf(1,'ofs_max=%f[deg]\n',ofs_max);

end