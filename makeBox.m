function box = makeBox(dots)
    xs = dots(1,:);
    ys = dots(2,:);
    
    box = [min(xs) min(ys) max(xs) max(ys)];
end

