clc
clear

%% Load data %%
load('hw2.mat');

%% Step 0 -Initial position 
% 0.1 Render object with render_object


% Save result
imwrite(I0, '0.jpg');

%% Step 0.5 - Create a transformation matrix

%% Step 1 - Translate the transformation matrix by t1
% 1.1 Apply translation

% 1.2 Render object with render_object

% Save result
imwrite(I1, '1.jpg');

%% Step 2 - Rotate the transformation matrix by theta around given axis
% 2.1 Apply rotation

% 2.2 Render object with render_object

% Save result
imwrite(I2, '2.jpg');

%% Step 3 - Translate the transformation matrix back
% 3.1 Apply translation

% 3.2 Render object with render_object

% Save result
imwrite(I3, '3.jpg');
