function Err=calcError(y_ans,y_est)
	y_ans=y_ans(:);
	y_est=y_est(:);
	y_ans_cnt=y_ans-mean(y_ans);
	
	RMSE=sqrt(mean((y_ans - y_est).^2));
	% relative RMSE
	rRMSE_std=RMSE/std(y_ans);
	rRMSE_hAmp=RMSE/(0.5*(max(y_ans)-min(y_ans)));
	
	MAE=mean(abs(y_ans - y_est));
	WAPE=MAE/mean(abs(y_ans));
	% WAPE=MAE/mean(abs(y_ans_cnt));

	%%% output
	Err.RMSE=RMSE;
	Err.rRMSE_std=rRMSE_std;
	Err.rRMSE_hAmp=rRMSE_hAmp;
	Err.MAE=MAE;
	Err.WAPE=WAPE;
	
end