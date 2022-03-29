function I = diffuse_light(P, N, color, mat, lights)

    % Unary vector N
    N_hat = N/norm(N);
    
    % Coors of source
    S = lights.pos';
    
    % L vector
    L = S - P;
    L_hat = L/norm(L);
    
    % The cos of the angle between N and L vectors
    cosa = dot(N_hat, L_hat);
    
    % Extract info from the classes
    Ip = lights.intensity';
    kd = mat.kd;
    
    I = Ip*kd*cosa;

end