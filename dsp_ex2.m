%% 
Dt=0.00005;t=-0.005:Dt:0.005; %ģ���ź� 
xa=exp(-1000*abs(t)); 
 
Wmax=2*pi*2000;K=500;k=0:1:K;W=k*Wmax/K; %����ʱ�丵��Ҷ�任 
Xa=xa*exp(-j*t'*W)*Dt;Xa=real(Xa); 
W=[-fliplr(W),W(2:501)]; 
Xa=[fliplr(Xa),Xa(2:501)]; 
 
figure;
subplot(2,1,1);plot(t*1000,xa,'.');xlabel('t in msec');ylabel('xa(t)'); 
gtext('ģ���ź�'); 
subplot(2,1,2);plot(W,Xa,'.'); xlabel('Frequence in KHz');ylabel('Xa(jw)?1000');
gtext('����ʱ�丵��Ҷ�任'); 
%% 
Dt=0.00005;t=-0.005:Dt:0.005; %ģ���ź� 
xa=exp(-1000*abs(t));  
 
Ts=0.0002;n=-25:1:25; %��ɢʱ���ź� 
x=exp(-1000*abs(n*Ts)); 
 
K=500;k=0:1:K;w=pi*k/K; %��ɢʱ�丵��Ҷ�任 
X=x*exp(-j*n'*w);X=real(X); 
w=[-fliplr(w),w(2:501)]; 
X=[fliplr(X),X(2:501)]; 
 
figure; subplot(2,1,1);plot(t*1000,xa,'.'); ylabel('xa1(t)'); gtext('��ɢ�ź�');hold on stem(n?Ts?1000,x);hold off 
subplot(2,1,2);plot(w/pi,X,'.');ylabel('X1(jw)'); gtext('��ɢʱ�丵��Ҷ�任'); gtext('Ts=0.2msec') 
%% 
Ts1=0.0002;Fs1=1/Ts1;n1=-25:1:25;nTs1=n1*Ts1;      %��ɢʱ���ź� 
x1=exp(-1000*abs(nTs1)); 
Ts2=0.001;Fs2=1/Ts2;n2=-5:1:5;nTs2=n2*Ts2; 
x2=exp(-1000*abs(nTs2)); 
 
Dt=0.00005;t=-0.005:Dt:0.005;                          %ģ���ź��ع� 
xa1=x1*sinc(Fs1*(ones(length(nTs1),1)*t-nTs1'*ones(1,length(t)))); 
xa2=x2*sinc(Fs2*(ones(length(nTs2),1)*t-nTs2'*ones(1,length(t)))); 
figure; 
subplot(2,1,1);
plot(t*1000,xa1,'.');
ylabel('xa1(t)'); 
title('�� x1(n)�ع�ģ���ź� xa(t)');
hold on; 
stem(n1*Ts1*1000,x1);
hold off; 
subplot(2,1,2);
plot(t*1000,xa2,'.');
ylabel('xa2(t)'); 
title('�� x2(n)�ع�ģ���ź� xa(t)');
hold on; 
stem(n2*Ts2*1000,x2);
hold off ;
 