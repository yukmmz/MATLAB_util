function fillrect(x0,x1,y0,y1,option)
	
	if isfield(option, 'color')
		color = option.color;
	else
		color = [1 1 1]*0.9;
	end

	if isfield(option, 'EdgeColor')
		EdgeColor = option.EdgeColor;
	else
		EdgeColor = 'none';
	end

	if isfield(option, 'FaceAlpha')
		FaceAlpha = option.FaceAlpha;
	else
		FaceAlpha = 1;
	end

	if isfield(option, 'tobottom')
		tobottom = option.tobottom;
	else
		tobottom = 1;
	end

	if isfield(option, 'shrinkLB')
		x0 = x0 + option.shrinkLB*(x1-x0);
		y0 = y0 + option.shrinkLB*(x1-x0);
	elseif isfield(option, 'shrinkRB')
		x1 = x1 - option.shrinkRB*(x1-x0);
		y0 = y0 + option.shrinkRB*(x1-x0);
	else
		if isfield(option, 'shrinkL')
			x0 = x0 + option.shrinkL*(x1-x0);
		end
		if isfield(option, 'shrinkR')
			x1 = x1 - option.shrinkR*(x1-x0);
		end
		if isfield(option, 'shrinkT')
			y1 = y1 - option.shrinkT*(y1-y0);
		end
		if isfield(option, 'shrinkB')
			y0 = y0 + option.shrinkB*(y1-y0);
		end
	end
	

	x_fill = [x0 x1 x1 x0];
	y_fill = [y0 y0 y1 y1];
	hFill=fill(x_fill, y_fill, color,'FaceAlpha', FaceAlpha,  'EdgeColor', EdgeColor);
	if tobottom
		uistack(hFill, 'bottom');
	end
end