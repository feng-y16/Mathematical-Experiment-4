[r1,t1]=interest_rate_compare(150000,15*12,1000,1e-7,2e-15);
[r21,t21]=interest_rate_compare(500000,15*12,4500,1e-7,2e-15);
[r22,t22]=interest_rate_compare(500000,20,45000,1e-7,2e-15);
distance1a=abs(r1(1)-r1(3));
distance21a=abs(r21(1)-r21(3));
distance22a=abs(r22(1)-r22(3));
fprintf("distance1 (fzero and bisection):%f\n",distance1a);
fprintf("distance21 (fzero and bisection):%f\n",distance21a);
fprintf("distance22 (fzero and bisection):%f\n",distance22a);
distance1b=abs(r1(3)-r1(2));
distance21b=abs(r21(3)-r21(2));
distance22b=abs(r22(3)-r22(2));
fprintf("distance1 (newton and bisection):%f\n",distance1b);
fprintf("distance21 (newton and bisection):%f\n",distance21b);
fprintf("distance22 (newton and bisectiont):%f\n",distance22b);

[r,k]=iter_test(150000,15*12,1000,1e-7,2e-15);
distance1test=abs(r-r1(3));
fprintf("distance1 (iter and bisection):%f\n",distance1test);