function [totalDeltaV, hohmannTime] = computeTransfer(destination, parking)
    % conver the char input from 'destination' into a workable index for
    % indexing through the table of data
    switch destination
        case 'mercury'
            planet = 1;
        case 'venus'
            planet = 2;
        case 'earth'
            planet = 3;
        case 'mars'
            planet = 4;
        case 'jupiter'
            planet = 5;
        case 'saturn'
            planet = 6;
        case 'uranus'
            planet = 7;
        case 'neptune'
            planet = 8;
    end
    
    % read spreadsheet and turn it into 'data' matrix for later indexing.
    data = xlsread('planetData.xlsx');
    
    % from the data table, index and extract necessary information for the
    % next computations.
    
    global radiusEarth
    orbitRDest = data(planet, 1);
    orbitVDest = data(planet, 3);
    massDest = data(planet, 5);
    radiusDest = data(planet, 6);
    
    orbitREarth = data(3, 1);
    orbitVEarth = data(3, 3); 
    massEarth = data(3, 5);
    radiusEarth = data(3, 6);
    newtonC = 6.67 * 10^-20; % G kg secs and km;
    
    % the average distance of both bodies from the sun, powered to 3/2 and
    % divided by two.
    
    hohmannTime = (((1 + data(planet, 1))/2)^(3/2))/2;
    
    % the following set of calculations is for Earth departure


    eccentricity = (((orbitREarth + data(planet, 1))/2) - orbitREarth)/((1 + data(planet, 1))/2);
    semiminorAxisHohmann = ((1 + data(planet, 1))/2) * (1-eccentricity^2)^(1/2);
    hohmannMomentum = semiminorAxisHohmann * ((1 + data(planet, 1))/2) * 2 * pi / (((1 + data(planet, 1))/2)^(3/2));
    angularVEarth = hohmannMomentum / orbitREarth;
    departureV = (abs(angularVEarth - orbitVEarth)) * 4.7406;
    escapeVperiapsisEarth = 2^(1/2) * (newtonC * massEarth/(radiusEarth + parking))^(1/2);
    HyperbolicVEarth = (departureV^2 + escapeVperiapsisEarth^2)^(1/2);
    EllipseVEarth = (newtonC * massEarth *(2/(parking+radiusEarth) - 2/(parking + parking+ 2* radiusEarth)))^(1/2);
    InsertVperiapsisEarth = HyperbolicVEarth - EllipseVEarth;
    
    % the following set of calculations is for chosen planet arrival
    

    angularVDest = hohmannMomentum / orbitRDest;
    arrivalV = (abs(angularVDest - orbitVDest)) * 4.7406;
    escapeVperiapsisDest = 2^(1/2) * (newtonC * massDest/(radiusDest + parking))^(1/2);
    HyperbolicVDest = (arrivalV^2 + escapeVperiapsisDest^2)^(1/2);
    EllipseVDest = (newtonC * massDest *(2/(parking+radiusDest) - 2/(parking + parking+ 2* radiusDest)))^(1/2);
    InsertVperiapsisDest = HyperbolicVDest - EllipseVDest;
    
    
    totalDeltaV = InsertVperiapsisEarth + InsertVperiapsisDest;
    
    
end

