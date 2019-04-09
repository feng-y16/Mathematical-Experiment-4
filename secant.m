function [r,k,x]=secant(f,x0,x1,n,tol)
a=x0; 
b=x1; 
k=1; 
x=[a,b];
while or(k==1,abs(b-a)>tol*abs(b))
    c=a;  
    a=b;
    b=b+(b-c)/(feval(f,c)/feval(f,b)-1);
    x=[x,b];
    k=k+1;
    if(k>n)
        error('Error: Reached maximum iteration times');
    end
end
k=k-1;
r=(a+b)/2;
end