close;
h_1 =  ch2(x_1, y_1);
h_2 =  ch2(x_2, y_2);
h_3 =  ch2(x_3, y_3);
h_4 =  ch2(x_4, y_4);
r_1 = conv(x_1, flipud(x_1))
r_2 = conv(x_2, flipud(x_2))
r_3 = conv(x_3, flipud(x_3))
r_4 = conv(x_4, flipud(x_4))

Nx = length(x_1);
plot(r_1, 'black')
hold on
plot(r_2, 'green')
hold on
plot(r_3, 'blue')
hold on
plot(r_4, 'red')

close; 
r_12 = conv(x_2, flipud(x_1));
h_12 = conv(r_12, h_1);
h_12 = h_12(100:104);
plot(h_1, 'black');
hold on
plot(h_12, 'blue'); 


close; 
N=100;
x_5 = sign(randn(N,1));
y_5 = conv(x_5, h);
h_5 = ch2(x_5, y_5);

r_55 = conv(x_5, flipud(x_5));
h_55 = conv(r_55, h_5)
x_6 = sign(randn(N,1));
r_56 = conv(x_5, flipud(x_6));
h_56 = conv(r_56, h_5)
plot(h_55, 'green');
hold on 
plot(h_56, 'blue'); 
