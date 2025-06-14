function if_delete_file=delete_file_if_exist(filepath)

	%delete old file if it exists.
	if exist(filepath, 'file')
		delete(filepath);
		if_delete_file=1;
	else
		if_delete_file=0;
	end

end