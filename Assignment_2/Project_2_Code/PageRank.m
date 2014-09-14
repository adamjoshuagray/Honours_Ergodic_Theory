function [q,B]  = PageRank(edges, p) 
    % nodes are numbered 1,..., n
    n           =max(max(edges));
    % generate transition matrix
    A           =sparse(edges(:,1),edges(:,2),1);
    % make sure the dimension is right
    A(n,n)      =0;

    save "adj.mat", A;
    B           = zeros(n+1);
    B(n+1,1:n)  = ones(1,n) / n;
    
    O           = sum(A, 2);
    B(1:n,n+1)  = (O > 0)*(1-p);
    B(1:n,n+1)  += (O == 0); 
    for(i =1:n)
        for(j=1:n)
            if(A(i,j))
                B(i,j) = p / O(i);
            end
        end
    end

    [v,e]       = eig(B');
    q           = v(:,1);
    % Normalize the vector
    q           = q / sum(q);
end


