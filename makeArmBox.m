function box = makeArmBox( row, side )
    dims = row.imgdims;
    
    bodyDiagonal = bodySize(row, 'diagonal');
    % get main parts
    if( strcmp(side,'left') )
        sho = row.coords(:,lookupPart('lsho'));
        elb = row.coords(:,lookupPart('lelb'));
        wri = row.coords(:,lookupPart('lwri'));
    else
        sho = row.coords(:,lookupPart('rsho'));
        elb = row.coords(:,lookupPart('relb'));
        wri = row.coords(:,lookupPart('rwri'));
    end
    
    diff = 10;
    max_sho = sho + diff;
    min_sho = sho - diff;
    
    diff = 10;
    max_elb = elb + diff;
    min_elb = elb - diff;
    % make some distance from wrist (try to get palm as well)
    diff = bodyDiagonal * 0.17;
    max_wri = wri + diff;
    min_wri = wri - diff;
    
%     allCoords = [sho elb wri max_wri min_wri];
    allCoords = [sho elb wri max_sho max_elb max_wri min_sho min_elb min_wri];
    assumedBox = makeBox(allCoords);
    
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

