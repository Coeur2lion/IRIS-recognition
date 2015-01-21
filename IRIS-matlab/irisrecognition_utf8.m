function [out]=irisrecognition()
clc;
chos=0;
possibility=4;
scales = 1;
messaggio='Добро пожаловать! Для продолжения работы войдите в систему или зарегистрируйтесь.';
while chos~=possibility,
    chos=menu('Добро пожаловать! Для продолжения работы войдите в систему или зарегистрируйтесь.','Вход в систему','Регистрация','Выход');
    if chos==1,
        clc;
        noes = inputdlg({'Введите логин' 'Введите пароль'})
        title='Войдите в систему';
            id = noes{1};
            parol = noes{2};
            userdb=[id,'.dat'];
            if (exist(userdb)==0)
               warndlg('Пользователя не существует')
               pause(1);
               allHandle = allchild(0);
               allTag = get(allHandle, 'Tag');
               isWarndlg = strncmp(allTag, 'Msgbox_', 7);
               delete(allHandle(isWarndlg));
               break; 
            end
                load(userdb,'pass_id','pass','-mat');
            
                   
                    if isempty(parol)
                     warndlg('Требуется ввести пароль')
                     pause(1);
                     allHandle = allchild(0);
                     allTag = get(allHandle, 'Tag');
                     isWarndlg = strncmp(allTag, 'Msgbox_', 7);
                     delete(allHandle(isWarndlg));
                     break;
                    elseif (parol~=pass)
                    warndlg('Неправильный пароль')
                    cam=webcam(1);
                    pause(1);
                    imwrite(snapshot(cam),'lol.png');
                    delete(cam);
                    namefile='\lol.png';
                    pathname=cd;
                    [img,map]=imread(strcat(pathname,namefile));
                    warndlg('Пока!')
                    pause(1)
                    allHandle = allchild(0);
                    allTag = get(allHandle, 'Tag');
                    isWarndlg = strncmp(allTag, 'Msgbox_', 7);
                    delete(allHandle(isWarndlg));
                    break;

               else
                    warndlg('Пароль верный!')
                    pause(1)
                    allHandle = allchild(0);
                    allTag = get(allHandle, 'Tag');
                    isWarndlg = strncmp(allTag, 'Msgbox_', 7);
                    delete(allHandle(isWarndlg));
                    chos=1;
               end


        


%--------------------------------------------------------------------
clc;
chos=0;
possibility=7;
scales = 1;


messaggio='Введите ID пользователя. ID - натуральное положительное число. В каждом ID хранится информация о количестве фотографий данного пользователя.';



while chos~=possibility,
    chos=menu('Система Аутентификации по радужке','Сделать фотографию глаза','Выбрать фотографию','Добавить изображение в базу данных','Определение пользователя по радужке','Информация о базе данных','Удалить базу данных','Выйти');
    %----------------
    
    


    if chos==1,
        clc;
        
        cam=webcam(1);
        preview(cam);
        
        pause;
        
        imwrite(rgb2gray(snapshot(cam)), 'your.png');
        
        delete(cam);
        close all;

        namefile='\your.png';
        pathname=cd;
        [img,map]=imread(strcat(pathname,namefile));
        dimensioni = size(img);
        disp('Можно добавить данную фотографию в базу данных конкретного пользователя. Для этого нажмите "Добавить фотографию в базу данных"');
        disp('или пройдите проверку по радужке. Для этого нажмите "Определение пользователя по радужке"');
         delete('your.png');
    end
    %----------------
    if chos==2
        [namefile,pathname]=uigetfile('*','*');
        if namefile~=0
            [img,map]=imread(strcat(pathname,namefile));
            imshow(img);
            dimensioni = size(img);
        else
            warndlg('Вы должны выбрать фотографию.','Внимание!')
        end
        disp('Вы выбрали фотографию. Теперь вы можете ее добавить в базу данных. Для этого нажмите "Выбрать фотографию")');
        disp('или пройдите проверку по радужке. Для этого нажмите "Определение пользователя по радужке"');
    end
    %----------------
    if chos==3,
        clc;     
        if exist('img')
            if (exist('iris_database.dat')==2)
                load('iris_database.dat','-mat');
                face_number=face_number+1;
                data{face_number,1}=double(img);
                %sprintf('%s','hello',' ','ciao') 
                
                
                
%                 title=num2str(max_class);
%                 lines=1;
%                 def={num2str(max_class)};
%                 answer=inputdlg(prompt,title,lines,def);
%                 zparameter=double(str2num(char(answer)));
%                 class_number=zparameter(1);
% 
%                 
%                 %Если введен ID = 0 - выводится ошибка с провсьбой ввести положительное натуральное число в качестве ID
%                 %Если введен один из ID (от 1 до class_number) - требуется ввести пароль
%                     %Если пароль верный - происходит сравнение только с данными, относящимся к конкретному ID (class_number)
%                     %Если пароль введен неправильно - выводится сообщение об ошибке и просьба ввести данные заново
%                 %Если введен (max_class) - можно только зарегистрироваться
%                 %Если введен несуществующий ID, значение которого больше max_class, то предлагается зарегистрироваться под ID (max_class)
%                 if (class_number<=0)||(floor(class_number)~=class_number)||(~isa(class_number,'double'))||(any(any(imag(class_number))))
%                     warndlg(sprintf('%s','ID пользователя должен быть положительным натуральным числом <= ',num2str(max_class)),'Внимание!')
%                     elseIf
%                         %if (class_number в пределах 1 - max_class)
%                         (0<class)&&(class<=max_class)
%                             if (inputed_pass==saved_pass)
%                                 msgbox(sprintf('%s','Все ок, заходи, мистер ',num2str(class_number)),'! Сейчас тебя и твой глаз проверим :D','help');
%                                 else
%                                     msgbox(sprintf('%s','Чувак, либо ты не мистер ',num2str(class_number)),', либо ты ошибся с паролем! Но я разрешаю тебе попробовать еще разок! :D','help');
%                             end
%                 
%                             elseIf (class_number==max_class)
%                             %(ТУТ, КОРОЧЕ, РЕГАЕШЬСЯ! ПОНЯЛ?)
%                             disp('WTF?! :D')
%                     else
%                         if (class_number>max_class)
%                             hoh=msgbox(sprintf('%s','Ты точно не мистер ',num2str(class_number),'! Попробуй войти под одним из ID от 1 до ',num2str(max_class)-1),'help');
%                             set(hoh, 'Position', [800 300 400 75])
%                         end
%                 end




                    class_number=pass_id;
                    disp('Обработка фотографии... Пожалуйста, подождите!');
                        if (pass_id>0)
                            features  = findfeatures(img,scales);
                        end

                        
                 
                        
                        
                        data{face_number,2} = class_number;
                        features_data{features_size+1,1} = features;
                        features_data{features_size+1,2} = class_number;
                        features_data{features_size+1,3} = strcat(pathname,namefile);
                        features_size                    = size(features_data,1);
                        clc;
                        save('iris_database.dat','pass_id','data','face_number','max_class','features_data','features_size');
                        msgbox(sprintf('%s','Изображение успешно добавлено в базу данных ',num2str(class_number)),'Ответ базы данных','help');
                        close all;
                        clear('img');
                        clc;
                        disp('Фотография успешно добавлена в базу данных.');
                        messaggio2 = sprintf('%s','Путь: ',strcat(pathname,namefile));
                        disp(messaggio2);
                        messaggio2 = sprintf('%s','ID пользователя: ',num2str(class_number));
                        disp(messaggio2);
%                         disp(data);
%                         disp(face_number);
%                         disp(max_class);
%                         disp(features_data);
%                         disp(features_size);
                    end
                else
                    warndlg(sprintf('%s','ID пользователя должен быть положительным натуральным числом <= ',num2str(max_class)),' Внимание!')
                end
            end
    %----------------
    if chos==4,
        clc;
        close all;
        if exist('img')

            if (exist('iris_database.dat')==2)
                load('iris_database.dat','-mat');
                disp('Обработка фотографии... Пожалуйста, подождите!');
                % код аутентификации пользователя по радужной оболочке.
                features  = findfeatures(img,scales);
                %                 L = length(features);
                %                 score = zeros(max_class-1,1);
                %                 for ii=1:L
                %                     pesi = zeros(features_size,1);
                %                     for jj=1:features_size
                %                         pesi(jj)=norm(features{ii}-features_data{jj,1});
                %                     end
                %                     [val,pos]=min(pesi);
                %                     trovato = features_data{pos,2};
                %                     score(trovato)=score(trovato)+1;
                %                 end
                %                 [val,pos]=max(score);
                messaggio2 = sprintf('%s','Выбранная фотография: ',strcat(pathname,namefile));
                disp(messaggio2);
                disp('---');
                pesi = zeros(features_size,1);
                for ii=1:features_size
                    messaggio2 = sprintf('%s','Обработанная фотография:',features_data{ii,3},' номер: ',num2str(features_data{ii,2}));
%                     disp(messaggio2);
                    % hd = gethammingdistance(template1, mask1, template2,mask2, scales)
                    template1 = features{1};
                    mask1     = features{2};
                    template2 = features_data{ii,1}{1};
                    mask2     = features_data{ii,1}{2};
                    pesi(ii)  = gethammingdistance(template1, mask1, template2,mask2, scales);
                end
                [val,pos] = min(pesi);
                pos       = features_data{pos,2};
                disp('---');
                if pesi > 0.4
                    disp('Совпедений в базе данных не найдено!');
                else
                    messaggio2 = sprintf('%s','Распознанное изображение радужки: ',features_data{pos,3});
                    disp(messaggio2);
                    disp('Номер схожего изображения');
                    disp(pos);
%                      disp(pesi);
                end
            else
                warndlg('Обработка невозможна. База данных пуста.',' Внимание!')
            end
        else
            warndlg('Требуется выбрать изображение.',' Внимание!')
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         delete('your-normal.jpg');
    end
    %----------------
    if chos==5,
        clc;
        close all;
        clear('img');
        if (exist('iris_database.dat')==2)
            load('iris_database.dat','-mat');
            msgbox(sprintf('%s','В базе данных ',num2str(face_number),' фотографий. Для данного количества (',num2str(pass_id),') ID. Вводимые изображения должны быть одного размера.'),'Результат базы данных','help');
            disp('Изображение радужки успешно добавлено в базу данных:');
            disp('---');
            for ii=1:features_size
                messaggio2 = sprintf('%s','Путь:',features_data{ii,3});%,' ID: ',num2str(features_data{ii,2}));
                disp(messaggio2);
                messaggio2 = sprintf('%s','ID пользователя: ',num2str(features_data{ii,2}));
                disp(messaggio2);
                disp('---');
            end
        else
            msgbox('База данных пуста.','Результат базы данных','help');
        end
    end
    %----------------
    if chos==6,
        clc;
        close all;
        if (exist('iris_database.dat')==2)
            button = questdlg('Вы точно хотите удалить базу данных?');
            if strcmp(button,'Yes')
                delete('iris_database.dat');
                clear('data','face_number','max_class','features_data','features_size');
                msgbox('База данных была успешно удалена.','Database removed','help');
            end
        else
            warndlg('База данных пуста.',' Внимание!')
        end
    end
    if chos==7
        close;       
    end
end


    end
if chos==2,
        load('iris_database.dat','-mat');
%        warndlg(sprintf('%s','Требуется ввести ID пользователя: ',num2str(max_class)))
        clc;
%         warndlg('Ну и регайся!','Успешно')
        Momo={'Введите id','Введите пароль','Повторите пароль'};
        name='Registration';
        numlines=1;
        defaultanswer={'','',''};
        answer=inputdlg(Momo,name,numlines,defaultanswer);
        
        %Momo = inputdlg('Введите пароль','Повторите пароль')
            pass_id = answer{1};
            pass = answer{2};
            pass_rep = answer{3};
                if pass==pass_rep

                    userdb=[pass_id,'.dat'];
                   if (exist(userdb)==0)
                        f = fopen(userdb, 'w'); fclose(f);
                        save(userdb,'pass_id','pass','-mat');
                   end
                    warndlg(sprintf('Поздравляю! Вы зарегистрированы!'))
                    choss=1;
                else
                    warndlg(sprintf('Извините, пароль неверный!'))
                end
        pause(1)
        allHandle = allchild(0);
        allTag = get(allHandle, 'Tag');
        isWarndlg = strncmp(allTag, 'Msgbox_', 7);
        delete(allHandle(isWarndlg));
                
end
%-------------------
if chos==3,
        clc;
        warndlg('Пока!','Успешно')
        pause(1)
        allHandle = allchild(0);
        allTag = get(allHandle, 'Tag');
        isWarndlg = strncmp(allTag, 'Msgbox_', 7);
        delete(allHandle(isWarndlg));
        pause(1)
        break;
    end
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function h = addcircle(h, c, radius, weight)

[hr, hc] = size(h);

if nargin == 3
    weight = 1;
end

% c и radius должны быть представлены в int значениях.
if any(c-fix(c))
    error('Центр окружности должен быть целым числом');
end

if radius-fix(radius)
    error('Радиус должен быть целым числом');
end

x = 0:fix(radius/sqrt(2));
costheta = sqrt(1 - (x.^2 / radius^2));
y = round(radius*costheta);

% Сейчас отмечаются 8 точек, равноудаленных друг от друга по кругу и
% сохраняются их координаты [px py].

px = c(2) + [x  y  y  x -x -y -y -x];
py = c(1) + [y  x -x -y -y -x  x  y];

% Отбираются точки, находящиеся за пределами лимитов.
validx = px>=1 & px<=hr;
validy = py>=1 & py<=hc;
valid = find(validx & validy);

px = px(valid);
py = py(valid);

ind = px+(py-1)*hr;
h(ind) = h(ind) + weight;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function newim = adjgamma(im, g)

if g <= 0
    error('Значение гаммы должно быть > 0');
end

if isa(im,'uint8');
    newim = double(im);
else
    newim = im;
end

% масштабирование диапазона 0-1.
newim = newim-min(min(newim));
newim = newim./max(max(newim));

newim =  newim.^(1/g);   % Применение гамма-функций.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [gradient, or] = canny(im, sigma, scaling, vert, horz)

xscaling = vert;
yscaling = horz;

hsize = [6*sigma+1, 6*sigma+1];   % Размер фильтра.

gaussian = fspecial('gaussian',hsize,sigma);
im = filter2(gaussian,im);        % Сглаживание фотографии.

im = imresize(im, scaling);

[rows, cols] = size(im);

h =  [  im(:,2:cols)  zeros(rows,1) ] - [  zeros(rows,1)  im(:,1:cols-1)  ];
v =  [  im(2:rows,:); zeros(1,cols) ] - [  zeros(1,cols); im(1:rows-1,:)  ];
d1 = [  im(2:rows,2:cols) zeros(rows-1,1); zeros(1,cols) ] - ...
    [ zeros(1,cols); zeros(rows-1,1) im(1:rows-1,1:cols-1)  ];
d2 = [  zeros(1,cols); im(1:rows-1,2:cols) zeros(rows-1,1);  ] - ...
    [ zeros(rows-1,1) im(2:rows,1:cols-1); zeros(1,cols)   ];

X = ( h + (d1 + d2)/2.0 ) * xscaling;
Y = ( v + (d1 - d2)/2.0 ) * yscaling;

gradient = sqrt(X.*X + Y.*Y); % Градиент амплитуды.

or = atan2(-Y, X);            % Углы от -pi до + pi.
neg = or<0;                   % Карта углов 0-pi.
or = or.*~neg + (or+pi).*neg;
or = or*180/pi;               % Перевод в градусы.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [x,y] = circlecoords(c, r, imgsize,nsides)


if nargin == 3
    nsides = 600;
end

nsides = round(nsides);

a = [0:pi/nsides:2*pi];
xd = (double(r)*cos(a)+ double(c(1)) );
yd = (double(r)*sin(a)+ double(c(2)) );

xd = round(xd);
yd = round(yd);

%Освобождаемся от -ves.
%Освобождаемся от значений, больше изображения.
xd2 = xd;
coords = find(xd>imgsize(2));
xd2(coords) = imgsize(2);
coords = find(xd<=0);
xd2(coords) = 1;

yd2 = yd;
coords = find(yd>imgsize(1));
yd2(coords) = imgsize(1);
coords = find(yd<=0);
yd2(coords) = 1;

x = int32(xd2);
y = int32(yd2);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [template, mask] = encode(polar_array,noise_array, nscales, minWaveLength, mult, sigmaOnf)

%Свертка нормадизованной области с фильтром Габора.
[E0 filtersum] = gaborconvolve(polar_array, nscales, minWaveLength, mult, sigmaOnf);

length = size(polar_array,2)*2*nscales;

template = zeros(size(polar_array,1), length);

length2 = size(polar_array,2);
h = 1:size(polar_array,1);

%Создание шаблона радужки.

mask = zeros(size(template));

for k=1:nscales

    E1 = E0{k};

    %Фаза квантования.
    H1 = real(E1) > 0;
    H2 = imag(E1) > 0;

    % Если амплитуда близка к 0, то фазовые данные бесполезны, отметка убирается.
%     in the noise mask
    H3 = abs(E1) < 0.0001;


    for i=0:(length2-1)

        ja = double(2*nscales*(i));
        %Создание биометрического шаблона.
        template(h,ja+(2*k)-1) = H1(h, i+1);
        template(h,ja+(2*k)) = H2(h,i+1);

        %Создание маски шумов.
        mask(h,ja+(2*k)-1) = noise_array(h, i+1) | H3(h, i+1);
        mask(h,ja+(2*k)) =   noise_array(h, i+1) | H3(h, i+1);

    end

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [row, col, r] = findcircle(image,lradius,uradius,scaling, sigma, hithres, lowthres, vert, horz)

lradsc = round(lradius*scaling);
uradsc = round(uradius*scaling);
rd = round(uradius*scaling - lradius*scaling);

% Генерация края изображения.
[I2 or] = canny(image, sigma, scaling, vert, horz);
I3 = adjgamma(I2, 1.9);
I4 = nonmaxsup(I3, or, 1.5);
edgeimage = hysthresh(I4, hithres, lowthres);

% Выполнение кругового преобразования Хафа.
h = houghcircle(edgeimage, lradsc, uradsc);

maxtotal = 0;

%Нахождение максимума в пространстве Хафа и, следовательно, параметры круга.
for i=1:rd

    layer = h(:,:,i);
    [maxlayer] = max(max(layer));


    if maxlayer > maxtotal

        maxtotal = maxlayer;


        r = int32((lradsc+i) / scaling);

        [row,col] = ( find(layer == maxlayer) );


        row = int32(row(1) / scaling); %Возвращает только первое максимальное значение.
        col = int32(col(1) / scaling);

    end

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function lines = findline(image)

[I2 or] = canny(image, 2, 1, 0.00, 1.00);

I3 = adjgamma(I2, 1.9);
I4 = nonmaxsup(I3, or, 1.5);
edgeimage = hysthresh(I4, 0.20, 0.15);


theta = (0:179)';
[R, xp] = radon(edgeimage, theta);

maxv = max(max(R));

if maxv > 25
    i = find(R == max(max(R)));
else
    lines = [];
    return;
end

[foo, ind] = sort(-R(i));
u = size(i,1);
k = i(ind(1:u));
[y,x]=ind2sub(size(R),k);
t = -theta(x)*pi/180;
r = xp(y);

lines = [cos(t) sin(t) -r];

cx = size(image,2)/2-1;
cy = size(image,1)/2-1;
lines(:,3) = lines(:,3) - lines(:,1)*cx - lines(:,2)*cy;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [EO, filtersum] = gaborconvolve(im, nscale, minWaveLength, mult, ...
    sigmaOnf)

[rows cols] = size(im);
filtersum = zeros(1,size(im,2));

EO = cell(1, nscale);          %Предварительное выделение массива ячеек.

ndata = cols;
if mod(ndata,2) == 1             %Отбрасывание последней точки, если их нечетное количество.
    ndata = ndata-1;
end

logGabor  = zeros(1,ndata);
result = zeros(rows,ndata);

radius =  [0:fix(ndata/2)]/fix(ndata/2)/2;  % Частота значений 0 - 0.5.
radius(1) = 1;

wavelength = minWaveLength;        %Назначение длины волны фильтра.


for s = 1:nscale,                  %Для каждого масштаба.

    %Фильтрация - сначала вычисление радиальной составляющей фильтра.
    fo = 1.0/wavelength;
    rfo = fo/0.5;
    %Соответствующее фильтру.
    logGabor(1:ndata/2+1) = exp((-(log(radius/fo)).^2) / (2 * log(sigmaOnf)^2));
    logGabor(1) = 0;

    filter = logGabor;

    filtersum = filtersum+filter;

    %Для каждой строки входного изображения делается свертка обратного преобразования.
    for r = 1:rows  %Для каждой строки

        signal = im(r,1:ndata);


        imagefft = fft( signal );


        result(r,:) = ifft(imagefft .* filter);

    end

    %Сохранение выходных данных для каждого масштаба.
    EO{s} = result;

    wavelength = wavelength * mult;       %Вычисление длины волны следующего фильтра.
end                                     %Обработка следующего масштаба.

filtersum = fftshift(filtersum);

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function h = houghcircle(edgeim, rmin, rmax)
 [rows,cols] = size(edgeim);
 nradii = rmax-rmin+1;
 h = zeros(rows,cols,nradii);
 
 
 [y,x] = find(edgeim~=0);
 
 hr     = rows;
 hc     = cols;
 hrhc   = hr*hc;
 weight = 1;
 
 %Для каждой точки края вырисовываются окружности с разными радиусами radii
 for index=1:size(y)
 
     cx = x(index);
     cy = y(index);
     
     c  = [cx,cy];
 
     for n=1:nradii
 
         
         radius   = n+rmin;
         xd       = 0:fix(radius/sqrt(2));
         costheta = sqrt(1-(xd.^2/radius^2));
         yd       = round(radius*costheta);
         px       = c(2) + [xd  yd  yd  xd -xd -yd -yd -xd];
         py       = c(1) + [yd  xd -xd -yd -yd -xd  xd  yd];
         validx   = px>=1 & px<=hr;
         validy   = py>=1 & py<=hc;
         valid    = find(validx & validy);
         px       = px(valid);
         py       = py(valid);
         ind      = px+(py-1)*hr;
         
         positions    = ind+(n-1)*hrhc;
         h(positions) = h(positions)+ weight;
         % h(ind+(n-1)*hr*hc) = h(ind+(n-1)*hr*hc)+ weight;
     end
 
 end

function bw = hysthresh(im, T1, T2)

if (T2 > T1 | T2 < 0 | T1 < 0)  %Проверка чувствительности порогов
    error('T1 должен быть >= T2 и они оба должны быть >= 0 ');
end

[rows, cols] = size(im);    %Предварительные вычисления некоторых значений для скорости и удобства.
rc = rows*cols;
rcmr = rc - rows;
rp1 = rows+1;

bw = im(:);                 %Перевести изображение в вектор-столбец.
pix = find(bw > T1);        %Найти индексы всех пикселовсо значением > T1
npix = size(pix,1);         %Количество пикселов со значением > T1

stack = zeros(rows*cols,1); %Создание массива стека, который никогда не переполнится.

stack(1:npix) = pix;        %Поместить все точки краев в массив.
stp = npix;                 %Установить указатель стека.
for k = 1:npix
    bw(pix(k)) = -1;        %Отметить точки, как края.
end


% Предварительные вычисления массива, O, индексы значений смещения, соответствующих 8 пикселам вокруг любой точки.

O = [-1, 1, -rows-1, -rows, -rows+1, rows-1, rows, rows+1];

while stp ~= 0            %Пока стек не полон
    v = stack(stp);         %перейти к следующему значению.
    stp = stp - 1;

    if v > rp1 && v < rcmr   %Защита от создания несанкционированных индексов
        %Посмотрим на окружающие пикселы
        %должны ли они попасть в стек
        %для поледующей обработки.
        index = O+v;        %Вычисление индексов точек аокруг пиксела.
        for l = 1:8
            ind = index(l);
            if bw(ind) > T2   %Если значение > T2,
                stp = stp+1;  %добавить данный индекс в стэк.
                stack(stp) = ind;
                bw(ind) = -1; %Отметить, как точку, расположенную на краю.
            end
        end
    end
end



bw = (bw == -1);            %Обнулить всто, что не является краем
bw = reshape(bw,rows,cols); %и изменить фотографию.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [x,y] = linecoords(lines, imsize)

xd = [1:imsize(2)];
yd = (-lines(3) - lines(1)*xd ) / lines(2);

coords = find(yd>imsize(1));
yd(coords) = imsize(1);
coords = find(yd<1);
yd(coords) = 1;

x = int32(xd);
y = int32(yd);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function im = nonmaxsup(inimage, orient, radius)

if size(inimage) ~= size(orient)
    error('Оригинальная фотогрфия и ориентированная разных размеров');
end

if radius < 1
    error('Радиус должен быть >= 1');
end

[rows,cols] = size(inimage);
im = zeros(rows,cols);        %Выделить память для ускорения вывода изображения
iradius = ceil(radius);

%Предварительные вычисления смещения по x и y для каждого угла ориентации.

angle = [0:180].*pi/180;    %Массив углов с шагом в 1 пиксел (но здесь представлено значение в радианах)
xoff = radius*cos(angle);   %Смещение по x и y точек конкретного радиуса и угла
yoff = radius*sin(angle);   %для каждой рекомендованной позиции.

hfrac = xoff - floor(xoff); %Долевое смещение по x - целочисленное положение
vfrac = yoff - floor(yoff); %Долевое смещение по y - целочисленное положение

orient = fix(orient)+1;     %Ориентации начинаются с 0 градусов,
%но массивы начинаются с индекса 1.

%Теперь пройтись по всей фотографии по интерполированным значениям
%серого в каждой точке вокруг данного пиксела 
%для определения немаксимального подавления.

for row = (iradius+1):(rows - iradius)
    for col = (iradius+1):(cols - iradius)

        or = orient(row,col);   %Указатель на предварительно высчитанный массив

        x = col + xoff(or);     %неизвестные значения x, y для данной точки
        y = row - yoff(or);

        fx = floor(x);          %Получить целые значения пикселов вокруг данной точки x, y
        cx = ceil(x);
        fy = floor(y);
        cy = ceil(y);
        tl = inimage(fy,fx);    %Положение верхнего левого пиксела в целых значениях.
        tr = inimage(fy,cx);    %верхнего правого
        bl = inimage(cy,fx);    %нижнего левого
        br = inimage(cy,cx);    %нижнего правого

        upperavg = tl + hfrac(or) * (tr - tl);  %Проведение билинейной интерполяции
        loweravg = bl + hfrac(or) * (br - bl);  %для получения значений для точки x, y
        v1 = upperavg + vfrac(or) * (loweravg - upperavg);

        if inimage(row, col) > v1 %Проверка значений с противоположной стороны...

            x = col - xoff(or);     %неизвестные значения x, y для данной точки
            y = row + yoff(or);

            fx = floor(x);
            cx = ceil(x);
            fy = floor(y);
            cy = ceil(y);
            tl = inimage(fy,fx);    %Положение верхнего левого пиксела в целых значениях.
            tr = inimage(fy,cx);    %верхнего правого
            bl = inimage(cy,fx);    %нижнего левого
            br = inimage(cy,cx);    %нижнего правого

            upperavg = tl + hfrac(or) * (tr - tl);
            loweravg = bl + hfrac(or) * (br - bl);
            v2 = upperavg + vfrac(or) * (loweravg - upperavg);

            if inimage(row,col) > v2            %Проверка на локальный максимум.
                im(row, col) = inimage(row, col); %Запись значений в выходное изображение.
            end

        end
    end
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [polar_array, polar_noise] = normaliseiris(image, x_iris, y_iris, r_iris,...
    x_pupil, y_pupil, r_pupil, radpixels, angulardiv)

radiuspixels = radpixels + 2;
angledivisions = angulardiv-1;

r = 0:(radiuspixels-1);

theta = 0:2*pi/angledivisions:2*pi;

x_iris = double(x_iris);
y_iris = double(y_iris);
r_iris = double(r_iris);

x_pupil = double(x_pupil);
y_pupil = double(y_pupil);
r_pupil = double(r_pupil);

%Вычисление смещения центра зрачка относительно центра радужной оболочки глаза.
ox = x_pupil - x_iris;
oy = y_pupil - y_iris;

if ox <= 0
    sgn = -1;
elseif ox > 0
    sgn = 1;
end

if ox==0 && oy > 0

    sgn = 1;

end

r = double(r);
theta = double(theta);

a = ones(1,angledivisions+1)* (ox^2 + oy^2);

%ox = 0
if ox == 0
    phi = pi/2;
else
    phi = atan(oy/ox);
end

b = sgn.*cos(pi - phi - theta);

%Вычисление радиуса радужки глаза в зависимости от угла.
r = (sqrt(a).*b) + ( sqrt( a.*(b.^2) - (a - (r_iris^2))));

r = r - r_pupil;

rmat = ones(1,radiuspixels)'*r;

rmat = rmat.* (ones(angledivisions+1,1)*[0:1/(radiuspixels-1):1])';
rmat = rmat + r_pupil;


%Исключение граничных значений зрачок/радужка и радужка/склера
%так как они могут не совпадать в точными границами и внести шум.
%То есть не принимать кольца вне границы, как данные радужной оболочки.
rmat  = rmat(2:(radiuspixels-1), :);

%Вычислить в декартовых координатах расположение всех отметок вокруг круглой радужки
% region
xcosmat = ones(radiuspixels-2,1)*cos(theta);
xsinmat = ones(radiuspixels-2,1)*sin(theta);

xo = rmat.*xcosmat;
yo = rmat.*xsinmat;

xo = x_pupil+xo;
yo = y_pupil-yo;

%Извлечь значения интенсивности для нормализованного полярного изображения интерполяцией.
[x,y] = meshgrid(1:size(image,2),1:size(image,1));
polar_array = interp2(x,y,image,xo,yo);

%Создание массива шумов с размещением NaN в polar_array
polar_noise = zeros(size(polar_array));
coords = find(isnan(polar_array));
polar_noise(coords) = 1;

polar_array = double(polar_array)./255;


%Произведение диагностики, накладывая на изображение глаза кольца.

%Избавление от контура точек, выделяя точки для составления круглого рисунка
coords = find(xo > size(image,2));
xo(coords) = size(image,2);
coords = find(xo < 1);
xo(coords) = 1;

coords = find(yo > size(image,1));
yo(coords) = size(image,1);
coords = find(yo<1);
yo(coords) = 1;

xo = round(xo);
yo = round(yo);

xo = int32(xo);
yo = int32(yo);

ind1 = sub2ind(size(image),double(yo),double(xo));

image = uint8(image);

image(ind1) = 255;
%Нахождение координат окружности вокруг радужки.
[x,y] = circlecoords([x_iris,y_iris],r_iris,size(image));
ind2 = sub2ind(size(image),double(y),double(x));
%Нахождение координат окружности зрачка.
[xp,yp] = circlecoords([x_pupil,y_pupil],r_pupil,size(image));
ind1 = sub2ind(size(image),double(yp),double(xp));

image(ind2) = 255;
image(ind1) = 255;

imwrite(image,'your-normal.jpg','jpg');

%Замена значений NaN перед выполнением кодирования функций
coords = find(isnan(polar_array));
polar_array2 = polar_array;
polar_array2(coords) = 0.5;
avg = sum(sum(polar_array2)) / (size(polar_array,1)*size(polar_array,2));
polar_array(coords) = avg;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [circleiris, circlepupil, imagewithnoise] = segmentiris(eyeimage)

%Определение диапазонов радиусов зрачка и радужки

%CUHK
lpupilradius = 28;
upupilradius = 75;
lirisradius = 80;
uirisradius = 150;

%    %LIONS
%    lpupilradius = 32;
%    upupilradius = 85;
%    lirisradius = 145;
%    uirisradius = 169;


%Определение коэффициента масштабирования для ускорения процесса преобразования Хафа
scaling = 0.4;

reflecthres = 240;

%Нахождение границ радужной оболочки
[row, col, r] = findcircle(eyeimage, lirisradius, uirisradius, scaling, 2, 0.20, 0.19, 1.00, 0.00);

circleiris = [row col r];

rowd = double(row);
cold = double(col);
rd = double(r);

irl = round(rowd-rd);
iru = round(rowd+rd);
icl = round(cold-rd);
icu = round(cold+rd);

imgsize = size(eyeimage);

if irl < 1
    irl = 1;
end

if icl < 1
    icl = 1;
end

if iru > imgsize(1)
    iru = imgsize(1);
end

if icu > imgsize(2)
    icu = imgsize(2);
end

%Нахождение внутренней границы зрачка, используя лишь ранее найденную
%область
% detected iris boundary
imagepupil = eyeimage( irl:iru,icl:icu);

%Нахождение границы зрачка
[rowp, colp, r] = findcircle(imagepupil, lpupilradius, upupilradius ,0.6,2,0.25,0.25,1.00,1.00);

rowp = double(rowp);
colp = double(colp);
r = double(r);

row = double(irl) + rowp;
col = double(icl) + colp;

row = round(row);
col = round(col);

circlepupil = [row col r];

%Настроить массив для записи регионов шумов
%Пикселы шумов будут иметь значения NaN
imagewithnoise = double(eyeimage);

%Нахождение верхнего века
topeyelid = imagepupil(1:(rowp-r),:);
lines = findline(topeyelid);

if size(lines,1) > 0
    [xl yl] = linecoords(lines, size(topeyelid));
    yl = double(yl) + irl-1;
    xl = double(xl) + icl-1;

    yla = max(yl);

    y2 = 1:yla;

    ind3 = sub2ind(size(eyeimage),yl,xl);
    imagewithnoise(ind3) = NaN;

    imagewithnoise(y2, xl) = NaN;
end

%Нахождение нижнего века
bottomeyelid = imagepupil((rowp+r):size(imagepupil,1),:);
lines = findline(bottomeyelid);

if size(lines,1) > 0

    [xl yl] = linecoords(lines, size(bottomeyelid));
    yl = double(yl)+ irl+rowp+r-2;
    xl = double(xl) + icl-1;

    yla = min(yl);

    y2 = yla:size(eyeimage,1);

    ind4 = sub2ind(size(eyeimage),yl,xl);
    imagewithnoise(ind4) = NaN;
    imagewithnoise(y2, xl) = NaN;

end

%Для базы данных CUHK убрать ресницы по порогу
ref = eyeimage < 100;
coords = find(ref==1);
imagewithnoise(coords) = NaN;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function templatenew = shiftbits(template, noshifts,nscales)

templatenew = zeros(size(template));

width = size(template,2);
s = round(2*nscales*abs(noshifts));
p = round(width-s);

if noshifts == 0
    templatenew = template;

    %Если значение noshifts отрицательное, сдвинуть влево.
elseif noshifts < 0

    x=1:p;

    templatenew(:,x) = template(:,s+x);

    x=(p + 1):width;

    templatenew(:,x) = template(:,x-p);

else

    x=(s+1):width;

    templatenew(:,x) = template(:,x-s);

    x=1:s;

    templatenew(:,x) = template(:,p+x);

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [out]=findfeatures(eyeimage,scales)
radial_res  = 20;
angular_res = 240;

%Создается шаблон IRIS кода размеров 9600 бит

%Параметры кодирования функций
nscales=scales;
minWaveLength=18;
mult=1; % не применять для nscales = 1
sigmaOnf=0.5;

[circleiris circlepupil imagewithnoise] = segmentiris(eyeimage);


imagewithnoise2 = uint8(imagewithnoise);
imagewithcircles = uint8(eyeimage);

%Нахождение координат пикселов вокруг радужной оболочки
[x,y] = circlecoords([circleiris(2),circleiris(1)],circleiris(3),size(eyeimage));
ind2 = sub2ind(size(eyeimage),double(y),double(x));

%Нахождение координат пикселов окружности зрачка
[xp,yp] = circlecoords([circlepupil(2),circlepupil(1)],circlepupil(3),size(eyeimage));
ind1 = sub2ind(size(eyeimage),double(yp),double(xp));


imagewithnoise2(ind2) = 255;
imagewithnoise2(ind1) = 255;
%Наложение на изображение кругов
imagewithcircles(ind2) = 255;
imagewithcircles(ind1) = 255;

[polar_array noise_array] = normaliseiris(imagewithnoise, circleiris(2),...
    circleiris(1), circleiris(3), circlepupil(2), circlepupil(1), circlepupil(3), radial_res, angular_res);


[template mask] = encode(polar_array, noise_array, nscales, minWaveLength, mult, sigmaOnf);
out{1} = template;
out{2} = mask;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function hd = gethammingdistance(template1, mask1, template2, mask2, scales)

template1 = logical(template1);
mask1 = logical(mask1);

template2 = logical(template2);
mask2 = logical(mask2);

hd = NaN;

%Сдвиг влево и вправо, используя минимальное расстояние Хэмминга
for shifts=-8:8

    template1s = shiftbits(template1, shifts,scales);
    mask1s = shiftbits(mask1, shifts,scales);


    mask = mask1s | mask2;

    nummaskbits = sum(sum(mask == 1));

    totalbits = (size(template1s,1)*size(template1s,2)) - nummaskbits;

    C = xor(template1s,template2);

    C = C & ~mask;
    bitsdiff = sum(sum(C==1));

    if totalbits == 0

        hd = NaN;

    else

        hd1 = bitsdiff / totalbits;


        if  hd1 < hd || isnan(hd)

            hd = hd1;

        end


    end

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------


