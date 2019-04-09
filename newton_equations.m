function [r,k,x]=newton_equations(f,df,x0,num_iter,tol)
x(1,:)=x0;
k=1;
while(1)
    fvalue=feval(f,x(k,:)');
    if norm(fvalue,inf)<tol
        break;
    end
    x(k+1,:)=(x(k,:)'-feval(df,x(k,:)')\fvalue)';
    if(k>num_iter)
        fprintf("Error: Reached maximum iteration times\n");
        break;
    end
    k=k+1;
end
r=x(k,:)';
end
