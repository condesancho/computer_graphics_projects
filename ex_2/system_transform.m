function dp = system_transform(cp, obj)

    % Extract rotation array and translation
    R = obj.T(1:3,1:3);
    c0 = obj.T(1:3,4);
    
    % New object with the new rotation and translation
    invobj = transformation_matrix;
    
    % Rotation matrix is SO(3) so transposed can be used instead of
    % inversion
    invobj.T(1:3,1:3) = R';
    
    invobj.T(1:3,4) = -R'*c0;
    
    dp = affine_transform(cp, invobj);

end