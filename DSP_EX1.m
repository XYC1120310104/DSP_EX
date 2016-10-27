clear all;
clc;
figure('name','单位脉冲序列');
n0=-5;
nf=5;
%单位脉冲序列
ns=0;%n0<=ns<=nf
x=zeros(nf-n0+1,1);
x(ns-n0+1)=1;
xn=n0:nf;
stem(xn,x);
axis([n0 nf 0 1.1]);
%单位阶跃信号
figure('name','单位阶跃信号');
x_J=[zeros(1,ns-n0) ones(1,nf-ns+1)];
xn=n0:nf;
stem(xn,x_J);
axis([n0 nf 0 1.1]);
%实指数序列
figure('name','实指数序列');
n=n0:nf;
stem(n,0.75.^n);
axis([n0 nf 0 5]);
%复指数序列
figure('name','复指数信号');
stem(n,exp(-0.2+1i*0.7).*n);
axis([n0 nf 0 5]);
%一个连续的锯齿波信号频率为1Hz，振幅值幅度为1V，在窗口上显示两个周期的信号波形，...
%对它进行32点采样获得离散信号，试显示原信号和其采样获得离散信号波形
figure('name','锯齿波采样');
f=1;Um=1;nt=2;                    
N=32;T=nt/f;                      
dt=T/N;                           
n=0:N-1;
t=n*dt;
xn=Um*sawtooth(2*f*pi*t);          
subplot(2,1,1);plot(t,xn);ylabel('x(t)');
subplot(2,1,2);stem(t,xn);ylabel('x(n)');
%求其冲激响应和阶跃响应
figure('name','冲激响应和阶跃响应')
a=[1 0.75 0.125 ];
b=[1 -1];N=10;
subplot(2,1,1);impz(b,a,N);%冲激响应
subplot(2,1,2);stepz(b,a,N);%阶跃响应
%(3)零状态响应
figure('name','3零状态响应');
b=[1 -0.8];
a=[0.15 0];
N=0:10;
x=2*sin(0.05*pi*N);
yzs1=filter(b,a,x);
%subplot(211);
stem(N,yzs1);
%subplot(212);
%[h]=impz(b,a,10);
%yconv=conv(h,2*sin(0.05*pi*N));
%stem(0:19,yconv);
%(4)零状态响应
figure('name','4零状态响应');
b=[1 -0.9];
a=[1 0];
N=0:10;
x=[ones(1,10) 0];
yzs2=filter(b,a,x);
stem(N,yzs2);