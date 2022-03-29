clc
clear
close all

%% Load data
load('hw2.mat');

%% Step 0 -Initial position 
% 0.1 Render object with render_object
tic
I0 = render_object(V', F, C, M, M, H, W, w, cv, ck, cu);
toc
% Save result
imwrite(I0, '0.jpg');
imshow(I0);

%% Step 1 - Translate the transformation matrix by t1
% 1.1 Create a transformation matrix
L1 = transformation_matrix;

% 1.2 Apply translation
translate(L1, t1);
V1 = affine_transform(V', L1);

% 1.3 Render object with render_object
tic
I1 = render_object(V1, F, C, M, M, H, W, w, cv, ck, cu);
toc

% Save result
imwrite(I1, '1.jpg');
figure
imshow(I1);

%% Step 2 - Rotate the transformation matrix by theta around given axis
% 2.1 Create a new transformation matrix
L2 = transformation_matrix;

% 2.2 Apply rotation
rotate(L2,theta,g);

% 2.3 Transform previous coors
V2 = affine_transform(V1, L2);

% 2.4 Render object with render_object
tic
I2 = render_object(V2, F, C, M, M, H, W, w, cv, ck, cu);
toc

% Save result
imwrite(I2, '2.jpg');
figure
imshow(I2);

%% Step 3 - Translate the transformation matrix back
% 3.1 Create a new transformation matrix
L3 = transformation_matrix;

% 3.2 Apply translation
translate(L3, t2);

% 3.3 Transform previous coors
V3 = affine_transform(V2, L3);

% 3.4 Render object with render_object
tic
I3 = render_object(V3, F, C, M, M, H, W, w, cv, ck, cu);
toc

% Save result
imwrite(I3, '3.jpg');
figure
imshow(I3);
