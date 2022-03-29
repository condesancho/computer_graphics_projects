function value = vector_interp(p1, p2, a, V1, V2, dim)
    % In the case the 2 points are the same
    if p1 == p2        
        value = V1;
        return
    end
    % When dim == 1 interpolate according to value of x
    if dim == 1
        if p2(1) == p1(1)
            V = [V1; V2];
            value = mean(V);
            return
        end
        lambda = (p2(1)-a(1))/(p2(1)-p1(1));        
    elseif dim == 2
        if p2(2) == p1(2)
            V = [V1; V2];
            value = mean(V);
            return
        end
        lambda = (p2(2)-a(2))/(p2(2)-p1(2));
    end
    
    value = lambda*V1 + (1-lambda)*V2;

end