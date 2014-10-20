
%A few inital conditions
n_ics       = 10;
ics         = linspace(0.01,0.99,n_ics);

%Setup the trajectories
N_traj      = 10^6;
traj        = zeros(N_traj, n_ics);
traj(1,:)   = ics;

%Run the trajectories
for i=1:n_ics
    for j=1:(N_traj - 1)
        traj(j+1,i) = T(traj(j,i));
    end
end

%Setup the histograms
n_bins      = 10^3;

%File names to use
filename    = 'qn_2_a_hist_';
fh      = figure;
for i=1:n_ics
    pause;
    hist(traj(:,i),n_bins);
    %saveas(fh, strcat(filename, num2str(i)),'png');
end
