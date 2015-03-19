clc;
clear;
close;

Fs = 44100;
ref_x = refsignal(32,1,0,2,'92340f0faaaa4321',Fs);
send_x = send_refsignal(3, Fs, 2);
tdomain_ref = [1/(Fs/3):1/(Fs/3): 1];
tdomain_send = [1/Fs:1/Fs: 1];
subplot(211);
plot(tdomain_ref,ref_x,'red');
hold on;
plot(tdomain_send,abs(send_x),'blue');
h = ch3(ref_x, send_x);
subplot(212);
tdomain_h = [1/Fs:1/Fs:1];
plot(tdomain_h,abs(h), 'black');