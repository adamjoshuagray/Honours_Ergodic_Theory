
alpha           = 0.5;
gamma           = 6 * pi;
T               = @(theta, nu) [mod(theta + nu, 2*pi), alpha * nu + gamma*cos(theta + nu)];
N_b             = 1000;
N               = 10000;
initials        = zeros(N_b, 2);
finals          = zeros(N_b, 2);
for k = [1:N_b]
    initials(k,:) = [0.5 + 0.02 * cos(k), 0.5 + 0.02 * sin(k)];
end

for k = [1:N_b]
    loc = initials(k,:);
    for i = [1:N]
        loc = T(loc(1), loc(2));
    end
    finals(k,:) = loc;
end

setenv("GNUTERM","X11")
scatter(finals(:,1), finals(:,2))

pause

N_b             = 100;

initials        = zeros(N_b, 2);
finals          = zeros(N_b, 2);
for k = [1:N_b]
    initials(k,:) = [0.5 + 0.02 * cos(k), 0.5 + 0.02 * sin(k)];
end

for k = [1:N_b]
    loc = initials(k,:);
    for i = [1:N]
        loc = T(loc(1), loc(2));
    end
    finals(k,:) = loc;
end


initials_2      = zeros(N_b, 2);
finals_2        = zeros(N_b, 2);
for k = [1:N_b]
    initials_2(k,:) = [1 + 0.02 * cos(k), 1 + 0.02 * sin(k)];
end

for k = [1:N_b]
    loc = initials_2(k,:);
    for i = [1:N]
        loc = T(loc(1), loc(2));
    end
    finals_2(k,:) = loc;
end

scatter(finals(:,1), finals(:,2), 'b')
hold on;
scatter(finals_2(:,1), finals_2(:,2), 'r');


