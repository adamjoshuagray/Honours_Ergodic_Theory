
E       = load('edgelist.txt');
[q, B]  = PageRank(E, 0.85);
N       = 100;
n       = size(B,1);
x_0     = ones(n, 1) / n;
errors  = zeros(N, 1);
linsize = 65;
B_t     = B';
v       = x_0;
for i = 1:N
    v   = B_t*v;
    errors(i)       = norm(v - q,1);
end
log_errors          = log(errors);
linear_region       = log_errors(1:linsize);

ls                  = [[1:linsize]',ones(65,1)] \ linear_region;


