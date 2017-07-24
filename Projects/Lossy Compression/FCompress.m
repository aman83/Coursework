%Decomposition and Compression
%% Clear workspace
clc;
clear;
close all;

%% 1.input Image
fname=uigetfile('*.jpg');%opens ui for select image files
I=imread(fname); %reads selected image
r = I(:,:,1); % Get the RED matrix
g = I(:,:,2); % Get the GREEN matrix
b = I(:,:,3); % Get the BLUE matrix
%I=rgb2gray(I);
r=imresize(r,[128 128]);%resize image into 256*256
g=imresize(g,[128 128]);%resize image into 256*256
b=imresize(b,[128 128]);%resize image into 256*256
I=imresize(I,[128 128]);%resize image into 256*256

figure,imshow(I);title('Original Image');drawnow;
tic;%record time

%% 2.Quadtree Decomposition
s1=qtdecomp(r,0.2,[2 64]);%divides image using quadtree decomposition of
                         %threshold .2 and min dim =2 ,max dim =64
[i1,j1,blksz1] = find(s1); %record x and y coordinates and blocksize
blkcount1=length(i1);  %no of total blocks
avg1=zeros(blkcount1,1);%record mean values
for k=1:blkcount1 
    avg1(k)=mean2(I(i1(k):i1(k)+blksz1(k)-1,j1(k):j1(k)+blksz1(k)-1));%find mean 
                                                               %value
end 
avg1=uint8(avg1);
figure,
imshow((full(s1)));
title('Quadtree Decomposition Red');
drawnow;

s2=qtdecomp(g,0.2,[2 64]);%divides image using quadtree decomposition of
                         %threshold .2 and min dim =2 ,max dim =64
[i2,j2,blksz2] = find(s2); %record x and y coordinates and blocksize
blkcount2=length(i2);  %no of total blocks
avg2=zeros(blkcount2,1);%record mean values
for k=1:blkcount2 
    avg2(k)=mean2(I(i2(k):i2(k)+blksz2(k)-1,j2(k):j2(k)+blksz2(k)-1));%find mean 
                                                               %value
end 
avg2=uint8(avg2);
figure,
imshow((full(s2)));
title('Quadtree Decomposition Green');
drawnow;
s3=qtdecomp(b,0.2,[2 64]);%divides image using quadtree decomposition of
                         %threshold .2 and min dim =2 ,max dim =64
[i3,j3,blksz3] = find(s3); %record x and y coordinates and blocksize
blkcount3=length(i3);  %no of total blocks
avg3=zeros(blkcount3,1);%record mean values
for k=1:blkcount3 
    avg3(k)=mean2(I(i3(k):i3(k)+blksz3(k)-1,j3(k):j3(k)+blksz3(k)-1));%find mean 
                                                               %value
end 
avg3=uint8(avg3);
figure,
imshow((full(s3)));
title('Quadtree Decomposition Blue');
drawnow;

%% 3.Huffman Encoding
%Lossless  data compression of RGB

i1(end+1)=0;j1(end+1)=0;blksz1(end+1)=0;%set boundary elements
data1=[i1;j1;blksz1;avg1];%record total information
data1=single(data1); %convert to single
symbols1= unique(data1);% Distinct symbols that data source can produce
fprintf('Encoding RED ...\n');
counts = hist(data1(:), symbols1);%find counts of symblos in given data
p1 = counts./ sum(counts);% Probability distribution
sp1=round(p1*1000);% scaled probabilities
dict1 = huffmandict(symbols1,p1); % Create dictionary.
compressedcode1 = huffmanenco(data1,dict1); % Encode the data.


i2(end+1)=0;j2(end+1)=0;blksz2(end+1)=0;%set boundary elements
data2=[i2;j2;blksz2;avg2];%record total information
data2=single(data2); %convert to single
symbols2= unique(data2);% Distinct symbols that data source can produce
fprintf('Encoding GREEN ...\n');
counts = hist(data2(:), symbols2);%find counts of symblos in given data
p2 = counts./ sum(counts);% Probability distribution
sp2=round(p2*1000);% scaled probabilities
dict2 = huffmandict(symbols2,p2); % Create dictionary.
compressedcode2 = huffmanenco(data2,dict2); % Encode the data.



i3(end+1)=0;j3(end+1)=0;blksz3(end+1)=0;%set boundary elements
data3=[i3;j3;blksz3;avg3];%record total information
data3=single(data3); %convert to single
symbols3= unique(data3);% Distinct symbols that data source can produce
fprintf('Encoding BLUE ...\n');
counts = hist(data3(:), symbols3);%find counts of symblos in given data
p3 = counts./ sum(counts);% Probability distribution
sp3=round(p3*1000);% scaled probabilities
dict3 = huffmandict(symbols3,p3); % Create dictionary.
compressedcode3 = huffmanenco(data3,dict3); % Encode the data.

%% 4.Compressed
%Time taken for compression
t=toc;
fprintf('Time taken for compression = %f seconds\n',t);
%compression ratio
bits_in_original=8*256*256*3;
bits_in_final=length(compressedcode3)+8*length(symbols3)+8*length(sp3)+length(compressedcode1)+8*length(symbols1)+8*length(sp1)+length(compressedcode2)+8*length(symbols2)+8*length(sp2);
fprintf('Initial bits = %d bits\n',bits_in_original);
fprintf('Final bits = %d bits\n',bits_in_final);
%Compression Ratio = total number of bits in original file, divided by 
%number of bits in final file
CR= bits_in_original/bits_in_final;
fprintf('compression ratio= %f\n',CR);