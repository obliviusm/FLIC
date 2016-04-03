function box = makeMaxBox(boxes, dims)
    x1 = min(boxes(:,1));
    y1 = min(boxes(:,2));
    x2 = max(boxes(:,3));
    y2 = max(boxes(:,4));
    
    if x1 > 1
        x1 = x1 - 1;
    end
    if y1 > 1
        y1 = y1 - 1;
    end
    if x2 + 1 < dims(1)
        x2 = x2 + 1;
    end
    if y2 + 1 < dims(2)
        y2 = y2 + 1;
    end
    
    box = [x1 y1 x2 y2];
end
