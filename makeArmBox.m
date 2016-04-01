function box = makeArmBox( row )
    % get main parts
    sho = row.coords(:,lookupPart('lsho'));
    elb = row.coords(:,lookupPart('lelb'));
    wri = row.coords(:,lookupPart('lwri'));
    
    diff = 10;
    max_sho = sho + diff;
    min_sho = sho - diff;
    
    diff = 10;
    max_elb = elb + diff;
    min_elb = elb - diff;
    % make some distance from wrist (try to get palm as well)
    diff = 30;
    max_wri = wri + diff;
    min_wri = wri - diff;
    
%     allCoords = [sho elb wri max_wri min_wri];
    allCoords = [sho elb wri max_sho max_elb max_wri min_sho min_elb min_wri];
    box = makeBox(allCoords);
end

