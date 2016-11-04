function E=fftdeletenoise(noise)
k3=fft2(double(noise));
g3=fftshift(k3);
[Q1,Q2]=size(g3);
n=2;
d0=25;
u0=round(Q1/2);
v0=round(Q2/2);
for i=1:Q1
    for j=1:Q2
        d=sqrt((i-u0)^2+(j-v0)^2);
        h=1/(1+0.414*(d/d0)^(2*n));
        y3(i,j)=h*g3(i,j);
    end
end
y3=ifftshift(y3);
E=ifft2(y3);
E=uint8(real(E));