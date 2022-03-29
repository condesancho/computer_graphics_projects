clear

load('racoon_hw1.mat');

tic
I = render(vertices_2d, faces, vertex_colors, depth, 0);
toc

% imshow(I);
imwrite(I, 'racoon_flat.png');