function F = ps(x)
n=30; 
lamda =0.001; 
h=1/(n+1);

F(1) = 4.*x(1)-h.^2.*lamda.*exp(x(1))-x(2)-x(1+n);
F(n) = 4.*x(n)-h.^2.*lamda.*exp(x(n))-x(n-1)-x(n+n);
F(n*n-n+1) = 4.*x(n*n-n+1)-h.^2.*lamda.*exp(x(n*n-n+1))-x(n*n-n+1-n)-x(n*n-n+1+1);
F(n*n) = 4.*x(n*n)-h.^2.*lamda.*exp(x(n*n))-x(n*n-1)-x(n*n-n);
for i = 2:(n*n -1)
    if (i<n)
        F(i) = 4.*x(i) - h.^2.*lamda.*exp(x(i))-x(i+1)-x(i+n)-x(i-1);
    elseif (i == (n*n-n+1)) || (i == n) 
        F(i) = F(i);
    elseif (mod(i-1, n) == 0) 
        F(i) = 4.*x(i) - h.^2.*lamda.*exp(x(i))-x(i+1)-x(i+n)-x(i-n);
    elseif (mod(i, n) ==0)
        F(i) = 4.*x(i) - h.^2.*lamda.*exp(x(i))-x(i-1)-x(i+n)-x(i-n);
    elseif i>(n*n-n+1)
        F(i) = 4.*x(i) - h.^2.*lamda.*exp(x(i))-x(i-1)-x(i-n)-x(i+1);
    else
        F(i) = 4.*x(i) - h.^2.*lamda.*exp(x(i))-x(i-1)-x(i+1)-x(i+n)-x(i-n);
    end
end     
end