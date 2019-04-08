function altitude = getParkOrbit
% Asuming a circular orbit, apoapsis = periapsis
% This must be a value of km above the Earth's surface, Low Orbit 160 - 2000 km 


in = input('What''s the height of the parking orbit?\n');

    % verifies that the input is between 160 and 2000
    while in < 160 || in > 2000
        if in < 160
            fprintf('Too low! Try and choose a height between 160 and 2000 km\n');
        elseif in > 2000
            fprintf('Too high! Try and choose a height between 160 and 2000 km\n');
        end
        in = input('What''s the height of the parking orbit?\n');
    end
altitude = in;
end

