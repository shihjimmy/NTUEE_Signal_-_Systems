% section 1
N=1001;
T=100;
N1=500;
n=linspace(-N1,N1,N);
Ts=T/N1;
x=sinc(2*n*Ts);
figure(1);
stem(n,x);
X=fft(x);
X=fftshift(abs(X));
omega=2*pi()*n/1001;
figure(2);
plot(omega,X);

N2=length(x);
z=zeros(1,N2);
arr=0:N2-1;
for t=-(N2-1)/2 : (N2-1)/2
    z(t+(N2-1)/2+1) = dot(x, exp(1j*2*pi() / N2 * t.* arr));
end
z=abs(z);
figure(3);
plot(omega,z);

% section 2
Tw=T/2;
w=zeros(1,1001);
for i=-(Tw/2)/Ts+N1+1:(Tw/2)/Ts+N1+1
    w(1,i)=0.5*(1+cos(2*pi*abs(n(1,i)*Ts)/Tw));  
end
figure(4);
stem(n,w);
y=x.*w;
figure(5);
stem(n,y);
Y=fft(y);
Y=fftshift(abs(Y));
figure(6);
plot(omega,Y);