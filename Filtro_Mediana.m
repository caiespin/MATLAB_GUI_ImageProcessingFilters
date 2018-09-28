function Filtro_Mediana(J)
%J=imread('pugño.jpg'); 

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

h1=[1 1 1;1 2 1;1 1 1]; 
h1=h1*(1/10);

%JJ= conv2(double(I),double(h1));
%K=uint8(JJ);
g1=imfilter(I,h1); 

imwrite(g1,'Filtro_Mediana.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(g1)
title('Imagen Filtro Mediana')