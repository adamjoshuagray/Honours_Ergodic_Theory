

alpha           = 0.5;
gamma           = 6 * pi;
T               = @(theta, nu) [mod(theta + nu, 2*pi), alpha * nu + gamma*cos(theta + nu)];
N               = 200;

N_b             = 10000;

initials        = zeros(N_b, 2);
finals          = zeros(N_b, 2);
for k = [1:N_b]
    initials(k,:) = [2 + 1.9 * cos(k), 2 + 1.9 * sin(k)];
end

highs           = 0;

for k = [1:N_b]
    loc         = initials(k,:);
    for i = [1:N]
        loc     = T(loc(1), loc(2));
        highs   = highs + (loc(2) > 11.1*pi);
    end
    finals(k,:) = loc;
end

scatter(finals(:,1), finals(:,2), 'b');

