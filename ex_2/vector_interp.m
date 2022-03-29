function value = vector_interp(p1, p2, a, V1, V2, dim)

    % In the case the 2 points are the same
    if p1 == p2        
        value = V1.*ones(size(a,1),3);
        return
    end
    
    % Recognize if interpolation can be achieved
    if p2(dim) == p1(dim)
         if dim == 1
             value = vector_interp(p1, p2, a, V1, V2, 2);
         else
             value = vector_interp(p1, p2, a, V1, V2, 1);
         end
         return
    end
    
    lambda = (p2(dim)-a(:,dim))/(p2(dim)-p1(dim));
    
    value = lambda.*V1 + (1-lambda).*V2;

end