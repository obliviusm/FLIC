load examples.mat

for i = 1:length(examples)
    examples(i).left_arm = makeArmBox(examples(i), 'left');
    examples(i).right_arm = makeArmBox(examples(i), 'right');
    examples(i).upper_body = upperBodyBox(examples(i), true);
end

save('examples_arms.mat', 'examples');