a = 1 : 1 : 20 ;
b = 19: -1 : 1 ;
x1 = [a,b,0];
c = ones(1,10);
d = zeros(1,30);
x2 = [c,d];
figure(1);
stem(x1);
figure(2);
stem(x2);
y = conv(x1,x2);
figure(3);
stem(y);
x1 = x1' ;
x2 = x2' ;
A = convmtx(x1,40);
y_2 = A * x2 ;
figure(4);
stem(y_2);

new_x1 = zeros(1,7);
for n = 1:3 
    new_x1(n) = exp(n*log(3));
end
new_x2 = zeros(1,7);
for n = 1:5
    new_x2(n) = exp(n*log(2));
end
figure(5);
stem(new_x1);
figure(6);
stem(new_x2);
new_y = conv(new_x1,new_x2);
figure(7);
stem(new_y);
new_x1 = new_x1' ;
new_x2 = new_x2' ;
A_2 = convmtx(new_x1,7);
new_y_2 = A_2 * new_x2;
figure(8);
stem(new_y_2);
