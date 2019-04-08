function timeStamp = ETA(hohmannTime)
% The argument hohmannTime is described in unit of years, transforms this
% to months, and days.

hrs = hohmannTime * 326.25 * 24;

timeStamp= datetime('now') + hours(hrs);

end

