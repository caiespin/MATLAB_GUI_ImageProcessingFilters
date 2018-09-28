function Expancion(J,a0,a1)
ami=0;
ama=250;
%a0=150;
%a1=220;
B=(ama-ami)/(a1-a0);
%J=imread('cthulhu.jpg');
%J=imread('fog.jpg');

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

[f c]=size(I);
h=zeros(256,2);
g=zeros(256,2);
II=zeros(f,c);
for k=1:256
   h(k,1)=k;
   g(k,1)=k;
end
for i=1:f
    for j=1:c
        v=I(i,j);
        h(v+1,2)=h(v+1,2)+1;
        II(i,j)=ami+((v-a0)*B);
end
end
for k=1:256
    h(k,3)=sum(h(1:k,2));
end
for i=1:f
    for j=1:c
        v2=II(i,j);
        g(v2+1,2)=h(v2+1,2)+1; 
    end
end

imwrite(II,'Expancion.jpg','jpg')

figure (2)
subplot (2,2,1)
imshow(I)
title('Imagen original')
subplot(2,2,2)
bar (h(1:256,2))
title('Histograma original')
subplot(2,2,3)
JJ=uint8(II);
imshow(JJ)
title('Imagen Expandida')
subplot(2,2,4)
bar (g(1:256,2))
title('Histograma Expandido')