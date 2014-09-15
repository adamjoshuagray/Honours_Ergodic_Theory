

alpha           = 0.5;
gamma           = 6 * pi;
T               = @(theta, nu) [mod(theta + nu, 2*pi), alpha * nu + gamma*cos(theta + nu)];
% First calculation of the expected return time
initial         = [0.5, 0.5];
N               = 1000000;
orbit           = zeros(N,2);
orbit(1,:)      = initial;
%for i=[2:N]
%    orbit(i,:)  = T(orbit(i-1,1), orbit(i-1,2));
%end
mx              = max(orbit(:,2));
high_count      = nnz(orbit(:,2) > 0.99 * mx);

%exp_return_t_1  = N / high_count;

%Second calculation of the expected return time
N_b             = 1000;
N               = 10000;
initials        = zeros(N_b, 2);
k               = 1;
for i = linspace(-10,10, 100);
    for j               = linspace(0.5,1.5,10)
        intials(k,:)    = [j,i];
        k++;
    end
end
%Need a parallel for loop for this to run.
%This *must* be run in a modern version of octave otherwise parfor must be changed.
return_times    = zeros(N_b,1);
parfor i = 1:N_b
    orbit               = zeros(N,2);
    orbit(1,:)          = initials(i,:);
    for j = 2:N
        orbit(j,:)      = T(orbit(j-1,1), orbit(j-1,2));
    end
    mx                  = max(orbit(:,2));
    highs               = find(nnz(orbit(:,2) > 0.99 * mx));
    if (length(highs) >= 2)
        ret_time        = highs(2) - highs(1);
        return_times(i) = ret_time;
    end
endparfor

%Only calculate average over sequences where there was a return time.
return_times    = return_time(find(return_time));
exp_return_t_2  = avg(return_times);


