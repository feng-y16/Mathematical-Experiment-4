function [u1,fval,exitflag,output]=test()
lambda=100;
n=30;
name=num2str(lambda);
error=zeros(3,1);
t=zeros(2,1);
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

function [y]=nonlinear_function(x)
    y=A*x+h.^2.*lambda.*exp(x);
end

[u1,fval,exitflag,output]=fsolve(@nonlinear_function,zeros(n^2,1));

end
