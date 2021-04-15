clear all;close all;

%%
%This is initialization of images given from the HW pdf
d1=112;d2=92;
d=d1*d2;
num_images=9;
num_people=40;
matX=zeros(d,num_people*num_images);
count=1;
for i=1:num_people
    for j=1:num_images
        filename=sprintf('orl_faces/Train/s%i/%i.pgm',i,j);
        img=double(imread(filename));
        matX(:,count)=reshape(img,d,1);
        count=count+1;
    end
end
V=matX/max(matX(:));

%%
%NMF is performed using the nmf function and computer_objective functions 
%which use equations and algorithms described in the text
[B,W,obj,k]=nmf(V,40,5000,.1);
figure;
sgtitle('Basis functions obtained by NMF');
for k=1:40
    subplot(5,8,k);
    imagesc(reshape(B(:,k),d1,d2));
    colormap gray; axis image off;
end

%%
%NMF is performed using the built in MATLAB nnmf function in the way
%described in the HW pdf
opt=statset('MaxIter',500,'Display','final');
[B,W]=nnmf(V,40,'options',opt,'algorithm','mult');
figure;
sgtitle('Basis functions obtained by MATLAB NMF Function');
for k=1:40
    subplot(5,8,k);
    imagesc(reshape(B(:,k),d1,d2));
    colormap gray;axis image off;
end




