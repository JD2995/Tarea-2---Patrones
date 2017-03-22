function matrizFiltrada = Ejercicio21(U, F, utilizaPadding)
    %Obtencion de alfa, sumatoria de los elementos de F
    %alfa = sum(F(:)');
    F = F.';
    tamanoF = size(F);
    tamanoU = size(U);
    Zc = (tamanoF(1,1) - 1)/2;
    Zf = (tamanoF(1,2) - 1)/2;
    U = agregarPadding(U,tamanoF(1,1),tamanoF(1,2));
    matrizFiltrada = zeros(tamanoU);
    for i=1:tamanoU(1,1)
       for j=1:tamanoU(1,2)
           submatriz = U(i:i+(2*Zc),j:j+(2*Zf));
           submatriz = double(submatriz);   %Convierte la submatriz en double para compatibilidad con F
           matrizFiltrada(i,j) = sum(dot(submatriz,F));
       end
    end
end

function result = agregarPadding(matriz,filF,colF)
    tamanoMatriz = size(matriz);
    Zc = (filF-1)/2;
    Zf = (colF-1)/2;
    result = matriz;
    %Agrega las filas extra en la matriz
    result = [zeros(Zf,tamanoMatriz(1,2));result];
    result = [result;zeros(Zf,tamanoMatriz(1,2))];
    %Agrega las columnas extra en la matriz
    result = [zeros(tamanoMatriz(1,1)+(2*Zf),Zc) result];
    result = [result zeros(tamanoMatriz(1,1)+(2*Zf),Zc)];
    
end