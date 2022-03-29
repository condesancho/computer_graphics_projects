function Y = paint_triangle_flat(img, vertices_2d, vertex_colors)

    Y = img;

    % The colour of the triangle in RGB is the mean of the 3 vertices
    colour = mean(vertex_colors);

    % Initialize and find the vertices of the edges in the triangle
    edges = zeros(2, 2, 3);
    edges(:,:,1) = [vertices_2d(1,:); vertices_2d(2,:)];
    edges(:,:,2) = [vertices_2d(1,:); vertices_2d(3,:)];
    edges(:,:,3) = [vertices_2d(2,:); vertices_2d(3,:)];

    % Initialize variables
    ykmin = zeros(1,3);
    ykmax = zeros(1,3);
    
    xkmin = zeros(1,3);
    xkmax = zeros(1,3);
    
    % Stores the inclination of the edges
    m = zeros(1,3);

    for k = 1:3      
        x = edges(:,1,k);
        y = edges(:,2,k);
        
        ykmin(k) = min(y);
        ykmax(k) = max(y);
        
        xkmin(k) = min(x);
        xkmax(k) = max(x);
        
        if x(1) == x(2) 
            m(k) = Inf;
        else
            m(k) = (y(2) - y(1))./(x(2) - x(1));
        end
    end

    ymin = min(ykmin);
    ymax = max(ykmax);
    
    % Find the indices of the edges intersected by the scan line
    indx = find(edges(:,2,:) == ymin)';
    current_edges = ceil(indx./2);
    
    intersections = zeros(1,2);
    
    % Find the intersections depending on the number of points with
    % ykmin == ymin
    if size(current_edges,2) == 2
        x_indx = find(vertices_2d(:,2) == ymin)';
        intersections = [vertices_2d(x_indx,1) vertices_2d(x_indx,1)];
    elseif size(current_edges,2) == 4
        index = 1;
        for i = 1:3
            if edges(1,2,i) == edges(2,2,i)
                intersections = [edges(1,1,i) edges(2,1,i)];
            else
                current_edges(index) = i;
                index = index+1;
            end
        end
    else
        intersections(1) = min(xkmin);
        intersections(2) = max(xkmax);
    end
    
    % Initialize variables
    add_indx = [];
    remove_indx = [];
    
    % Scanlines
    for y = ymin:1:ymax    
        points = sort(round(intersections));
        
        for x = points(1):1:points(2)
            Y(abs(x), y, :) = colour;
        end
        
        % Update new intersections
        % The indices of the intersections correspond to the current_edges
        % This means that intersection(1) corresponds to the intersection
        % of the edge in current_edges(1)
        for i = 1:2
            if m(current_edges(i)) == Inf
                continue
            else
                intersections(i) = intersections(i) + 1/m(current_edges(i));
            end
        end
        
        
        % New edges to be added
        add_indx = find(ykmin == y+1);
        remove_indx = find(ykmax == y+1);
        
        if size(add_indx,2) ~= size(remove_indx,2)
            continue
        end
        
        % Update current edges and replace appropriate intersections
        for i = 1:size(remove_indx,2)
           if current_edges(1) == remove_indx(i)
                current_edges(1) = add_indx(i);
                % Find new intersections according to new edge
                if edges(1,2,add_indx(i)) == y+1
                    intersections(1) = edges(1,1,add_indx(i));
                else
                    intersections(1) = edges(2,1,add_indx(i));
                end
            else
                current_edges(2) = add_indx(i);
                if edges(1,2,add_indx(i)) == y+1
                    intersections(2) = edges(1,1,add_indx(i));
                else
                    intersections(2) = edges(2,1,add_indx(i));
                end

        end
        
    % End when the points of the triangle are filled
    end
    
end