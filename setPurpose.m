function [purpose, weight] = setPurpose
% different satellites and probes in different missions have different set
% of objectives and different instrumentation aboard. This will help
% estimating the mass.

% Since reconnassaince satellites have a plethora of instruments aboard, it
% increases the weight significantly, communication satellites have a
% limited set of tools to provide communications with other satellites, and
% photography and surveillance satellites have a set of lens and image
% processing equipment and transmission aboard.

    choice = menu('What will be the the purpose of your satellite?', 'Reconnaissance', 'Communication', 'Photography');
    while choice == 0
        fprintf('Error! You need to choose a purpose for your satellite!.\n');
        choice = menu('What will be the the purpose of your satellite?', 'Reconnaissance', 'Communication', 'Photography');
    end
    
    switch choice
        case 1
            multiplier = 3;
            purpose = "Reconnaissance";
        case 2
            multiplier = 1;
            purpose = "Communication";
        case 3
            multiplier = 2;
            purpose = "Photography";
    end
    
weight = 150 * multiplier;

end

