function Canny(J)

%J=imread('EmpireState.jpg'); 
%I=rgb2gray(J);

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

BW=edge(I,'canny',0.2,2);
imwrite(BW,'Canny.jpg','jpg')


figure
subplot (1,2,1)
imshow(I)
title('Imagen original')
subplot(1,2,2)
imshow(BW)
title('Imagen Canny')