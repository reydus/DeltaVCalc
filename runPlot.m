function nothing = runPlot(parking, destination, purpose)

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

% chooses a plot colour for the orbit of the planet depending on the
% planet, some colours repeat themselves, this depends upon the real life
% colour of the planet.
beige = [1 0.8 0.64];
switch planet
    case 1
        spec = 'k';
    case 2
        spec = beige;
    case 4
        spec = 'r';
    case 5
        spec = beige;
    case 6
        spec = beige;
    case 7
        spec = 'b';
    case 8
        spec = 'b';
end


global radiusEarth

hold on

% When plotting circles, some values will give complex numbers that can be
% plotted, this behaviour is normal and MATLAB will warn the user. This
% deactivates those pesky alarms.
warning('off');
% plot outline of planet Earth
plot(linspace(-radiusEarth,radiusEarth, 200), (radiusEarth^2 - (linspace(-radiusEarth,radiusEarth,200)).^2).^(1/2));
% paint the area below it
planetEarth = area(linspace(-radiusEarth,radiusEarth, 200), (radiusEarth^2 - (linspace(-radiusEarth,radiusEarth,200)).^2).^(1/2));
planetEarth.FaceColor = [0 0 1];
% plot parking orbit of satellite.
plot(linspace(-radiusEarth*1.20,radiusEarth*1.20, 200), ((parking + radiusEarth)^2 - (linspace(-radiusEarth*1.20,radiusEarth*1.20,200)).^2).^(1/2), 'Color', spec);
% add a marker to simulate satellite.
plot(0, parking+radiusEarth, 'o--', 'Color', spec);
% choose focus point and few more details for our graph.
title(strcat('Position of ', " ", purpose, " ", 'satellite on Earth orbit'));
xlabel('Distance to barycentre (km)');
ylabel('Distance to barycentre (km)');
axis([-2000 2000 5000 9000]);

hold off

end


