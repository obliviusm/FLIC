load examples.mat
imgdir = './images/';

i = 3100;
i = randi(length(examples));
% i = 97;

img = imread([imgdir,'/',examples(i).filepath]);
cla, imagesc(img), axis image, hold on

leftArmBox = makeArmBox(examples(i), 'left');
plotbox(leftArmBox,'w--')

rightArmBox = makeArmBox(examples(i), 'right');
plotbox(rightArmBox,'o--')

faceBox = makeFaceBox(examples(i));
plotbox(faceBox,'m--')

bodyBox = upperBodyBox(examples(i));
plotbox(bodyBox,'g--')