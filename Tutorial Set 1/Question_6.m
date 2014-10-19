

alpha       = 1 / pi;
T           = @(x) mod(x + alpha,1);
N           = 60;
v           = zeros(1,N);
v(1)        = 0.5;
for i=1:N
    v(i+1)  = T(v(i));
end

plot(v);
pause();
scatter( v(1:N-1), v(2:N));
pause();
subinterval = [alpha - 1/1000,alpha + 1/100];
NN          = 10^5;
v           = zeros(1, NN);
v(1)        = 0.5;
for i=1:NN
    v(i+1)  = T(v(i));
end
cnt         = nnz((v > subinterval(1)) & (v < subinterval(2)));
scatter(v(1:NN),[1:NN]);
%also see that space average is
pause();
initials    = 0:0.01:1;
finals      = zeros(1,length(initials));
for i=1:length(initials)
    x       = initials(i);
    for j=1:100
        x   = T(x);
    end
    finals(i)=x;
end
scatter(1:length(finals), finals);

