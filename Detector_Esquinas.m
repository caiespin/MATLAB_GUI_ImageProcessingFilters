function Detector_Esquinas(J)

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

h1=[-1 0 1;-1 0 1;-1 0 1]; 
h2=[1 1 1;0 0 0;-1 -1 -1]; 

%JJ= conv2(double(I),double(h1));
%K=uint8(JJ);
g1=imfilter(I,h1); 
g2=imfilter(I,h2); 
g3=g1+g2;

imwrite(g3,'Detector_Esquinas.jpg','jpg')

figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(g3)
title('Imagen Detector de Bordes')