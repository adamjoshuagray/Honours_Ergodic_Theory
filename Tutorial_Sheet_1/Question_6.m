
# Rotation amount
alpha 			= 1 / pi;

# Iteration count
N			= 100;

# The result vector
v			= [];

# The initial condition
x_0			= 0.5;

f			= @(x) x + alpha - floor( x + alpha );

#First step
v			= x_0;

for i=1:(N-1)
	v		= [v;f(v(i))];
end

v
