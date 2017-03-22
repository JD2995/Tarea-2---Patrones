function Ejercicio22d()
    %Lectura, paso a gris y ruido gaussiano a la imagen
    imagen = imread('Lena.png');
    imagen = rgb2gray(imagen);
    imagenRuido = imnoise(imagen,'gaussian',0,0.0025);
    %Obtencion del filtro laplaciono y LoG
    filtroLaplace = fspecial('laplacian');
    filtroLoG = fspecial('log',3);
    %Convolucion con laplaciono y LoG
    imwrite(uint8(Ejercicio21(imagen, filtroLaplace,0)),'LaplacianoNormal.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroLaplace,0)),'LaplacianoRuido.png');
    imwrite(uint8(Ejercicio21(imagen, filtroLoG,0)),'LoGNormal.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroLoG,0)),'LoGRuido.png');
end