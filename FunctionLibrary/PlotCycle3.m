function ax = PlotCycle3(Units1,Units2,Units3,Values1,Values2,Values3,opts)
arguments
        Units1 (1,1) string 
        Units2 (1,1) string
        Units3 (1,1) string
%        TitleStr (1,1) string = "P-V plot"
end
arguments(Repeating)
    Values1 (1,:) {mustBeReal,mustBeNumeric}
    Values2 (1,:) {mustBeReal,mustBeNumeric}
    Values3 (1,:) {mustBeReal,mustBeNumeric}
end
arguments
     opts.TitleStr (1,1) string = "Curve"
     opts.Axis = gca
     opts.ResetLimits (1,1) logical = true
     opts.FillRegion (1,1) logical = true
     opts.SeriesIndex = 1
     opts.LineWidth = 1
end
ax = opts.Axis;
allVals1 = [Values1{:,:}];
allVals2 = [Values2{:,:}];
allVals3 = [Values3{:,:}];
xlabel(Units1)
ylabel(Units2)
zlabel(Units3)
title(opts.TitleStr,Interpreter="latex")
if opts.ResetLimits
SetLabels(allVals1,"x",true)
SetLabels(allVals2,"y",true)
SetLabels(allVals3,"z",true)
xlim(GetBounds(allVals1))
ylim(GetBounds(allVals2))
zlim(GetBounds(allVals3))
end
ax.PositionConstraint = "innerposition";
pvLinePlot(ax,Values1,Values2,Values3,opts.SeriesIndex,opts.LineWidth);
if opts.FillRegion
if allVals1(1)==allVals1(end) && allVals2(1)==allVals2(end) && allVals3(1)==allVals3(end)
    fill3(allVals1,allVals2,allVals3,[0.9 0.9 0.9],"EdgeColor","none")
end
end
ax.Children = flipud(ax.Children);
end

%%
function pvLinePlot(ax,Values1,Values2,Values3,SeriesColor,Width)
arguments
    ax 
    Values1
    Values2
    Values3
    SeriesColor
    Width
end
% Helper function to plot the lines, add the arrows, fix the colors, and
% identify the starting and ending points of the path
z = reshape([Values1;Values2;Values3],1,[]);
ax.NextPlot = "add";
p = plot3(ax,z{:},SeriesIndex=SeriesColor,LineWidth=Width);

series1Color = p(1).Color;
for k = 2:numel(p)
p(k).Color = series1Color;
end

% [axVals,ayVals,azVals] = cellfun(@(V1,V2,V3) LocateArrow3(ax,V1,V2,V3),Values1,Values2,Values3,'UniformOutput',false);
% cellfun(@(x,y,z) annotation("arrow",x,y,z,"Color",series1Color),axVals,ayVals,azVals)

endPts = [Values1{1}(1) Values2{1}(1) Values3{1}(1); Values1{end}(end) Values2{end}(end) Values3{end}(end)];

ax.NextPlot = "add";
scatter3(ax,endPts(:,1),endPts(:,2),endPts(:,3),50,"Filled",MarkerFaceColor=series1Color)

end

%[appendix]{"version":"1.0"}
%---
