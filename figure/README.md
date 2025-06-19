# figure




## Some tips to make beutiful figures for journal.



## funcs
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


### make_cmap
`make_cmap(clr_s, clr_e, numColors)`

Make colormap of `numColors` starts with `clr_s` and ends with `clr_e`.
`clr_s` and `clr_s` should be hex string '#xxxxxx' or 1x3 array that specifies a color. 
Output array will be (numColors)x3 array with each row represents one color.










