function [r,t] = interest_rate_compare(A,T,F,x0,tol)
t=zeros(3,1);
r=zeros(3,1);
f=@(r)(1-(1+r)^(-T))/r-A/F;
tic
r(1)=fzero(f,x0);
t(1)=toc;
df=@(r)(-(1-(1+r)^(-T))/r^2+T*(1+r)^(-T-1)/r);
tic
r(2)=newton(f,df,x0,1000000,tol);
t(2)=toc;
tic
r(3)=bisection(f,1e-7,1,1000000,3e-16);
t(3)=toc;
end

