function q = Signalcalc(name,SB1,SB2,SB3,SB4,SB5,SB6,PADY,PADX)


filename = name;
kspace = loadfid(filename);

kspacePad = padarray(kspace,[PADY PADX],0);
kspace_real = real(kspacePad);
image1 = fftshift(ifft2(fftshift(kspacePad)));
image1abs = abs(image1);
image1phase = atan2(imag(image1),real(image1))*180/pi;

figure;
imagesc(image1abs)
watermark_image('3172')
ti = append('Image Magnitude of ', name);
title(ti)
xlabel('Phase encode step')
ylabel('Frequency encode step')
colormap(gray)
colorbar
brighten(0.5)

rectangle('position',SB1,'EdgeColor','r')
Signal1 = mean2(image1abs(SB1(2):SB1(2)+SB1(4),SB1(1):SB1(1)+SB1(3)));

rectangle('position',SB2,'EdgeColor','r')
Signal2 = mean2(image1abs(SB2(2):SB2(2)+SB2(4),SB2(1):SB2(1)+SB2(3)));

rectangle('position',SB3,'EdgeColor','r')
Signal3 = mean2(image1abs(SB3(2):SB3(2)+SB3(4),SB3(1):SB3(1)+SB3(3)));

rectangle('position',SB4,'EdgeColor','r')
Signal4 = mean2(image1abs(SB4(2):SB4(2)+SB4(4),SB4(1):SB4(1)+SB4(3)));

rectangle('position',SB5,'EdgeColor','r')
Signal5 = mean2(image1abs(SB5(2):SB5(2)+SB5(4),SB5(1):SB5(1)+SB5(3)));

rectangle('position',SB6,'EdgeColor','r')
Signal6 = mean2(image1abs(SB6(2):SB6(2)+SB6(4),SB6(1):SB6(1)+SB6(3)));

q = [Signal1,Signal2,Signal3,Signal4,Signal5,Signal6];


end

    