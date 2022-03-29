function cq = affine_transform(cp, obj)

    % Make the homogenous vectors
    cp_hom = [cp; ones(1, size(cp,2))];
    
    % Find the new homogenous vectors
    cq_hom = obj.T*cp_hom;
    
    % Remove the last row
    cq = cq_hom(1:3,:);

end