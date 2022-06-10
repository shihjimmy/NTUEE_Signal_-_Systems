Ts=0.002;
f1=100;
M=1000;
n=1:M;
x=cos(2*pi*(n-1)*Ts)+2*cos(2*pi*f1*(n-1)*Ts);
subplot(3,1,1),plot(n,x);

z=cos(2*pi*(n-1)*Ts);
fc=0.326;
[b,a]=butter(16,fc,'low');
y=filter(b,a,x);
subplot(3,1,2),plot(n,y);
error=0;
for i=1:1000
    error=error+(y(i)-z(i))^2;
end
disp(error);

z=2*cos(2*pi*f1*(n-1)*Ts);
fc=[0.153,0.851];
[b,a]=butter(8,fc,'bandpass');
y=filter(b,a,x);
subplot(3,1,3),plot(n,y);
error=0;
for i=1:1000
    error=error+(y(i)-z(i))^2;
end
disp(error);