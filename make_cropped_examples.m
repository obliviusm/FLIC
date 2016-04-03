load examples_arms.mat

for i = 1:length(examples)
    boxes = [examples(i).torsobox; upperBodyBox(examples(i), true); makeArmBox(examples(i), 'left'); makeArmBox(examples(i), 'right'); makeFaceBox(examples(i))];
    new_coodrs = makeMaxBox(boxes);
    
    examples(i).coords(1,:) = examples(i).coords(1,:) - new_coodrs(1);
    examples(i).coords(2,:) = examples(i).coords(2,:) - new_coodrs(2);
    
    examples(i).imgdims = [new_coodrs(3) - new_coodrs(1), new_coodrs(4) - new_coodrs(2), 3];
    
    coord_start = horzcat(new_coodrs(1:2), new_coodrs(1:2));
    examples(i).torsobox = examples(i).torsobox - coord_start;
    examples(i).left_arm = examples(i).left_arm - coord_start;
    examples(i).right_arm = examples(i).right_arm - coord_start;
    examples(i).upper_body = examples(i).upper_body - coord_start;
    
    imgdir = './body_img/';
    showJoints( imgdir, examples(i) );
    
    all_coords = {examples(i).torsobox, examples(i).left_arm, examples(i).right_arm, examples(i).upper_body};
    all_coords = vertcat(all_coords{:});
    if min(min(all_coords)) < -0.1
        1
    end
end

% save('examples_cropped.mat', 'examples');