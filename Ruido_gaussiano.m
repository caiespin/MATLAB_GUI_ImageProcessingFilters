function Ruido_gaussiano(J)
[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

fn = imnoise(I,'gaussian',0,0.001);
imwrite(fn,'gaussiannoise.jpg','jpg')
figure (1)
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(fn)
title('Imagen Ruido Gaussiano')