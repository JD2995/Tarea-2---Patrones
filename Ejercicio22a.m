function Ejercicio22a()
    %Lectura, paso a gris y ruido gaussiano a la imagen
    imagen = imread('Lena.png');
    imagen = rgb2gray(imagen);
    imagenRuido = imnoise(imagen,'gaussian',0,0.0025);
    %Creacion de filtros ideales 3x3, 5x5 y 7x7
    filtroIdeal3 = ones(3);
    filtroIdeal3 = filtroIdeal3./(sum(filtroIdeal3(:)));
    filtroIdeal5 = ones(5);
    filtroIdeal5 = filtroIdeal5./(sum(filtroIdeal5(:)));
    filtroIdeal7 = ones(7);
    filtroIdeal7 = filtroIdeal7./(sum(filtroIdeal7(:)));
    %Convolucion con filtros ideales
    imwrite(uint8(Ejercicio21(imagen, filtroIdeal3,0)),'IdealNormal3.png');
    imwrite(uint8(Ejercicio21(imagen, filtroIdeal5,0)),'IdealNormal5.png');
    imwrite(uint8(Ejercicio21(imagen, filtroIdeal7,0)),'IdealNormal7.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroIdeal3,0)),'IdealRuido3.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroIdeal5,0)),'IdealRuido5.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroIdeal7,0)),'IdealRuido7.png');
    %Filtros gaussiano
    filtroGauss3 = fspecial('gaussian',3,2/4);
    filtroGauss5 = fspecial('gaussian',5,4/4);
    filtroGauss7 = fspecial('gaussian',7,6/4);
    %Convolucion con filtros gaussianos
    imwrite(uint8(Ejercicio21(imagen, filtroGauss3,0)),'GaussNormal3.png');
    imwrite(uint8(Ejercicio21(imagen, filtroGauss5,0)),'GaussNormal5.png');
    imwrite(uint8(Ejercicio21(imagen, filtroGauss7,0)),'GaussNormal7.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroGauss3,0)),'GaussRuido3.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroGauss5,0)),'GaussRuido5.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroGauss7,0)),'GaussRuido7.png');
end