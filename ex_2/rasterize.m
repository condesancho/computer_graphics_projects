function Prast = rasterize(P, M, N, H, W)

    % Dimensions of the pixel
    delta_y = H/M;
    delta_x = W/N;
    
    % Move middle axis
    P = P + [W/2; H/2];
    
    Prast(1,:) = round(P(1,:)/delta_x);
    Prast(2,:) = round(P(2,:)/delta_y);

end