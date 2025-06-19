function out = get_timestr_now()
	nichiji=clock;
	out = sprintf('%04d/%02d/%02d %02d:%02d (%02d)',...
		nichiji(1),nichiji(2),nichiji(3),nichiji(4),nichiji(5),round(nichiji(6)));
end