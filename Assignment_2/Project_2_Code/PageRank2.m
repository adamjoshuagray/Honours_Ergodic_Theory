function [q,G]  = PageRank2(edges, alpha) 
    % nodes are numbered 1,..., n
    n           =max(max(edges));
    % generate transition matrix
    A           =sparse(edges(:,1),edges(:,2),1);
    % make sure the dimension is right
    A(n,n)      =0;
    
    H           = zeros(n);

    O           = sum(A, 2);
    for(i =1:n)
        for(j=1:n)
            if(A(i,j))
                H(i,j) = 1 / O(i);
            end
        end
    end
    A           = zeros(n);
    for (i=1:n)
        if (O(i) == 0)
            A(i,:) = ones(1,n)/n;
        end
    end
    Ones        = ones(n)/n;
    G           = alpha *(H + A) + (1-alpha)*Ones;
    G_t         = G';
    [v,e]       = eig(G_t);
    q           = v(:,1); 
    q           = q / sum(q);
end


