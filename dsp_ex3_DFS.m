%%ex3_1
n=5;
N=8;
k=0:N-1;
xn=ones(1,n);%R5(n)
nk=[1:n]'*k;%n*k
Xk=xn*exp(-j*2*pi/N).^nk;%dfs
figure;
subplot(211);stem(k,[xn,zeros(1,N-n)]);
ylabel('x(n)');xlabel('n');
subplot(212);stem(k,abs(Xk));
ylabel('X(k)');xlabel('k');
%%ex3_2
%x=[1,1,1,1,1,1,1,1];
M=27;N=128;n=0:M;  
%产生M长三角波序列x(n)  
xa=0:1:floor(M/2);  
xb= ceil(M/2)-1:-1:0; 
x=[xa,xb];
figure;
subplot(311);stem(n,x);
ylabel('x(n)');xlabel('x');
if N>=M
    Xn=[x,zeros(1,N-M-1)];
else
    Xn=x(1,1:N);
end
temp=0:N-1;
nk=temp'*temp;
Xk=Xn*exp(-j*2*pi/N).^nk;
subplot(312);stem(0:N-1,abs(Xk));
ylabel('|Xk|');xlabel('k');
nk=temp'*temp;
x1=Xk(1:N)*exp(j*2*pi/N).^nk;
x1=x1/N;
subplot(313);stem(0:N-1,x1);
ylabel('X~(n)');xlabel('n');
%%
% 内嵌matlab_function版本
% M=27;N=16;n=0:M;  
% 产生M长三角波序列x(n)  
% xa=0:1:floor(M/2);  
% xb= ceil(M/2)-1:-1:0; 
% x=[xa,xb];
% figure;
% subplot(311);
% stem(n,x);
% ylabel('x(n)');
% xlabel('x');
% Xk=fft(x,N);
% subplot(312);
% stem(0:N-1,abs(Xk));
% ylabel('|Xk|');
% xlabel('k');
% x1=ifft(Xk,N);
% subplot(313);
% stem(0:N-1,x1);
% ylabel('X~(n)');
% xlabel('n');
%%EX3_3
xn=[2 3 1 4 5];
hn=[2 1 7 4 5 7 2 3];
L=length(xn)+length(hn)-1;%L>=n1+n2-1
Xk=fft(xn,L);Hk=fft(hn,L);Yk=Xk.*Hk;yn=ifft(Yk,L);
figure;
subplot(311);stem(0:length(xn)-1,xn);
ylabel('x(n)');xlabel('n');
subplot(312);stem(0:length(hn)-1,hn);
ylabel('h(n)');xlabel('n');
subplot(313);stem(0:L-1,yn);
ylabel('y(n)');xlabel('n');