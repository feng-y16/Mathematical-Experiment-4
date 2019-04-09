n=30;
m=n*n;  
c=linspace(0,1,n+2); 
h=1/(n+1);
A=-4*eye(m)+diag(ones(m-1,1),1)+diag(ones(m-1,1),-1)+diag(ones(m-n,1),n)+diag(ones(m-n,1),-n);
for k=2:n-1
    A((k-1)*n+1,(k-1)*n)=0; 
    A(k*n,k*n+1)=0;
end
A(n*(n-1)+1,n*(n-1))=0;
A(n,n+1)=0;
error(1)=norm(fval,inf);
tic
[u2]=newton_equations(@nonlinear_function,@nonlinear_function_d,zeros(n^2,1),10000,error(1));
t(2)=toc;

function [y]=nonlinear_function(x)
n=30;
m=n*n; 
h=1/(n+1);
lambda=100;
A=-4*eye(m)+diag(ones(m-1,1),1)+diag(ones(m-1,1),-1)+diag(ones(m-n,1),n)+diag(ones(m-n,1),-n);
for k=2:n-1
    A((k-1)*n+1,(k-1)*n)=0; 
    A(k*n,k*n+1)=0;
end
A(n*(n-1)+1,n*(n-1))=0;
A(n,n+1)=0;
    y=A*x+h.^2.*lambda.*exp(x);
end

function [dy]=nonlinear_function_d(x)
n=30;
m=n*n; 
h=1/(n+1);
lambda=100;
A=-4*eye(m)+diag(ones(m-1,1),1)+diag(ones(m-1,1),-1)+diag(ones(m-n,1),n)+diag(ones(m-n,1),-n);
for k=2:n-1
    A((k-1)*n+1,(k-1)*n)=0; 
    A(k*n,k*n+1)=0;
end
A(n*(n-1)+1,n*(n-1))=0;
A(n,n+1)=0;
    dy=A+h.^2.*lambda.*diag(exp(x));
end
