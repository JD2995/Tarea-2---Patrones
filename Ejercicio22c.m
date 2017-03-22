function Ejercicio22c()
    %Lectura, paso a gris y ruido gaussiano a la imagen
    imagen = imread('Lena.png');
    imagen = rgb2gray(imagen);
    imagenRuido = imnoise(imagen,'gaussian',0,0.0025);
    %Obtencion del filtro prewitt
    filtroPrewitt = fspecial('prewitt');
    %Convolucion con filtro prewitt
    imwrite(uint8(Ejercicio21(imagen, filtroPrewitt,0)),'PrewittNormal.png');
    imwrite(uint8(Ejercicio21(imagenRuido, filtroPrewitt,0)),'PrewittRuido.png');
end