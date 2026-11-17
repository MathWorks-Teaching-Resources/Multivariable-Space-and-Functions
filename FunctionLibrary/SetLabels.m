%[text] # Identifies appropriate axis labels
%[text] `SetLabels(vValues,axisChoice,flag)` uses the first, last, minimum and maximum values in `vValues` to create and label ticks on `axisChoice`. The `flag` identifies whether the precise value of the last data point is known (`flag=true)` or unknown `(flag=false)`. 
function SetLabels(vValues,axisChoice,flag)
arguments
    vValues (1,:) double
    axisChoice string {mustBeMember(axisChoice,["x","y"])}
    flag logical = false
end
firstVal = round(vValues(1),2);
lastVal = round(vValues(end),2);
vValues = unique(vValues);
minVal = round(vValues(1),2);
maxVal = round(vValues(end),2);

if maxVal ~= max(lastVal,firstVal)
    if abs((maxVal-max(lastVal,firstVal))/(maxVal-minVal)) < 0.1
        maxVal = max(lastVal,firstVal);
    end
end

if minVal ~= min(lastVal,firstVal)
    if abs((minVal-min(lastVal,firstVal))/(maxVal-minVal)) < 0.1
        minVal = min(firstVal,lastVal);
    end
end

labelVals = unique([firstVal,lastVal,minVal,maxVal]);

if firstVal~=lastVal && ~flag
    strLabels = string(labelVals);
    strLabels(labelVals == lastVal) = "?";
else
    strLabels = string(labelVals);
end

if axisChoice == "x"
    xticks(labelVals)
    xticklabels(strLabels)
else
    yticks(labelVals)
    yticklabels(strLabels)
end
end

%[appendix]{"version":"1.0"}
%---
