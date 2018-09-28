function Filtro_Promedio(J)
%J=imread('pugño.jpg'); 

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end
%fn = imnoise(I,'salt & pepper',0.05);

h1=ones(3)/9; 

%JJ= conv2(double(I),double(h1));
%K=uint8(JJ);
g1=imfilter(I,h1); 

imwrite(g1,'Filtro_Promedio.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(g1)
title('Imagen Filtro Promediador')