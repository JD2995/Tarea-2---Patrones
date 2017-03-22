function Ejercicio22b()
    %Lectura, paso a gris y ruido gaussiano a la imagen
    imagen = imread('Lena.png');
    imagen = rgb2gray(imagen);
    imagenRuido = imnoise(imagen,'gaussian',0,0.0025);
    %Obtencion del filtro sobel
    filtroSobel = fspecial('sobel');
    %Convolucion con filtro sobel
    imwrite(uint8(Ejercicio21(imagen, filtroSobel,0)),'SobelNormal.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroSobel,0)),'SobelRuido.png');
end