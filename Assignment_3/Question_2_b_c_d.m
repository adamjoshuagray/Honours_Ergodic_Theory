

%Lets produce a GOOD histogram from which to run our code

N_traj      = 10^8;
%We just choose one initial condition
ic          = 0.6;

%Setup the trajectory
traj        = zeros(N_traj, 1);
traj(1)     = ic;

%Calculate the trajectory
for i=1:(N_traj-1)
    traj(i+1)   = T(traj(i));
end

%Setup the conditional counts matrix
n_bins      = 10^3;
C           = zeros(n_bins, n_bins);

for i=1:(N_traj-1)
    current_bin     = floor(traj(i) * n_bins) + 1;
    next_bin        = floor(traj(i+1) * n_bins) + 1;
    C(current_bin, next_bin) = C(current_bin, next_bin) + 1;
end

sums        = sum(C,1);
Q           = zeros(size(C));
for i=1:n_bins
    Q(:,i)  = C(:,i) / sums(i);
end


%We verify that Q is a stochaastic matrix
%Both of these should evaluate to 1 (they do)
%That means that each row sum is 1
max(sum(Q))
min(sum(Q))

%We now calculate the eigenvalues and eigenvectors of Q
[V,e]       = eig(Q);

%Return the first few eigenvectors and note that there is only one with
%a value anywhere near 1. (There is one with value 1)
evalues     = diag(e);
evalues(1:10)

%Now lets look the eigenvector corresponding to eigenvalue 1
stat        = V(:,1);
plot(stat)
