# math
Simple mathmatical functions.


## fmtimes
Fast mtimes (matrices multiplication) function.
It speeds up a large number of multiplication of small matrices, i.e. it is faster to execute
```MATLAB
Z = func_fmtimes(A, B);
```
than to execute
```MATLAB
Z=zeros(size(A, 1), size(B, 2), size(A, 3));
for i = 1:size(A, 3)
    Z(:, :, i) = mtimes(A(:, :, i), B(:, :, i));
end
```
if size(A, 1), size(A, 2), size(B, 2) are smaller than around 8.
Program to check the speed improvement is written at the end of the function file (comment-outed).


## get data of oscillation. 
```
[ampdata,ofsdata,oscdata]=get_data_of_oscillation(x)
```
Get data of oscillation of each period: max/min/mean/median of amplitude/offset(oscillation center), number of period, durations of period, indices of maxima/minima alternately, values of minima/maxima alternatedly (i.e. x(ind_peak)).

Usage example: marker maxima and minima of oscillation data.
```MATLAB
[ampdata, ofsdata, oscdata] = get_data_of_oscillation(wavedata);%Dt

ind_peak = oscdata.ind_peak;
%%% assume 1st ind_peak is maxima
ind_max = ind_peak([ 1:2:length(ind_peak) ]);
ind_min = ind_peak([ 2:2:(length(ind_peak)-1) ]);

fig=figure; hold on;
plot(time_dim, wavedata, 'b-');
plot(time_dim(ind_max), wavedata(ind_max), 'ro');
plot(time_dim(ind_min), wavedata(ind_min), 'go');
for i_m=1:length(ind_max)
    text(time_dim(ind_max(i_m)), wavedata(ind_max(i_m)), sprintf('%d',i_m),...
    'Fontsize',15);
end
for i_m=1:length(ind_min)
    text(time_dim(ind_min(i_m)), wavedata(ind_min(i_m)), sprintf('%d',i_m),...
    'Fontsize',15);
end
title('b=wavedata, r=maxima, g=minima', 'Interpreter', 'none');
```


## finite_diff
Finite difference function using second order central differences in the interior points and first order forward or backwards differences at the boundaries.

## finite_diff_mat
two dimentional version of finite_diff.


## to be improved
- make finite_diff n-dimentioanl finite_diff function.
