function [filepaths,n_file]=get_filepathlist(folderpath,filename_pattern)
	%% if filename_pattern='*.mat', find all file that match the pattern [folderpath '\' '*.mat'].
	
	Files = dir(fullfile(folderpath, filename_pattern));
	folders_tmp={Files.folder};
	names_tmp={Files.name};
	n_file=length(folders_tmp);
	for i_file=1:n_file
		filepaths{i_file} = fullfile(folders_tmp{i_file}, names_tmp{i_file});
	end
	
end