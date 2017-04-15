function NoLocalMeans()
    img = imread('Lena.png');
    imgGS = rgb2gray(img);
    imgGS = double(imgGS);
    windowSize = 17;
    [i,j] = size(imgGS);
    imgPadding = padding(windowSize, imgGS, i, j);
    imgFNLM = filtroNLM(windowSize, imgPadding, 2.5, i, j);
    imagesc(uint8(imgFNLM));
    colormap('Gray');
end

function padding = padding(N, img, i, j)
    paddingI = double(zeros(i,((N-1)/2)+1)); 
    imgPaddingI = [paddingI,img,paddingI];
    paddingJ = double(zeros(((N-1)/2)+1, j+(N+1)));
    padding = [paddingJ;imgPaddingI;paddingJ];
end

function NLMImg = filtroNLM(N, img, sigmaR, imgSizeI, imgSizeJ)
    NLMImg = double(zeros(imgSizeI, imgSizeJ));
    minI = (N-1)/2 + 2;
    maxI = imgSizeI+minI-2;
    minJ = (N-1)/2 + 2;
    maxJ = imgSizeJ+minJ-2;
    gaussianKernel = fspecial('gaussian', 3, sigmaR);
    for i = minI:maxI
        for j = minJ:maxJ
            ventana = img(i-(minI-1):i+(minI-1), j-(minJ-1):j+(minJ-1));
            vecindario1 = img(i-1:i+1, j-1:j+1);
            NLMPixel = pixelFiltering(vecindario1,ventana,sigmaR,gaussianKernel);
            NLMImg(i-(minI-1), j-(minJ-1)) = NLMPixel;
        end
    end
end


function NLMpixel = pixelFiltering(vecindario1,windowI,sigmaR,gaussianKernel)
    [maxi, maxj] = size(windowI);
    mini = 2;
    minj = 2;
    maxi = maxi - 1;
    maxj = maxj - 1;
    resultado = zeros(maxi-1, maxj-1);
    for i = mini:maxi
       for j = minj:maxj
           vecindario2 = windowI(i-1:i+1, j-1:j+1);
           if equalMatrix(vecindario1,vecindario2) == 0
               intensityParcial = intensityWeight(vecindario1, vecindario2,sigmaR,gaussianKernel);
               resultado(i-1, j-1) = intensityParcial * vecindario1(2,2);
           end;
       end
    end
    NLMpixel = max(resultado(:));
end

function isEqual = equalMatrix(mat1, mat2)
    resultado = mat1==mat2;
    equalInd = sum(resultado(:));
    [mat1i, mat1j] = size(mat1);
    mat1Size = mat1i * mat1j;
    isEqual = (mat1Size == equalInd);
end

function intensityDim = intensityWeight(vecindario1, vecindario2, sigmaR,gaussianKernel)
    argument = vecindario2 - vecindario1;
    argument = argument * gaussianKernel;
    pixelDistance = sqrt(sum((argument(:)).^2));
    intensityDim = exp((-1*pixelDistance)/(2*(sigmaR)^2));
end