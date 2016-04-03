load examples.mat
imgdir = './images/';

for i = 1:length(examples)
    coords = upperBodyBox(examples(i));
    if coords == false
        continue;
    end
    
    
    
    img = imread([imgdir,'/',examples(i).filepath]);
    croppedImage = imcrop(img, coords);
    
    folder = './body_img';
    fullFileName = fullfile(folder, examples(i).filepath);
    imwrite(croppedImage, fullFileName);
end