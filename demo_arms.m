load examples.mat
imgdir = './images/';

i = 3100;
% i = randi(length(examples));

img = imread([imgdir,'/',examples(i).filepath]);
cla, imagesc(img), axis image, hold on

% display torso detected by berkeley poselets
% plotbox(examples(i).torsobox,'w--')
% leftArmParts = examples(i).coords(:,lookupPart('lsho','lelb','lwri'));
% leftArmBox = makeBox(leftArmParts);
leftArmBox = makeArmBox(examples(i), 'right');
plotbox(leftArmBox,'w--')
% myplot(armParts,'go-','linewidth',3)

