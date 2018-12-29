P = 40;                                           %perioada

D = 4;                                         %durata semnalelor

N = 50;                                        %numarul de coeficienti  

w0 = 2*pi/P; 

y = 0:0.0002:D;                                        %esantionare semnal original

xtriunghiular = sawtooth((pi/20)*y,0.5)/2+0.5;                %semnalul triunghiular

ymodif = 0:0.0002:P;                                          %esantionarea semnalului modificat

xmodif = zeros(1,length(ymodif));                              %initializam  semnalul modificat cu valori nule

xmodif(y<=D) = xtriunghiular;                              %modificam valorile nule cu valori din semnalul original unde avem valori t<=D

                                                           

subplot(2,1,1)

plot(ymodif,xmodif),title('x(t)(linie solida) si semnalul reconstruit(linie punctata)');                     %afisarea lui x(t)

hold on





for n = -N:N                                           %n este variabila dupa care se realizeaza suma

    z = xtriunghiular;                                  %z e semnalul realizat dupa formula SF data

    z = z .* exp(-1i*n*w0*y);                           %se inmultesc doua matrice element cu element

    X(n+N+1) = 0;                                        %se initializeaza cu valoare nula

    for j = 1:length(y)-1

        X(n+N+1) = X(n+N+1) + (y(j+1)-y(j)) * (z(j)+z(j+1))/2;                   %reconstructia folosind coeficientii

    end

end



for j = 1:length(ymodif)                                      %j este variabila dupa care se realizeaza suma

    x_fin(j) = 0;                                                  %initializare cu valoare nula

    for n=-N:N

        x_fin(j) = x_fin(j) + (1/P) * X(n+51) * exp(1i*n*w0*ymodif(j));                %reconstructia folosind coeficientii

    end

end

plot(ymodif,x_fin,'--')                                    %se afiseaza reconstructia semnalului folosind cei 50 de coeficienti



subplot(2,1,2)                                          %se imparte ecranul

w=-50*w0:w0:50*w0;                                         %w=vector; el permite afisarea spectrului functiei

stem(w/(2*pi),abs(X)),title('Spectrul lui x(t)');                     %afisarea spectrului



%Teoria seriilor Fourier (SFT, SFA si SFC) ne spune

%ca orice semnal periodic poate fi aproximat printr-o suma infinita de cosinusuri

%si sinusuri de diferite frecvente, fiecare avant cu un anumit coeficient 

%ce reprezinta spectrul semnalului.

%Semnalul reconstruit  si are aceeasi forma ca cel original doar ca 

% exista mici diferente si foloseste 50 de termeni.              
%Daca marim numarul de coeficienti ai SF atunci diferenta va fi din ce in ce mai mica.

% Variatiile semnalului prezinta un caracter sinosoidal, semnalul 

%poate fi aproximat printr-o suma de sin. 




















