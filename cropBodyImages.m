load examples.mat
imgdir = './images/';

for i = 1:length(examples)
%     coords = upperBodyBox(examples(i));
%     if coords == false
%         continue;
%     end
    boxes = [examples(i).torsobox; upperBodyBox(examples(i), true); makeArmBox(examples(i), 'left'); makeArmBox(examples(i), 'right'); makeFaceBox(examples(i))];
    coodrs = makeMaxBox(boxes);
    
    
    
    img = imread([imgdir,'/',examples(i).filepath]);
    croppedImage = imcrop(img, coords);
    
    folder = './body_img';
    fullFileName = fullfile(folder, examples(i).filepath);
    imwrite(croppedImage, fullFileName);
end