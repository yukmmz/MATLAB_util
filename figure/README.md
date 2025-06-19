# figure

## Some tips to make beutiful figures for journal.

```MATLAB
%%%%% SETTINGS IN HEADER
%%% color
set(0, 'DefaultFigureColor', [1 1 1]); % set background color white
%%% text
set(0, 'DefaultAxesFontName', 'Times New Roman'); 
set(0, 'DefaultTextInterpreter', 'none'); % avoid LaTeX interpreter
FS=10;
set(0, 'DefaultAxesFontSize', FS);
set(0, 'DefaultAxesTitleFontSize', FS);
set(0, 'DefaultLegendFontSize', FS);
%%% plot objects
set(0, 'DefaultLineMarkerSize', 5);%% originally:6
set(0, 'DefaultLineLineWidth', 1);%% originally:0.5


%%%%% PLOT
fig=figure; hold on;
%% plot example
x = linspace(0, 1, 10);
plot(x, sin(2*pi*x), 'o-', 'Color', 'k', ...
 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'm', ...
 'MarkerSize', 5, ...
 'DisplayName', 'sin(2*pi*x)');
plot(x, cos(2*pi*x), 'o-', 'Color', [1, 1, 1]*0.5, ...
 'MarkerFaceColor', [0.1, 0.1, 0.9], 'MarkerEdgeColor', [0.1, 0.1, 0.6], ...
 'MarkerSize', 3, ...
 'DisplayName', 'cos(2*pi*x)');


%%%%% AXIS SETTINGS
ax = gca;
%%% axis ticks and labels
xlabel('Time (s)');
    xlim([0, 1]);
    ax.XTick=ax.XLim(1):0.5:ax.XLim(2);
    ax.XTickLabel = []; %% remove label of x axis while leaving ticks
    ax.XColor='none'; %% remove x axis
ylabel('Angles (deg)');
    ylim([-1, 1]);
    ax.YTick=ax.YLim(1):0.2:ax.YLim(2);
    ax.YTickLabel = []; %% remove label of y axis while leaving ticks
    ax.YColor='none'; %% remove y axis
legend('Interpreter', 'none'); %% add legend avoiding LaTeX interpreter.
title('Velocity = 2.1 (m/s)');
%%% axis aspect ratio
pbaspect([4 3 1]); % [x-wise, y-wise, z-wise]
axis equal; % the same length on each axis represents the same physical distance


%%%%% AT THE END
%%% fig position and size
fig.Position= [500 800 300 150]; %[left, bottom, width, height]
%%% save
saveas(fig,[figname '.fig']); %% save as matlab figure object
saveas(fig,[figname '.svg']); %% save as svg (vector graphic, can be further refined in PowerPoint)
saveas(fig,[figname '.png']); %% save as png. easy to handle.

```










## Utility functions
### fillrect
`fillrect(x0,x1,y0,y1,option)`

Fill the axis by rectangle of [x0, x1]x[y0, y1].
- `option.color` : face color (default : none)
- `option.EdgeColor` : EdgeColor (default : none)
- `option.FaceAlpha` : FaceAlpha (default : 1)
- `option.tobottom` : whether to locate the rectangle to bottom or not (default : 1)
- `option.shrinkLB` : if specified, x0 will be shifted toward right by option.shrinkLB*(x1-x0), and y0 will be shifted toward top by option.shrinkLB*(x1-x0)
- `option.shrinkRB` : if specified, x1 will be shifted toward left by option.shrinkRB*(x1-x0), and y0 will be shifted toward top by option.shrinkRB*(x1-x0)
- `option.shrinkL` : if specified, x0 will be shifted toward right by option.shrinkL*(x1-x0)
- `option.shrinkR` : if specified, x1 will be shifted toward left by option.shrinkR*(x1-x0)
- `option.shrinkT` : if specified, y1 will be shifted toward bottom by option.shrinkT*(y1-y0)
- `option.shrinkB` : if specified, y0 will be shifted toward top by option.shrinkB*(y1-y0)

If option.shrinkLB or option.shrinkRB are specified, other shrink params are ignored. 

Example:
```MATLAB
clearvars fillopt
fillopt.color = hex2rgb('#dddddd');
fillopt.EdgeColor = 'none';
fillopt.FaceAlpha = 1;
fillopt.tobottom = 1;
fillopt.shrinkL = 0.0;
fillopt.shrinkB = 0.0;

figure; hold on;
x = linspace(0, 1, 100);
plot(x, sin(2*pi*x), 'b-');
ax = gca; y0 = ax.YLim(1); y1 = ax.YLim(2);
x0 = 0; x1 = 0.5;
func_fillrect(x0,x1,y0,y1,fillopt);

```



### make_cmap
`make_cmap(clr_s, clr_e, numColors)`

Make colormap of `numColors` starts with `clr_s` and ends with `clr_e`.
`clr_s` and `clr_s` should be hex string '#xxxxxx' or 1x3 array that specifies a color. 
Output array will be (numColors)x3 array with each row represents one color.










