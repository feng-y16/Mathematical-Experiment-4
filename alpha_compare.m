function [alpha,t] = alpha_compare(f,df,x0,x_low,tol)
t=zeros(3,1);
alpha=zeros(3,1);
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
alpha(4)=secant(f,x_low,x0,1000000,0.01*tol);
t(4)=toc;
end

