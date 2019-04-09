function [r,k] = iter_test(A,T,F,x0,tol)
r_temp=x0;
f=@(x) A/F*(1-(1+x)^(-T));
k=1;
r_temp=[r_temp,f(r_temp(k))];
while abs(r_temp(k+1)-r_temp(k))>tol*r_temp(k)
    r_temp=[r_temp,f(r_temp(k))];
    k=k+1;
end
r=r_temp(k+1);
k=k+1;
end

