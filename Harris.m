function Harris(J)

%Im=imread('lines2.jpeg'); 

[f c p]=size(J);

if p==1
Ir=J;
else
Ir=rgb2gray(J); 
end


[m n]=size(Ir);

U=zeros(size(Ir));
S=zeros(size(Ir));

h=ones(3,3)/9;

Id=double(Ir);

If=imfilter(Id,h);

hx=[-0.5 0 0.5]; 
hy=[-0.5;0;0.5]; 

Ix=imfilter(If,hx); 
Iy=imfilter(If,hy); 

HE11=Ix.*Ix;
HE22=Iy.*Iy;
HE12=Ix.*Iy;

hg=[0 1 2 1 0;1 3 5 3 1;2 5 9 5 2;1 3 5 3 1;0 1 2 1 0];
hg=hg*(1/75);

A=imfilter(HE11,hg);
B=imfilter(HE22,hg);
C=imfilter(HE12,hg);

alfa=0.04;

Rp=A+B;
Rp1=Rp.*Rp;

Q=((A.*B)-(C.*C))-(alfa*Rp1);

th=1000;
U=Q>th;

pix=10;

for r=1:m
    for c=1:n
        if(U(r,c))
            I1=[r-pix 1];
            I2=[r+pix m];
            I3=[c-pix 1];
            I4=[c+pix n];
            
            datxi=max(I1);
            datxs=min(I2);
            datyi=max(I3);
            datys=min(I4);
            
            Bloc=Q(datxi:1:datxs,datyi:1:datys);
            MaxB=max(max(Bloc));
            
            if(Q(r,c)==MaxB)
                S(r,c)=1;
            end
        end
    end
end
s=uint8(S);
figure
imshow(Ir)
hold on

for r=1:m
    for c=1:n
        if(S(r,c))
            plot(c,r,'+');
        end
    end
end