function normals = calculate_normals(vertices, face_indices)

    % Initialize normals
    normals = zeros(size(vertices));

    first_points = face_indices(1,:);
    second_points = face_indices(2,:);
    third_points = face_indices(3,:);
    
    % The 3 vertices of the triangles
    A = vertices(:,first_points);
    B = vertices(:,second_points);
    C = vertices(:,third_points);
    
    % 3 by N matrices
    AB = B - A;
    BC = C - B;
    
    % Find N vector of every triangle
    ABxBC = cross(AB, BC);
    norm_ABxBC = vecnorm(ABxBC);
    
    % The normal vectors of the triangles
    N = ABxBC./norm_ABxBC;
    
    % Find for every vertex the triangles belongs
    for i = 1:size(vertices,2)
        
        [~,triangles] = find(face_indices == i);
        % Add the normal vectors of the triangles
        normals(:,i) = sum(N(:,triangles),2);        
        
    end

    % Normalize the sums
    norm_of_normals = vecnorm(normals);
    normals = normals./norm_of_normals;

end