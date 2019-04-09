function [alpha,t] = atan_compare(const,x0,tol)
t=zeros(4,1);
alpha=zeros(4,1);
f=@(x)tan(x)-const;
df=@(x)1/cos(x)^2;
tic
alpha(1)=fzero(f,x0);
t(1)=toc;
tic
alpha(2)=newton(f,df,x0,1000000,tol);
t(2)=toc;
tic
alpha(3)=bisection(f,0,pi/2,1000000,3e-16);
t(3)=toc;
tic
alpha(4)=secant(f,0,pi/12,1000000,tol);
t(4)=toc;
end

