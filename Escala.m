function Escala(J)
%J=imread('pugño.jpg');

[x y z]=size(J);

if z==1
I=J;
else
I=rgb2gray(J); 
end

h1 =fspecial('gaussian',5,0.8);

I0=imfilter(I,h1);

i1=imfilter(I0,h1);
i2=imfilter(i1,h1);
I1=downsample(downsample(i2',2)',2);


i3=imfilter(I1,h1);
i4=imfilter(i3,h1);
I2=downsample(downsample(i4',2)',2);


i5=imfilter(I2,h1);
i6=imfilter(i5,h1);
I3=downsample(downsample(i6',2)',2);


figure
subplot(2,2,1), imshow(I)
subplot(2,2,2), imshow(I1)
subplot(2,2,3), imshow(I2)
subplot(2,2,4), imshow(I3)











