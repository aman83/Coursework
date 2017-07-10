%% 1.Huffman Decoding
tic;%record time
datanew1 = huffmandeco(compressedcode1,dict1);% decode the data.
zeroindx=find(data1==0);%find boundries
inew1=datanew1(1:zeroindx(1)-1); %seperate row index
jnew1=datanew1(zeroindx(1)+1:zeroindx(2)-1); %seperate column index
blksznew1=datanew1(zeroindx(2)+1:zeroindx(3)-1);%seperate blocksize
avgnew1=datanew1(zeroindx(3)+1:end); %seperate mean values

fprintf('Decoded RED\n');

datanew2 = huffmandeco(compressedcode2,dict2);% decode the data.
zeroindx=find(data2==0);%find boundries
inew2=datanew2(1:zeroindx(1)-1); %seperate row index
jnew2=datanew2(zeroindx(1)+1:zeroindx(2)-1); %seperate column index
blksznew2=datanew2(zeroindx(2)+1:zeroindx(3)-1);%seperate blocksize
avgnew2=datanew2(zeroindx(3)+1:end); %seperate mean values

fprintf('Decoded GREEN\n');

datanew3 = huffmandeco(compressedcode3,dict3);% decode the data.
zeroindx=find(data3==0);%find boundries
inew3=datanew3(1:zeroindx(1)-1); %seperate row index
jnew3=datanew3(zeroindx(1)+1:zeroindx(2)-1); %seperate column index
blksznew3=datanew3(zeroindx(2)+1:zeroindx(3)-1);%seperate blocksize
avgnew3=datanew3(zeroindx(3)+1:end); %seperate mean values

fprintf('Decoded BLUE\n');
%% 2.Decompressed image
avgnew1=uint8(avgnew1);
for k=1:blkcount1 
  outim1(inew1(k):inew1(k)+blksznew1(k)-1,jnew1(k):jnew1(k)+blksznew1(k)-1)=avgnew1(k);
end

avgnew2=uint8(avgnew2);
for k=1:blkcount2 
  outim2(inew2(k):inew2(k)+blksznew2(k)-1,jnew2(k):jnew2(k)+blksznew2(k)-1)=avgnew2(k);
end

avgnew3=uint8(avgnew3);
for k=1:blkcount3 
  outim3(inew3(k):inew3(k)+blksznew3(k)-1,jnew3(k):jnew3(k)+blksznew3(k)-1)=avgnew3(k);
end

newFigure(:,:,1)=outim1;
newFigure(:,:,2)=outim2;
newFigure(:,:,3)=outim3;
figure,
imshow(newFigure);
title('Decompressed Image');
drawnow;

%% 3. PSNR calculation
%Time taken for De-compression
t=toc;
fprintf('Time taken for Decompression = %f seconds\n',t);
%Create psnr object
hpsnr = vision.PSNR;
psnr1 = step(hpsnr, r,outim1);%calculate psnr
psnr2 = step(hpsnr, g,outim2);
psnr3 = step(hpsnr, b,outim2);
psnr=(psnr1+psnr2+psnr3)/3;

fprintf('PSNR= %f\n',psnr);%display psnr
