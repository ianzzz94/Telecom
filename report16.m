clear;
close;
clc;

Fs = 33000;
send_x = send_refsignal(3, Fs, 2);

for i = 1:1:length(send_x),
x(i) = send_x(i, 1); 
y(i) = send_x(i, 2); 
end

h = ch3(x, y);
t = [1/length(x):1/length(x): 1];
subplot(211);
plot(t, x, 'blue', t, y, 'green' );
subplot(212);
plot(h);

%%Note to self: zoom in op eerste samples

c = 340.29 %% speed of sound
d = c/Fs
