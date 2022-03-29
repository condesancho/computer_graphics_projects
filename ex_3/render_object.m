function Img = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors, face_indices, mat, lights, Ia)

    % Calculate normal vectors of vertices
    normals = calculate_normals(verts, face_indices);
    
    % Project points and find depth
    [P, D] = project_cam_ku(focal, eye, lookat, up, verts);
    
    % Find pixel values
    P = rasterize(P, M, N, H, W);

    % Initialize the image with the background color
    Img = zeros(M, N, 3);
    for i = 1:3
        Img(:,:,i) = bg_color(i);
    end
        
    % Find the depth of every triangle
    i = 1:size(face_indices,2);
    means = mean(D(face_indices));
    
    % Store the order that the triangles are filled
    [~, order] = sort(means, 'descend');
        
    for i = 1:size(face_indices,2)
        % Make the arrays to be passed in the functions
        idx = face_indices(:,order(i));
                
        verts_p = P(:,idx);        
        verts_n = normals(:,idx);
        verts_c = vert_colors(:,idx);
        
        % Calculate the centre of mass of the triangle
        bcoords = mean(verts(:,idx),2);
        
        % Use appropriate function according to the value of shader
        if shader == 1
            Img = shade_gouraud(verts_p, verts_n, verts_c, bcoords, eye, mat, lights, Ia, Img);
        elseif shader == 2
            Img = shade_phong(verts_p, verts_n, verts_c, bcoords, eye, mat, lights, Ia, Img);
        else
            fprintf('Unable to recognize shader\n');
            return
        end
    end

end