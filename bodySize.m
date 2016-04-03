function [ size ] = bodySize( row, type )
    bodyBox = upperBodyBox(row, false);
    width = bodyBox(3) - bodyBox(1);
    height = bodyBox(4) - bodyBox(2);
    if strcmp(type,'width')
        size = width;
    elseif strcmp(type,'height')
        size = height;
    else % diagonal
        size = sqrt(width*width + height*height);
    end
end

