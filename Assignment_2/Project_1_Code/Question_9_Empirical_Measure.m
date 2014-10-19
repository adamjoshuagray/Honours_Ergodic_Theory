

alpha           = 0.5;
gamma           = 6 * pi;
T               = @(theta, nu) [mod(theta + nu, 2*pi), alpha * nu + gamma*cos(theta + nu)];
initial         = [0.5, 0.5];
N               = 100000000;
orbit           = zeros(N,2);
orbit(1,:)      = initial;
for i=[2:N]
    orbit(i,:)  = T(orbit(i-1,1), orbit(i-1,2));
end
h3              = hist3(orbit, [1000,1000]);
surf(h3);
