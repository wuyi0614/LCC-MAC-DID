
input = readmatrix('xyb_0206_2');
x = input(:,1:3);
y = input(:,4);
b = input(:,5);

% par=ones(24,1)*nan;
% par0=zeros(24,1);

city_num = 228;
year_num = 14;

% par=ones((24+year_num),1)*nan;
% par0=zeros((24+year_num),1);

% 
par=ones((24+city_num+year_num),1)*nan;
par0=zeros((24+city_num+year_num),1);


k = zeros(year_num,city_num);
for i=1:(city_num-1)
    k_one = ones(year_num,1);
    k_zero_front = zeros(year_num,i);
    k_zero_after = zeros(year_num,(city_num-i-1));
    k = [k;[k_zero_front,k_one,k_zero_after]];
end

t = eye(year_num,year_num);
t(1,:) = zeros(1,year_num);
for i=1:(city_num-1)
    t_one = eye(year_num,year_num);
    t_one(1,:) = zeros(1,year_num);
    t = [t;t_one];
end







option=optimset('Display','final','Algorithm', 'interior-point', 'TolX', 1e-8);
%'MaxFunEvals', 300000

gs=GlobalSearch;

problem = createOptimProblem('fmincon', 'x0',par0,'objective',@(par)HC_IDF_oneF(par,x,y,b,t,k),'nonlcon',@(par)HC_IDF_oneF_Const2338(par,x,y,b,t,k), 'options',option);

[par,fval] =  run(gs, problem);

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


n=3192;
    df= ones(n,1);
for i=1:n
    df(i)= A0+x(i,:)*A+y(i)*B+b(i)*C+1/2*kron(x(i,:),x(i,:))*AA+1/2*y(i)*y(i)*BB+1/2*b(i)*b(i)*CC+kron(x(i,:),y(i))*AB+kron(x(i,:),b(i))*AC+y(i)*b(i)*BC+t(i,:)*T+k(i,:)*K;
end
%+t(i,:)*T+k(i,:)*K

    dy= ones(n,1);
for i=1:n
    dy(i)= B+y(i)*BB+x(i,:)*AB(1:3)+b(i)*BC;
end

    db= ones(n,1);
for i=1:n
    db(i)= C+b(i)*CC+x(i,:)*AC(1:3)+y(i)*BC;
end

    P_CO2= ones(n,1);
for i=1:n
    P_CO2(i)=-db(i)/dy(i);
end

MAC= [P_CO2];

R= [df MAC];