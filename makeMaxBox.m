function box = makeMaxBox(boxes)
    x1 = min(boxes(:,1));
    y1 = min(boxes(:,2));
    x2 = max(boxes(:,3));
    y2 = max(boxes(:,4));
    
    box = [x1 y1 x2 y2];
end
