function Derivativo(J)

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end


h1=[-0.5 0 0.5]; 
h2=[-0.5;0;0.5]; 


%JJ= conv2(double(I),double(h1));
%K=uint8(JJ);
g1=imfilter(I,h1); 
g2=imfilter(I,h2); 
g3=g1+g2;

imwrite(g3,'Derivativo.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(g3)
title('Imagen Filtro Primera Derivada')