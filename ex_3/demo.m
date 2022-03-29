clear
clc
close all

load('hw3.mat');

%% Set light position and intensity
lights = PointLight(point_light_pos', point_light_intensity);

%% Gouraud shader
shader = 1;

%% Ambient
Ka = ka;
Kd = 0*kd;
Ks = 0*ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (gouraud)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
figure(1);
% Inverse the image to face in the correct way
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
imshow(Y);
imwrite(Y, 'gouraud_ambient.jpg');

%% Difussion 
Ka = 0*ka;
Kd = kd;
Ks = 0*ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (gouraud)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
figure(2);
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
imshow(Y);
imwrite(Y, 'gouraud_diffusion.jpg');

%% Specular 
Ka = 0*ka;
Kd = 0*kd;
Ks = ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (gouraud)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
figure(3);
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
imshow(Y);
imwrite(Y, 'gouraud_specular.jpg');

%% All together 
Ka = ka;
Kd = kd;
Ks = ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (gouraud)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
figure(4);
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
imshow(Y);
imwrite(Y, 'gouraud_all.jpg');

%% Phong shader
shader = 2;

%% Ambient
Ka = ka;
Kd = 0*kd;
Ks = 0*ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (phong)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
figure(5);
imshow(Y);
imwrite(Y, 'phong_ambient.jpg');

%% Difussion 
Ka = 0*ka;
Kd = kd;
Ks = 0*ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (phong)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
figure(6);
imshow(Y);
imwrite(Y, 'phong_diffusion.jpg');

%% Specular 
Ka = 0*ka;
Kd = 0*kd;
Ks = ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (phong)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
figure(7);
imshow(Y);
imwrite(Y, 'phong_specular.jpg');

%% All together 
Ka = ka;
Kd = kd;
Ks = ks;

mat = PhongMaterial(Ka, Kd, Ks, n_phong);

%% render_object (phong)
tic
Y = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors', face_indices', mat, lights,Ia');
toc
for i = 1:3
    Y(:,:,i) = Y(:,:,i)';
end
figure(8);
imshow(Y);
imwrite(Y, 'phong_all.jpg');
