function [r,k,x]=bisection(f,x0,x1,n,tol)
a=x0;
b=x1;
k=1;
x=[a,b];
while or(k==1,abs(b-a)>tol)
    c=(a+b)/2;  
    if sign(f(c))==sign(f(a))
        a=c;
    else
        b=c;
    end
    x=[x,c];
    if(k>n)
        error('Error: Reached maximum iteration times\n');
    end
    k=k+1;
end
r=c;
k=k-1;
end