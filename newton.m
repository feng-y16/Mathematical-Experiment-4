function [r,k,x]=newton(f,df,x0,n,tol)
x(1)=x0;
b=1;
k=1;
while or(k==1,abs(b)>tol*abs(x(k)))
    x(k+1)=x(k)-feval(f,x(k))/feval(df,x(k));
    b=x(k+1)-x(k);
    if(k>n)
        fprintf("Error: Reached maximum iteration times\n");
        break;
    end
    k=k+1;
end
k=k-1;
r=x(k);
end
