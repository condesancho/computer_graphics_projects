function [P,D] = project_cam_ku(w, cv, clookat, cup, p)

    % Find z vector
    CK = clookat - cv;
    cz = CK/norm(CK);
    
    t = cup - dot(cup, cz)*cz;
    
    % Find y vector
    cy = t/norm(t);
    
    % If uncommented the result faces the other way
    cy = -cy;
    
    % Find x vector
    cx = cross(cy, cz);
    
    [P, D] = project_cam(w, cv, cx, cy, cz, p);
    
end