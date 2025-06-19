function cmap=make_cmap(clr_s, clr_e, numColors)
	%%% clr_s=[r,g,b] (1x3 array) or '#******' (string)
	%%% clr_e=[r,g,b] (1x3 array) or '#******' (string)
	
	
	if ischar(clr_s)
		if startsWith(clr_s,'#')
			hex=clr_s;
			hex = strrep(hex, '#', '');
			r = hex2dec(hex(1:2)) / 255;
			g = hex2dec(hex(3:4)) / 255;
			b = hex2dec(hex(5:6)) / 255;
			rgb = [r, g, b];
			clr_s=rgb;
		else
			error('clr_s must be a hex string or a 1x3 array');
		end
	end

	if ischar(clr_e)
		if startsWith(clr_e,'#')
			hex=clr_e;
			hex = strrep(hex, '#', '');
			r = hex2dec(hex(1:2)) / 255;
			g = hex2dec(hex(3:4)) / 255;
			b = hex2dec(hex(5:6)) / 255;
			rgb = [r, g, b];
			clr_e=rgb;
		else
			error('clr_e must be a hex string or a 1x3 array');
		end
	end


	rs=linspace(clr_s(1), clr_e(1), numColors)';
	gs=linspace(clr_s(2), clr_e(2), numColors)';
	bs=linspace(clr_s(3), clr_e(3), numColors)';
	cmap = [rs, gs, bs]; 

end %function