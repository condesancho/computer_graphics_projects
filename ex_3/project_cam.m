function [P, D] = project_cam(w, cv, cx, cy, cz, p)
    
    % Rotation matrix for the new coor system
    R = [cx cy cz];
    
    obj = transformation_matrix;
    
    % Insert translation
    translate(obj, cv);
    
    % Insert rotation array
    obj.T(1:3,1:3) = R;
    
    % Find coors of p depending on the coor system of the camera
    p_cam = system_transform(p, obj);
    
    % Depth is the z-coordinates
    D = p_cam(3,:);
    
    % Find projection of x and y
    P(1,:) = w./p_cam(3,:).*p_cam(1,:);
    P(2,:) = w./p_cam(3,:).*p_cam(2,:);


end