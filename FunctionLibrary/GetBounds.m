%[text] # Identify reasonable plotting bounds
%[text] `newLims = GetBounds(inValues,sf)` will return plotting bounds where the minimum and maximum center the `inValues` with scale factor `sf` on each side. If `inValues` consists of a single value then `newLims` will return an interval of length 2 centered on `inValues`. 
function newLims = GetBounds(inValues,sf)
arguments
    inValues double {mustBeReal}
    sf (1,1) double {mustBeReal,mustBePositive} = 0.125
end
maxVal = max(inValues);
minVal = min(inValues);
if maxVal > minVal
    newScale = (maxVal-minVal)*sf;
else
    newScale = 1;
end
newLims = [minVal-newScale, maxVal+newScale];
end

%[appendix]{"version":"1.0"}
%---
