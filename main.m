% clear workspace and console
clc, clear

% prompt the user to select a planet of destination

destination = setDestination;

% promts the user to choose what type of mission/purpose the satellite will
% have, and according to this, a weight is given, this is merely
% informative.


[purpose, weight] = setPurpose;

% prompts the user to choose in what orbit will the satellite start end on
% both planets.

parking = getParkOrbit;

% due to how the code internally works, the extra arguments in fprintf
% capitalise the first letter of variables of type 'char'
% such as 'mars' -> 'Mars'

fprintf('The destination of your %s satellite will be %s with an approximate weight of %d\n', purpose, [upper(destination(1)), destination(2:end)], weight);


% calculates the deltaV by burning and performing Hohmann Transfers.

[totalDeltaV, hohmannTime] = computeTransfer(destination, parking);


fprintf('It will have a deltaV of %.2f km/s to fully perform the transfer to %s.\n', totalDeltaV, [upper(destination(1)), destination(2:end)]);

% According to Hohmann time calculated previously, this will give the
% expected time of arrival if the satellite were launched NOW.

eta = ETA(hohmannTime);

fprintf('Your satellite should arrive in %s.\n', eta);

runPlot(parking, destination, purpose);

