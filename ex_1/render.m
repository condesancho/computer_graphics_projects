function Img = render(vertices_2d, faces, vertex_colors, depth, renderer)

    % The size of the image
    M = 1200;
    N = 1200;
    
    % Initialize the Img
    Img = ones(M, N, 3);
    
    % Find the depth of every triangle
    i = 1:size(faces,1);
    means = mean(depth(faces(i,:)),2);
    
    % Store the order that the triangles are filled
    [means, order] = sort(means, 'descend');
    
    
    for i = 1:size(faces)
        % Make the arrays to be passed in the functions
        idx = faces(order(i),:);
        k = 1:3;
        v = vertices_2d(idx(k),:);
        c = vertex_colors(idx(k),:);
        
        % Execute appropriate function according to renderer
        if ~renderer
            Img = paint_triangle_flat(Img,v,c);
        else
            Img = paint_triangle_gouraud(Img,v,c);
        end
    end

end