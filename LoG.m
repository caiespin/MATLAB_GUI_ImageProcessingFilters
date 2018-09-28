function LoG(J)

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

hg=[0 1 2 1 0;1 3 5 3 1;2 5 9 5 2;1 3 5 3 1;0 1 2 1 0];
hg=hg*(1/75);

h1=[0 1 0;1 -4 1;0 1 0]; 


%JJ= conv2(double(I),double(h1));
%K=uint8(JJ);
g1=imfilter(I,hg); 
g2=imfilter(g1,h1); 

imwrite(g2,'LoG.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(g2)
title('Imagen Filtro LoG')