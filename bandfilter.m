function [signal] =  band_filter(ch1, ch2, ch3, ch4, ch5, ch6, ch7, signal, fs)

a = 100;
b_1 = 100; b2 = 500;
c1 = 500; c2 = 1000;
d1 = 1000; d2 = 1500;
e1 = 1500; e2 = 2500;
f1 = 2500; f2 = 3500;
g1 = 2500; g2 = 4500;
Wn = fs/2;
[b1,a1]=butter(6, a/Wn,'low');
[b2,a2]=butter(6,[b_1/Wn b2/Wn],'bandpass');
[b3,a3]=butter(6,[c1/Wn c2/Wn],'bandpass');
[b4,a4]=butter(6,[d1/Wn d2/Wn],'bandpass');
[b5,a5]=butter(6,[e1/Wn e2/Wn],'bandpass');
[b6,a6]=butter(6,[f1/Wn f2/Wn],'bandpass');
[b7,a7]=butter(6,[g1/Wn g2/Wn],'bandpass');



b1 = b1*ch1;
b2 = b2*ch2;
b3 = b3*ch3;
b4 = b4*ch4;
b5 = b5*ch5;
b6 = b6*ch6;
b7 = b7*ch7;

x1 = filter(b1,a1, signal);
x2 = filter(b2,a2, signal);
x3 = filter(b3,a3, signal);
x4 = filter(b4,a4, signal);
x5 = filter(b5,a5, signal);
x6 = filter(b6,a6, signal);
x7= filter(b7,a7, signal);


signal = x1 + x2 + x3 + x4 + x5 + x6 + x7;



end