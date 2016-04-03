function out = showBoxes( imgdir, row )
    img = imread([imgdir,'/',row.filepath]);
    cla, imagesc(img), axis image, hold on

    leftArmBox = makeArmBox(row, 'left');
    plotbox(leftArmBox,'w--')

    rightArmBox = makeArmBox(row, 'right');
    plotbox(rightArmBox,'o--')

    faceBox = makeFaceBox(row);
    plotbox(faceBox,'m--')

    bodyBox = upperBodyBox(row, true);
    plotbox(bodyBox,'g--')

    out = true;
end

