function Ejercicio22e(ganancia)
    %Lectura, paso a gris y ruido gaussiano a la imagen
    imagen = imread('Lena.png');
    imagen = rgb2gray(imagen);
    imagenRuido = imnoise(imagen,'gaussian',0,0.0025);
    %Obtencion del filtro Unsharp Masking
    filtroNormal = int8(imagen) + (ganancia.*obtenerUnsharpMask(imagen));
    filtroRuido = int8(imagenRuido) + (ganancia.*obtenerUnsharpMask(imagenRuido));
    %Convolucion con unsharp masking
    imwrite(uint8(filtroNormal),strcat('UnsharpNormal',int2str(ganancia),'.png'));
    imwrite(uint8(filtroRuido),strcat('UnsharpRuido',int2str(ganancia),'.png'));
end

function B = obtenerUnsharpMask(U)
    filtroLoG = fspecial('log',3);
    E = Ejercicio21(U,filtroLoG,0);
    B = - int8(E);
end