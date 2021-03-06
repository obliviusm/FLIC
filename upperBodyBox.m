function box = upperBodyBox( row, with_diff )
    dims = row.imgdims;
    
    lsho = row.coords(:,lookupPart('lsho'));
    lelb = row.coords(:,lookupPart('lelb'));
    lwri = row.coords(:,lookupPart('lwri'));
    
    rsho = row.coords(:,lookupPart('rsho'));
    relb = row.coords(:,lookupPart('relb'));
    rwri = row.coords(:,lookupPart('rwri'));
    
    leye = row.coords(:,lookupPart('leye'));
    reye = row.coords(:,lookupPart('reye'));
    
    lhip = row.coords(:,lookupPart('lhip'));
    rhip = row.coords(:,lookupPart('rhip'));
    
    allCoords = [lsho lelb lwri rsho relb rwri leye reye lhip rhip];
    
    if max(max(isnan(allCoords))) == 1
        box = false;
        return;
    end
    
    assumedBox = makeBox(allCoords);
    
    width = assumedBox(3) - assumedBox(1);
    height = assumedBox(4) - assumedBox(2);
    
    if with_diff
        k_width = 0.2;
        k_height = 0.23;
    else
        k_width = 0;
        k_height = 0;
    end
    
    diff_width = k_width * width;
    diff_height = k_height * height;
    
%     diff_width = 100;
%     diff_height = 100;
    
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


