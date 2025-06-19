function if_make_folder=make_folder_if_not_exist(folderPath)

	if exist(folderPath, 'dir') == 0 
		mkdir(folderPath); 
		if_make_folder=1;
	else
		if_make_folder=0;
	end

end