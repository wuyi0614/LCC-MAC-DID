    function f = HC_IDF_oneF(par,x,y,b,t,k)

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

    
    f=A0+x(1,:)*A+y(1)*B+b(1)*C+1/2*kron(x(1,:),x(1,:))*AA+1/2*y(1)*y(1)*BB+1/2*b(1)*b(1)*CC+kron(x(1,:),y(1))*AB+kron(x(1,:),b(1))*AC+y(1)*b(1)*BC+t(1,:)*T+k(1,:)*K;
    %+t(1,:)*T+k(1,:)*K

    n=3192;
    
    for i=2:n
        f = f + A0+x(i,:)*A+y(i)*B+b(i)*C+1/2*kron(x(i,:),x(i,:))*AA+1/2*y(i)*y(i)*BB+1/2*b(i)*b(i)*CC+kron(x(i,:),y(i))*AB+kron(x(i,:),b(i))*AC+y(i)*b(i)*BC+t(i,:)*T+k(i,:)*K;
    %+t(i,:)*T+k(i,:)*K

    end

