%[text] # Locate the center and orientation of a line with respect to a figure
%[text] `[axVals,ayVals] = LocateArrow(xVals,yVals,ax)` computes the center and orientation of a line defined by the points `(xVals(i),yVals(i))`. These values are scaled according to the relationship between the axis and the corresponding figure and returned as the `(x,y)` coordinates `(axVals(1),ayVals(1))` and `(axVals(2),ayVals(2))`. 
% Locate arrow
function [axVals,ayVals] = LocateArrow(xVals,yVals,ax)
scVals = ax.Position;
newXLims = ax.XLim;
newYLims = ax.YLim;
ell = numel(xVals);
if ell == 2
    xi = xVals(1);
    xf = xVals(2);
    yi = yVals(1);
    yf = yVals(2);
    if xi ~= xf
%         slope = (yf-yi)/(xf-xi);
        xmi = mean(xVals)-0.01*(xf-xi);
        xmf = xmi+0.02*(xf-xi);
    else
        xmi = xi;
        xmf = xf;
    end
    if yi ~= yf
        ymi = mean(yVals)-0.01*(yf-yi);
%         if xi ~= xf
%             yf = yi+0.02*(xf-xi)*slope;
%         else
            ymf = ymi+0.02*(yf-yi);
%         end
    else
        ymi = yi;
        ymf = yf;
    end
else
    try
        xmi = xVals(ell/2);
        ymi = yVals(ell/2);
        xmf = xVals(ell/2+1);
        ymf = yVals(ell/2+1);
    catch
        xmi = xVals((ell-1)/2);
        ymi = yVals((ell-1)/2);
        xmf = xVals((ell+1)/2);
        ymf = yVals((ell+1)/2);
    end
end

axVals = ([xmi xmf]-newXLims(1))./(newXLims(2)-newXLims(1))*(scVals(3))+scVals(1);
ayVals = ([ymi ymf]-newYLims(1))./(newYLims(2)-newYLims(1))*(scVals(4))+scVals(2);
end

%[appendix]{"version":"1.0"}
%---
