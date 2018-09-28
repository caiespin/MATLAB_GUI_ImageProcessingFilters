function Laplaciano(J)

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end


h1=[0 1 0;1 -4 1;0 1 0]; 


%JJ= conv2(double(I),double(h1));
%K=uint8(JJ);
g1=imfilter(I,h1); 

imwrite(g1,'Laplaciano.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(g1)
title('Imagen Filtro Laplaciano')