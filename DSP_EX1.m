clear all;
clc;
figure('name','��λ��������');
n0=-5;
nf=5;
%��λ��������
ns=0;%n0<=ns<=nf
x=zeros(nf-n0+1,1);
x(ns-n0+1)=1;
xn=n0:nf;
stem(xn,x);
axis([n0 nf 0 1.1]);
%��λ��Ծ�ź�
figure('name','��λ��Ծ�ź�');
x_J=[zeros(1,ns-n0) ones(1,nf-ns+1)];
xn=n0:nf;
stem(xn,x_J);
axis([n0 nf 0 1.1]);
%ʵָ������
figure('name','ʵָ������');
n=n0:nf;
stem(n,0.75.^n);
axis([n0 nf 0 5]);
%��ָ������
figure('name','��ָ���ź�');
stem(n,exp(-0.2+1i*0.7).*n);
axis([n0 nf 0 5]);
%һ�������ľ�ݲ��ź�Ƶ��Ϊ1Hz�����ֵ����Ϊ1V���ڴ�������ʾ�������ڵ��źŲ��Σ�...
%��������32����������ɢ�źţ�����ʾԭ�źź�����������ɢ�źŲ���
figure('name','��ݲ�����');
f=1;Um=1;nt=2;                    
N=32;T=nt/f;                      
dt=T/N;                           
n=0:N-1;
t=n*dt;
xn=Um*sawtooth(2*f*pi*t);          
subplot(2,1,1);plot(t,xn);ylabel('x(t)');
subplot(2,1,2);stem(t,xn);ylabel('x(n)');
%����弤��Ӧ�ͽ�Ծ��Ӧ
figure('name','�弤��Ӧ�ͽ�Ծ��Ӧ')
a=[1 0.75 0.125 ];
b=[1 -1];N=10;
subplot(2,1,1);impz(b,a,N);%�弤��Ӧ
subplot(2,1,2);stepz(b,a,N);%��Ծ��Ӧ
%(3)��״̬��Ӧ
figure('name','3��״̬��Ӧ');
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
%(4)��״̬��Ӧ
figure('name','4��״̬��Ӧ');
b=[1 -0.9];
a=[1 0];
N=0:10;
x=[ones(1,10) 0];
yzs2=filter(b,a,x);
stem(N,yzs2);