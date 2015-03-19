function h=ch3(x,y);

Ny = length(y); Nx = length(x); L = Ny - Nx + 1;
Y = fft(y);
X = fft([x; zeros(Ny - Nx,1)]); % zero padding to length Ny
H = Y ./ X; % frequency domain deconvolution
h = ifft(H);
%-- truncate h to length L
%-- make the sequence real if necessary
