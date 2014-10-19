
%The script takes a long time to run. It can take several hours to run on
%some machines!

alpha           = 0.5;
gamma           = 6 * pi;
T               = @(theta, nu) [mod(theta + nu, 2*pi), alpha * nu + gamma*cos(theta + nu)];
% First calculation of the expected return time
initial         = [2, 2];
N               = 100000;
orbit           = zeros(N,2);
orbit(1,:)      = initial;
for i=[2:N]
    orbit(i,:)  = T(orbit(i-1,1), orbit(i-1,2));
end
high_count      = nnz(orbit(:,2) > 10.8 * pi);

exp_return_t_1  = N / (high_count+1);

%Second calculation of the expected return time
N_b             = 1000;
N               = 100000;
initials        = zeros(N_b, 2);
k               = 1;
for i = linspace(-10,10, 100)
    for j               = linspace(0.5,1.5,10)
        initials(k,:)    = [j*pi,i*pi];
        k               = k + 1;
    end
end

%Need a parallel for loop for this to run.
%This *must* be run in a modern version of Matlab otherwise parfor must be changed.
return_times    = zeros(N_b,1);
parfor i = 1:N_b
    orbit               = zeros(N,2);
    orbit(1,:)          = initials(i,:);
    for j = 2:N
        orbit(j,:)      = T(orbit(j-1,1), orbit(j-1,2));
    end
    mx                  = max(orbit(:,2));
    highs               = find(orbit(:,2) > 10.8*pi);
    if (length(highs) >= 2)
        ret_time        = highs(2) - highs(1);
        return_times(i) = ret_time;
    end
end

%Only calculate average over sequences where there was a return time.
return_times    = return_times(find(return_times));
exp_return_t_2  = mean(return_times);
