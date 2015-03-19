clear;
clc;
close;

N = 10
n= [0:1:N-1];
x_1 = [1, -1/2, zeros(1,8)];
x_2 = [1, -2, zeros(1,8)];
x_3 = cos(0.2*n);
x_4 = sign(randn(N,1));

h = [1, 2, 3, 2, 1]

y_1 = conv(x_1, h);
y_2 = conv(x_2, h);
y_3 = conv(x_3, h);
y_4 = conv(x_4, h);
