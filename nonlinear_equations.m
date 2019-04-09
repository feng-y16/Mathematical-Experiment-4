function [error,t,exitflag,output]=nonlinear_equations(n,lambda)
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

function [dy]=nonlinear_function_d(x)
    dy=A+h.^2.*lambda.*diag(exp(x));
end

tic
[u1,fval,exitflag,output]=fsolve(@nonlinear_function,zeros(n^2,1));
t(1)=toc;
error(1)=norm(fval,inf);
tic
[u2]=newton_equations(@nonlinear_function,@nonlinear_function_d,zeros(n^2,1),10000,error(1));
t(2)=toc;
error(2)=norm(nonlinear_function(u2),inf);
error(3)=norm(u1-u2,inf);

% u1=reshape(u1,n,n); 
% u1=[zeros(1,n+2);zeros(n,1),u1,zeros(n,1);zeros(1,n+2)];
% [X,Y]=meshgrid(c, c);  
% mesh(X,Y,u1,'LineWidth',3);
% set(gca,'FontSize',28)
% xlabel('x')
% ylabel('y')
% zlabel('u')
% title('Nonlinear equations (fsolve)')
% set(gcf,'outerposition',get(0,'screensize'));
% saveas(gcf,['3_' num2str(n) '_' name '_u1.png'])
% close
% 
% u2=reshape(u2,n,n); 
% u2=[zeros(1,n+2);zeros(n,1),u2,zeros(n,1);zeros(1,n+2)];
% mesh(X,Y,u2,'LineWidth',3);
% set(gca,'FontSize',28)
% xlabel('x')
% ylabel('y')
% zlabel('u')
% title('Nonlinear equations (newton method)')
% set(gcf,'outerposition',get(0,'screensize'));
% saveas(gcf,['3_' num2str(n) '_' name '_u2.png'])
% close

subplot(1,2,1);
u1=reshape(u1,n,n); 
u1=[zeros(1,n+2);zeros(n,1),u1,zeros(n,1);zeros(1,n+2)];
[X,Y]=meshgrid(c, c);  
mesh(X,Y,u1,'LineWidth',3);
set(gca,'FontSize',28)
xlabel('x')
ylabel('y')
zlabel('u')
title('Nonlinear equations (fsolve)')
subplot(1,2,2);
u2=reshape(u2,n,n); 
u2=[zeros(1,n+2);zeros(n,1),u2,zeros(n,1);zeros(1,n+2)];
mesh(X,Y,u2,'LineWidth',3);
set(gca,'FontSize',28)
xlabel('x')
ylabel('y')
zlabel('u')
title('Nonlinear equations (newton method)')
set(gcf,'unit','centimeters','position',[10 5 40 15]);
saveas(gcf,['3_' num2str(n) '_' name '.png'])
close
end
