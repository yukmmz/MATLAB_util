# math
Simple mathmatical functions.


## fmtimes
Fast mtimes (matrices multiplication) function.
It speeds up a large number of multiplication of small matrices, i.e.
```MATLAB
% when 
k=3; l=4; m=5; N=1e4;
A = rand(k, l, N);
B = rand(l, m, N);

% it is faster to execute
Z = func_fmtimes(A, B);

% than to execute
for i = 1:size(A, 3)
    Z(:, :, i) = mtimes(A(:, :, i), B(:, :, i));
end

% if k, l, m are smaller than around 8 and N is larger than around 100.
```

Program to check the speed improvement is written at the end of the function file (comment-outed).


## get_data_of_oscillation
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
plot(wavedata, 'b-');
plot(wavedata(ind_max), 'ro');
plot(wavedata(ind_min), 'go');
for i_m=1:length(ind_max)
    text(wavedata(ind_max(i_m)), sprintf('%d',i_m), 'Fontsize',15);
end
for i_m=1:length(ind_min)
    text(wavedata(ind_min(i_m)), sprintf('%d',i_m), 'Fontsize',15);
end
title('b=wavedata, r=maxima, g=minima', 'Interpreter', 'none');
```


## finite_diff
Finite difference function using second order central differences in the interior points and first order forward or backwards differences at the boundaries.

## finite_diff_mat
two dimentional version of finite_diff.


## to be improved
- make finite_diff n-dimentioanl finite_diff function.
