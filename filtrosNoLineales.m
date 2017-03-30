function filtrosNoLineales()
    img = imread('Lena.PNG');
    imgGS = rgb2gray(img);
    imgGS = double(imgGS);
    windowSize = 21;
    [i,j] = size(imgGS);
    imgPadding = padding(windowSize, imgGS, i, j);
    imgFB = filtroBilateral(windowSize, imgPadding, 12, i, j);
    imagesc(uint8(imgFB));
    colormap('Gray');
end

function padding = padding(N, img, i, j)
    paddingI = double(zeros(i,(N-1)/2)); 
    imgPaddingI = [paddingI,img,paddingI];
    paddingJ = double(zeros((N-1)/2, j+(N-1)));
    padding = [paddingJ;imgPaddingI;paddingJ];
end

function bilateralImg = filtroBilateral(N, img, sigmaR, imgSizeI, imgSizeJ)
    bilateralImg = double(zeros(imgSizeI, imgSizeJ));
    sigmaS = (N-1)/4;
    minI = (N-1)/2 + 1;
    maxI = imgSizeI+minI-1;
    minJ = (N-1)/2 + 1;
    maxJ = imgSizeJ+minJ-1;
    space = spaceDimWeight((N-1)/2, sigmaS);
    for i = minI:maxI
        for j = minJ:maxJ
            intensityDimension = img(i-(minI-1):i+(minI-1), j-(minJ-1):j+(minJ-1));
            bilateralPixel = pixelFiltering(img(i,j), intensityDimension, space, sigmaR);
            bilateralImg(i-(minI-1), j-(minJ-1)) = bilateralPixel;
        end
    end
end


function pixelBilateral = pixelFiltering(pixel, windowI, spaceWeight, sigmaR)
    intensity = intensityWeight(pixel, windowI, sigmaR);
    weight = spaceWeight .* intensity;
    pixelBilateral = sum(sum(windowI .* weight));
    pixelBilateral = pixelBilateral / sum(sum(weight));
end

function spaceDim = spaceDimWeight(N, sigmaS)
    [X,Y] = meshgrid(-N:N, -N:N);
    argumento = -(X.^2 + Y.^2);
    spaceDim = exp(argumento/(2*(sigmaS)^2));
end

function intensityDim = intensityWeight(pixelImg, intensityWindow, sigmaR)
    pixelDistance = -(intensityWindow - pixelImg).^2;
    intensityDim = exp(pixelDistance/(2*(sigmaR)^2));
end
