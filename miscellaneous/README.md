# miscellaneous
miscellaneous utility functions.

## calcError
Caculate various error : RMSE (Root Mean Square Error), relative RMSE, MAE (Mean Absolute Error), WAPE (Weighted MAE).
The relative error (rRMSE, WAPE) are normalized by the first input `y_ans`.
```MATLAB
Err=calcError(y_ans,y_est)
fprintf(1,'RMSE : %f\n',Err.RMSE);
fprintf(1,'rRMSE normalized by std(y_ans) : %f\n',Err.rRMSE_std);
fprintf(1,'rRMSE normalized by half amp of y_ans : %f\n',Err.rRMSE_hAmp);
fprintf(1,'MAE : %f\n',Err.MAE);
fprintf(1,'WAPE : %f\n',Err.WAPE);
```

## hex2rgb
It does exactly what the name says.

## delete_file_if_exist
It does exactly what the name says.

## get_filepathlist
```MATLAB
[filepaths,n_file]=get_filepathlist(folderpath,filename_pattern)
```
Get the list of filepaths that matches filename_pattern, e.g. if `filename_pattern='\*.mat'`, find all file that match the pattern `fullfile(folderpath, '*.mat')`.



## to be improved
- make outout number variable in get_filepathlist

