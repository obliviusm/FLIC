load examples.mat
imgdir = './images/';

for i = 1:length(examples)
    img = imread([imgdir,'/',examples(i).filepath]);
    coords = upperBodyBox(examples(i));
    if coords == false
        continue;
    end
    croppedImage = imcrop(img, coords);
    
    folder = './body_img';
    fullFileName = fullfile(folder, examples(i).filepath);
    imwrite(croppedImage, fullFileName);
end