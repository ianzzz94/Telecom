clear;
close;
clc;

%{
Fs = 8000; % sample rate of the microphone
recObj = audiorecorder(Fs,16,1); % create audio object, 16 bits resolution
disp('Start speaking.')
recordblocking(recObj, 5); % do a 2 second recording (blocking)
disp('End of Recording.');
% Play back the recording.
play(recObj);
% Store data in double-precision vector
y = getaudiodata(recObj);
% Plot the samples.
plot(y);
%}

Fs_TX = 22050; % transmitter sample rate
x = zeros(1,Fs_TX); % 1 second of silence
for ii = 1:Fs_TX/10:Fs_TX,
x(ii) = 1; % insert some impulses
end
xObj = audioplayer(x,Fs_TX); % convert one second of sound to audio format
%------------------------- play sound and record the response
 Fs_RX = 8000; % microphone sample rate
recObj = audiorecorder(Fs_RX,16,2); % 16 bits, 1 channel
play(xObj) % play and continue directly
recordblocking(recObj,1); % start recording 1 second
yinit = getaudiodata(recObj); % float representation of recording

tx = [1/Fs_TX:1/Fs_TX: 1];
ty = [1/Fs_RX:1/Fs_RX: 1];
subplot(311);

for i = 1:1:Fs_RX,
z(i) = yinit(i, 1); 
y(i) = yinit(i, 2); 
end

plot(ty, abs(z),'red');
hold on;
plot(ty, abs(y),'blue');

xlabel('t(s)');
subplot(312); 

%{
Fx = fft(x);
Fx = fftshift(Fx);
%}

Ffy = fft(yinit);
Ffy = fftshift(Ffy);

for i = 1:1:Fs_RX,
Fx(i) = Ffy(i, 1); 
Fy(i) = Ffy(i, 2); 
end

F1 = [-Fs_TX/2: 1: Fs_TX/2-1]
F2 = [-Fs_RX/2: 1: Fs_RX/2-1]
plot(F2/1000, abs(Fx),'red');
subplot(313);
plot(F2/1000, abs(Fy),'blue');
xlabel('F(kHz)');
