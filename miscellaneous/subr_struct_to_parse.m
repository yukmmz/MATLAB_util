%% parse_struct_props
% usage
% struct_to_parse = (variable name of struct);
% if_print_field = 1; %optional.
% run('subr_struct_to_parse.m');
% % then you can access the fields of struct_to_parse without (variable name of struct).


if ~exist('if_print_field', 'var')
	if_print_field=0;
end
%% parse struct_to_parse
fields=fieldnames(struct_to_parse);
if if_print_field; fprintf(1,'parsed parameters:\n'); end
for i = 1:numel(fields)
	fieldName = fields{i};
	eval([fieldName ' = struct_to_parse.(fieldName);']);
	if if_print_field; fprintf(1,'   %s\n',fieldName); end;
end
if if_print_field; fprintf(1,'\n'); end;

return