function out = showJoints( imgdir, row )
    img = imread([imgdir,'/',row.filepath]);
    cla, imagesc(img), axis image, hold on

    % display torso detected by berkeley poselets
    plotbox(row.torsobox,'w--')

    % display all the labeled joints; median of 5 annotations by mechanical turk
    myplot(row.coords(:,lookupPart('lsho','lelb','lwri')),'go-','linewidth',3)
    myplot(row.coords(:,lookupPart('rsho','relb','rwri')),'mo-','linewidth',3)
    myplot(row.coords(:,lookupPart('rhip','lhip')),'bo-','linewidth',3)
    myplot(row.coords(:,lookupPart('leye','reye','nose','leye')),'c.-','linewidth',3)

    out = true;
end

