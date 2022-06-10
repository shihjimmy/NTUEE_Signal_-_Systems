z = [1; 1; -1; -1];
p = [0.3+0.4i; 0.3-0.4i; 0.1+0.1i; 0.1-0.1i];
k = 0.09;

figure(1)
subplot(3, 3, 1)
zplane(z, p);

[sos, g] = zp2sos(z, p, k);
a1 = sos(1, 4:6);
a2 = sos(2, 4:6);
a = conv(a1, a2);
b1 = sos(1, 1:3);
b2 = sos(2, 1:3);
b = conv(b1, b2);
[r, p, k] = residuez(b, a);
n = [0: 20];
h = zeros(1,21);
for i = 1:4
    h = h+r(i)*p(i).^n;
end
h(1) = h(1)+k;
h = h*g;
subplot(3, 3, 2)
stem(n, h);

[H, w] = freqz(b, a);
subplot(3, 3, 3)
plot(w, 20*log10(abs(0.09*H)))
subplot(3, 3, 4)
plot(w, unwrap(angle(H))*180/pi);

[H1, w] = freqz(b1, a1);
[H2, w] = freqz(b2, a2);
subplot(3, 3, 5)
plot(w, 20*log10(abs(0.3*H1)))
subplot(3, 3, 6)
plot(w, 20*log10(abs(0.3*H2)))
subplot(3, 3, 7)
plot(w, 20*log10(abs(0.3*H1).*abs(0.3*H2)))

x = [1 zeros(1,20)];
y = 0.09*filter(b, a, x);
subplot(3, 3, 8)
stem(n, y)