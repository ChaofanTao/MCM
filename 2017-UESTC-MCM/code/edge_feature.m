planes_num  = [];

I=imread('C:\uestc.jpg');
I=rgb2gray(I);
imshow(I,[]);
title('Original Image');

sobelBW=edge(I,'sobel');
planes_num(1) = length(find(sobelBW==1));
figure;
imshow(sobelBW);
title('Sobel Edge with %s white points');


robertsBW=edge(I,'roberts');
planes_num(2) = length(find(robertsBW==1));
figure;
imshow(robertsBW);
title('Roberts Edge');

prewittBW=edge(I,'prewitt');
planes_num(3) = length(find(prewittBW==1));
figure;
imshow(prewittBW);
title('Prewitt Edge');

logBW=edge(I,'log');
planes_num(4) = length(find(logBW==1));
figure;
imshow(logBW);
title('Laplasian of Gaussian Edge');  %Õâ¸ö²»´í

cannyBW=edge(I,'canny');
planes_num(5) = length(find(cannyBW==1));
figure;
imshow(cannyBW);
title('Canny Edge');