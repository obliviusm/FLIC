load examples.mat

for i = 1:length(examples)
    examples(i).left_arm = makeArmBox(examples(i), 'left');
    examples(i).right_arm = makeArmBox(examples(i), 'right');
end

save('examples_arms.mat', 'examples');