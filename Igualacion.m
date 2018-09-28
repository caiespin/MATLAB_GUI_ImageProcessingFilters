function Igualacion(J)
[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

[f c]=size(I);
h=zeros(256,4);
II=zeros(f,c);
for k=1:256
   h(k,1)=k;
end
for i=1:f
    for j=1:c
        v=I(i,j);
        h(v+1,2)=h(v+1,2)+1;
end
end
for k=1:256
    h(k,3)=sum(h(1:k,2));
end

for i=1:f
    for j=1:c
        v2=I(i,j)+1;
        II(i,j)=round(((h(v2,3)-(min(h(1:256,3))))/((f*c)-(min(h(1:256,3)))))*255);
        v3=II(i,j);
        h(v3+1,4)=h(v3+1,4)+1;
    end
end

imwrite(II,'Igualacion.jpg','jpg')

figure (1)
subplot (2,2,1)
imshow(I)
title('Imagen original')
subplot(2,2,2)
bar (h(1:256,2))
title('Histograma original')
subplot(2,2,3)
JJ=uint8(II);
imshow(JJ)
title('Imagen Igualada')
subplot(2,2,4)
bar (h(1:256,4))
title('Histograma Igualado')