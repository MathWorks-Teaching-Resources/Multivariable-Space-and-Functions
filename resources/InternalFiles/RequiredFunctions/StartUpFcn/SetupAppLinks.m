SwayLink = "";
StudentFormLink = "";
FacultyFormLink = "";

proj = currentProject;
disp("The loaded project is " + proj.Name) %[output:2be757d8]
disp("Saving the new values...") %[output:1e9126a2]

save(fullfile(proj.RootFolder,"Utilities","SurveyLinks.mat"),"FacultyFormLink","StudentFormLink","SwayLink")

clear SwayLink StudentFormLink FacultyFormLink

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---
%[output:2be757d8]
%   data: {"dataType":"text","outputData":{"text":"The loaded project is module-template\n","truncated":false}}
%---
%[output:1e9126a2]
%   data: {"dataType":"text","outputData":{"text":"Saving the new values...\n","truncated":false}}
%---
