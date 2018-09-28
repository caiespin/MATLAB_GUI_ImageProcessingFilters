%function Filtro_Gaussiano(J)
J=imread('pugño.jpg'); 
%I=rgb2gray(J);

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

h1=[0 1 2 1 0;1 3 5 3 1;2 5 9 5 2;1 3 5 3 1;0 1 2 1 0];
h1=h1*(1/71);

%JJ= conv2(double(I),double(h1));
%K=uint8(JJ);
g1=imfilter(I,h1); 

imwrite(g1,'Gaussiano.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(g1)
title('Imagen Filtro Gaussiano')