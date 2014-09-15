
E       = load('edgelist.txt');
[q, G]  = PageRank2(E, 0.85);
N       = 100;
n       = size(G,1);
x_0     = ones(n, 1) / n;
errors  = zeros(N, 1);
linsize = 30;
G_t     = G';
v       = x_0;
for i = 1:N
    v   = G_t*v;
    errors(i)       = norm(v - q,1);
end
log_errors          = log(errors);
linear_region       = log_errors(1:linsize);

ls                  = [[1:linsize]',ones(linsize,1)] \ linear_region;


