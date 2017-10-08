function [signal] =  band_filter(ch1, ch2, ch3, ch4, ch5, ch6, ch7, signal, fs)

a = 150; %First octave
b_1 = 150; b2 = 500;%Bass range
c1 = 520; c2 = 1000; %lower mid range
d1 = 1050; d2 = 2000; %Mid range
e1 = 2020; e2 = 4000; %upper mid range
f1 = 4050; f2 = 6000; %presence range
g1 = 6020; g2 = 20000; %Treble
Wn = fs/2;
[b1,a1]=butter(4, a/Wn,'low');
[b2,a2]=butter(4,[b_1/Wn b2/Wn],'bandpass');
[b3,a3]=butter(4,[c1/Wn c2/Wn],'bandpass');
[b4,a4]=butter(10,[d1/Wn d2/Wn],'bandpass');
[b5,a5]=butter(10,[e1/Wn e2/Wn],'bandpass');
[b6,a6]=butter(10,[f1/Wn f2/Wn],'bandpass');
[b7,a7]=butter(10,[g1/Wn g2/Wn],'bandpass');



b1 = b1*exp(ch1/20);
b2 = b2*exp(ch2/20);
b3 = b3*exp(ch3/20);
b4 = b4*exp(ch4/20);
b5 = b5*exp(ch5/20);
b6 = b6*exp(ch6/20);
b7 = b7*exp(ch7/20);

x1 = filter(b1,a1, signal);
x2 = filter(b2,a2, signal);
x3 = filter(b3,a3, signal);
x4 = filter(b4,a4, signal);
x5 = filter(b5,a5, signal);
x6 = filter(b6,a6, signal);
x7= filter(b7,a7, signal);


signal = x1 + x2 + x3 + x4 + x5 + x6 + x7;

Hbp1=dfilt.df1(b1,a1);
Hbp2=dfilt.df1(b2,a2);
Hbp3=dfilt.df1(b3,a3);
Hbp4=dfilt.df1(b4,a4);
Hbp5=dfilt.df1(b5,a5);
Hbp6=dfilt.df1(b6,a6); 
Hbp7=dfilt.df1(b7,a7); 
fvtool(Hbp1, Hbp2, Hbp3, Hbp4, Hbp5, Hbp6, Hbp7);



end

