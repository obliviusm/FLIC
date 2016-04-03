load examples.mat
imgdir = './images/';

mkdir('body_img');
for i = 1:length(examples)
%     coords = upperBodyBox(examples(i));
%     if coords == false
%         continue;
%     end
    boxes = [examples(i).torsobox; upperBodyBox(examples(i), true); makeArmBox(examples(i), 'left'); makeArmBox(examples(i), 'right'); makeFaceBox(examples(i))];
    new_coodrs = makeMaxBox(boxes, examples(i).imgdims);
    
%     showBoxes( imgdir, examples(i) );
%     img = imread([imgdir,'/',examples(i).filepath]);
%     cla, imagesc(img), axis image, hold on
%     plotbox(new_coodrs,'m--')
    
    
    x1 = new_coodrs(1);
    y1 = new_coodrs(2);
    width = new_coodrs(3) - new_coodrs(1);
    height = new_coodrs(4) - new_coodrs(2);
    my_map = [x1, y1, width, height];
    img = imread([imgdir,'/',examples(i).filepath]);
    croppedImage = imcrop(img, my_map);
%     cla, imagesc(croppedImage), axis image, hold on
    
    
    folder = './body_img';
    fullFileName = fullfile(folder, examples(i).filepath);
    imwrite(croppedImage, fullFileName);
end