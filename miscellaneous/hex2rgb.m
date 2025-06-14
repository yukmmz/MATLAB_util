function rgb = hex2rgb(hex)
    % hex2rgb: Converts a hexadecimal color code to an RGB array
    % Input:
    %   hex - A string representing the color code (e.g., "#1eb300") with or without '#'
    % Output:
    %   rgb - An RGB array [R, G, B], with each value in the range [0, 1]
    
    % remove '#' if present
    hex = strrep(hex, '#', '');
    
    r = hex2dec(hex(1:2)) / 255;
    g = hex2dec(hex(3:4)) / 255;
    b = hex2dec(hex(5:6)) / 255;
    
    rgb = [r, g, b];
end
