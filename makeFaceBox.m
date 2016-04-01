function box = makeFaceBox( row )
    dims = row.imgdims;
    
    leye = row.coords(:,lookupPart('leye'));
    reye = row.coords(:,lookupPart('reye'));
    nose = row.coords(:,lookupPart('nose'));
    
%     diff = 20;
%     max_leye = leye + diff;
%     min_leye = leye - diff;
%     
%     diff = 20;
%     max_reye = reye + diff;
%     min_reye = reye - diff;
%     
%     diff = 20;
%     max_nose = nose + diff;
%     min_nose = nose - diff;
    
    allCoords = [leye reye nose];
    assumedBox = makeBox(allCoords);
    
    width = assumedBox(3) - assumedBox(1);
    height = assumedBox(4) - assumedBox(2);
    diff_width = 1.5 * width
    diff_height = 2.5 * height
    
    assumedBox(1) = assumedBox(1) - diff_width;
    assumedBox(2) = assumedBox(2) - diff_height;
    assumedBox(3) = assumedBox(3) + diff_width;
    assumedBox(4) = assumedBox(4) + diff_height;
    
    if assumedBox(1) < 0
        assumedBox(1) = 0;
    end
    if assumedBox(2) < 0
        assumedBox(2) = 0;
    end
    if assumedBox(3) > dims(2)
        assumedBox(3) = dims(2);
    end
    if assumedBox(4) > dims(1)
        assumedBox(4) = dims(1);
    end
    
    box = assumedBox;
end


