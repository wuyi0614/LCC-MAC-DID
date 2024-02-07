function [c,ceq]=HC_IDF_oneF_Const2338(par,x,y,b,t,k)

A0=par(1);
A=par(2:4);
B=par(5);
C=par(6);
AA=par(7:15);
AB=par(16:18);
AC=par(19:21);
BB=par(22);
BC=par(23);
CC=par(24);
T=par(25:38);
K=par(39:266);


%restriction for (vi)
%r1=sum(A)-1;

%r21=sum(AA(1:3));
%r22=sum(AA(4:6));
%r23=sum(AA(7:9));

%r3=sum(AB(1:3));

%r4=sum(AC(1:3));


%魏楚
w1=B-C+1;
w2=BB-BC;
w3=BC-CC;
w41=AB(1)-AC(1);
w42=AB(2)-AC(2);
w43=AB(3)-AC(3);


%restriction for (vii)
p1=AA(2)-AA(4);
p2=AA(3)-AA(7);
p3=AA(6)-AA(8);


%restriction for (i)
n=3192;
    c_=ones(n,1);
for i=1:n
    c_(i) = -(A0+x(i,:)*A+y(i)*B+b(i)*C+1/2*kron(x(i,:) , x(i,:))*AA+1/2*y(i)*y(i)*BB+1/2*b(i)*b(i)*CC+kron(x(i,:),y(i))*AB+kron(x(i,:),b(i))*AC+y(i)*b(i)*BC+t(i,:)*T+k(i,:)*K);
end
%+t(i,:)*T+k(i,:)*K


%restriction for (iii)
n=3192;
    dy_=ones(n,1);
for i=1:n
    dy_(i)=B+(y(i)*BB)+(x(i,:)*AB(1:3))+(b(i)*BC);
end

%restriction for (iv)
n=3192;
    db_=ones(n,1);
for i=1:n
    db_(i)=-(C+(b(i)*CC)+(x(i,:)*AC(1:3))+(y(i)*BC));
end


%restriction for (v)
n=3192;
    dx1_=ones(n,1);
for i=1:n
    dx1_(i)=-(A(1)+(x(i,:)*AA(1:3:9))+(y(i)*AB(1))+(b(i)*AC(1)));
end

    dx2_=ones(n,1);
for i=1:n
    dx2_(i)=-(A(2)+(x(i,:)*AA(2:3:9))+(y(i)*AB(2))+(b(i)*AC(2)));
end

    dx3_=ones(n,1);
for i=1:n
    dx3_(i)=-(A(3)+(x(i,:)*AA(3:3:9))+(y(i)*AB(3))+(b(i)*AC(3)));
end


% %null-jointness
% n=3192;
%     nj_=ones(n,1);
% for i=1:n
%     nj_(i)=A0+x(i,:)*A+y(i)*B+1/2*kron(x(i,:),x(i,:))*AA+1/2*y(i)*y(i)*BB+kron(x(i,:),y(i))*AB;
% end
% %+t(i,:)*T+k(i,:)*K


c=[c_(1:3192) dy_(1:3192) db_(1:3192) dx1_(1:3192) dx2_(1:3192) dx3_(1:3192)];
%nj_(1:3192)

ceq=[w1 w2 w3 w41 w42 w43 p1 p2 p3];



