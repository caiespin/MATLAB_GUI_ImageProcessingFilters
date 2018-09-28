function Ruido_saltpepper(J)

%J=imread('pugño.jpg'); 
I=rgb2gray(J);
fn = imnoise(I,'salt & pepper',0.08);
imwrite(fn,'saltpeppernoise.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(fn)
title('Imagen Ruido sal y pimienta')