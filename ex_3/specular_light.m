function I = specular_light(P, N, color, cam_pos, mat, lights)

    % Unary vector N
    N_hat = N/norm(N);
    
    % Coors of source
    S = lights.pos';
    
    % L vector
    L = S - P;
    L_hat = L/norm(L);
    
    % V vector
    V = cam_pos - P;
    V_hat = V/norm(V);
    
    % The cos of the angle a between N and L vectors
    cosa = dot(N_hat, L_hat);
    
    % Unary R vector
    R_hat = 2*N_hat*cosa - L_hat;
    
    % The cos of b-a where b is the angle between N and V vector
    cosba = dot(R_hat,V_hat);
    
    % Extract info from the classes
    Ip = lights.intensity';
    ks = mat.ks;
    nPhong = mat.nPhong;
    
    I = Ip*ks*cosba^nPhong;

end