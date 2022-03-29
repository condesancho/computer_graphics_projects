function I = render_object(p, F, C, M, N, H, W, w, cv, clookat, cup)

    % Find projections and depth
    [P, D] = project_cam_ku(w, cv, clookat, cup, p);
    
    % Find pixel values
    P = rasterize(P, M, N, H, W);
    
    % Change P so it can be used below
    P = P';
    
    % Initialize the image
    I = ones(M, N, 3);
        
    % Find the depth of every triangle
    i = 1:size(F,1);
    means = mean(D(F(i,:)),2);
    
    % Store the order that the triangles are filled
    [means, order] = sort(means, 'descend');
        
    for i = 1:size(F,1)
        % Make the arrays to be passed in the functions
        idx = F(order(i),:);
        k = 1:3;
        v = P(idx(k),:);
        c = C(idx(k),:);
        
        I = paint_triangle_gouraud(I,v,c);

    end

end