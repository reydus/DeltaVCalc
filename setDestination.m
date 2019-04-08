function [destination] = setDestination
    % Asks the user for their destination, for other planets, it assumes
    % orbiting said planet.
    choice = menu('What will be the destination of your satellite?', 'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', ' Neptune');
    while choice == 0 || choice == 3
        if choice == 0
            fprintf('Error, you need to select a planet!\n');
        elseif choice == 3
            fprintf('Error, your trip is already starting on Earth!\n');
        end
        choice = menu('What will be the destination of your satellite?', 'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', ' Neptune');
    end
    
    % if the user chooses nothing (e.g closes the menu) it will ask the
    % user to input again.
 
    % since the previous function returns index of answers instead of their
    % string values; use a switch to return the string name. It makes
    % coding easier.
    switch choice
        case 1
            destination = 'mercury';
        case 2
            destination = 'venus';
        case 3
           destination = 'earth';
        case 4
            destination = 'mars';
        case 5
            destination = 'jupiter';
        case 6
            destination = 'saturn';
        case 7
            destination = 'uranus';
        case 8
            destination = 'neptune';
    end
end