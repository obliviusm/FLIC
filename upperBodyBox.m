function box = upperBodyBox( row )
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
    
    if max(isnan(allCoords)) == 1
        box = false;
        return;
    end
    
    assumedBox = makeBox(allCoords);
    
    width = assumedBox(3) - assumedBox(1);
    height = assumedBox(4) - assumedBox(2);
    diff_width = 0.2 * width;
    diff_height = 0.23 * height;
    
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


