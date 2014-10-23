

Q           = zeros(1000,1000);
for i=1:1000
    B       = linspace((i-1)/1000, i/1000,1000);
    C       = T(B);
    for j=1:1000
        Q(i,j) = nnz((C < j/1000) .* (C >= (j-1)/1000)) / 1000;
    end
end



%We verify that Q is a stochaastic matrix
%Both of these should evaluate to 1 (they do)
%That means that each row sum is 1
max(sum(Q'))
min(sum(Q'))

%We now calculate the left eigenvalues and eigenvectors of Q
[V,e]       = eig(Q');

%Return the first few eigenvectors and note that there is only one with
%a value anywhere near 1. (There is one with value 1)
evalues     = diag(e);
evalues(1:10)

%Now lets look the eigenvector corresponding to eigenvalue 1
stat        = V(:,1);
plot(stat)
