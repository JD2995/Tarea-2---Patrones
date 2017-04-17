function Ejercicio11a()
    u = 1:10;
    [U,V] = meshgrid(u);
    n1 = randi([-5,5],1,10);
    n2 = randi([-5,5],1,10);
    y = specialFunction(n1,n2);
    y = uint32(y);
    figure;
    plot3(U,V,y);
    figure;
    plot(n1);
    figure;
    plot(n2);
    xlabel('x');
    ylabel('y');
    zlabel('z');
end

function resultado = specialFunction(n1, n2)
    maxi = length(n1);
    maxj = length(n2);
    mini = 1;
    minj = 1;
    mat = zeros(maxi, maxj);
    for i = mini:maxi
        for j = minj:maxj
            x1 = n1(i)+2;
            y1 = n2(j)-3;
            x2 = n1(i);
            y2 = -n2(j)+2;
            mat(i,j) = pulseFunction(x1, y1)+(2*pulseFunction(x2, y2));
        end
    end
    resultado = mat;
end

function resultado = pulseFunction(x, y)
    if(x ~= 0 || y ~= 0)
        resultado = 0;
    else
        resultado = inf;
    end
end