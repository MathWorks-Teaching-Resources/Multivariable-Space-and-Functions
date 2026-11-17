%[text] # Line Integrals
%[text] In your first course in integral calculus, you evaluated lots of line integrals, but only along one path: from $x=a$ to $x=b$ along the $x$-axis! 
%[text]{"align":"center"} ![A plot of the integral of a sinusoidal function from x=a to x=b showing the shaded area between the function and the y-axis.](text:image:12a9)
%[text] A line integral is a type of integral where a function is evaluated along a curve that can be more general than the $x$-axis. They are particularly useful in fields like physics and engineering, where they help in understanding and computing quantities like work done by a force field, electromagnetic induction, mass of a wire, or circulation and flux in vector fields. In this script we will explore some of the calculations that can be done with line integrals over more varied paths. 
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:8fa8) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:8980) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:8e20)  For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
%[text] The ![Try this icon](text:image:0248)  and  ![Exercise icon](text:image:179d) icons refer to two different types of interactive activities that you will find in this script. The ![Try this icon](text:image:8183)  usually indicates an interaction where you will explore the visualization of some concept introduced in this script. The ![Exercise icon](text:image:15db) interactions are designed to challenge your understanding of those concepts and may be used for grading and completion checks by your professor.
%[text] ## **Glossary of Notation**
%[text] - $\\vec{F}$ is a vector function
%[text] - $F$ is a scalar function
%[text] - $\\mathbf{e}\_x$ and $\\mathbf{e}\_r$ are unit vectors in the $x$ and $r$ directions, respectively
%[text] - $C$ is a path and $\\vec{s}$ is a parameterization of the path
%[text] - $\\frac{dx}{dt} = x^{\\prime}(t)$ are both the derivative of $x$ with respect to $t$  \
%%
%[text] ## Background Discussion
%[text] The motivation for line integrals is to generalize the idea of a one dimensional integral, as you are familiar with from integral calculus, 
%[text]{"align":"center"} $\\int\_a^b f(x)\\; dx = F(b)-F(a),$
%[text] where $F$ is an antiderivative of the scalar function $f$ to a definition that will apply to any one-dimensional path through space. We will cover two different aspects of line integrals. 
%[text]  **Type 1:** What does it mean to integrate a scalar function $F$ over a general path $C$? 
%[text] One example of Type 1 in thermodynamics is computing the work done along a closed cycle in Pressure-Volume space. 
%[text]{"align":"center"} ![](text:image:8349)
%[text]  **Type 2:** What does it mean to integrate a vector-valued function $\\vec{F}$ over a general path $C$?
%[text] One example of Type 2 in electricity and magnetism is computing the work done to move a point charge from Point A to Point B along a particular path.
%[text]{"align":"center"} ![](text:image:97c4)
%[text] %[text:anchor:TMP_689b] While the result of computing a line integral is always a scalar value, such as work, we need to determine how to create a scalar result from both Type 1 and Type 2 problems. 
%[text] ## Definition of a Line Integral
%[text] Integrals measure the accumulation of some quantity. Let's consider how to define such a summation in the vector-valued function case. We can parameterize the curve $C$ with a vector-valued function $\\vec{s}$. This allows us to compute the value of the vector field $\\vec{F}$ at each point along $C$, which gives a unique vector denoted $\\vec{F}(\\vec{s})$ at each point. We will progress along the curve $C$ in an incremental fashion that we can denote by the vector-valued infinitesmal $d\\vec{s}$. The amount of $\\vec{F}(\\vec{s})$ that is in the direction $d\\vec{s}$ along the curve is calculated with the dot product $\\vec{F}(\\vec{s})\\cdot d\\vec{s}$. Thus, we can define the integral as:
%[text]{"align":"center"} $\\int\_C \\vec{F}(\\vec{s})\\cdot d\\vec{s} = \\lim\_{||\\Delta \\vec{s}\_i||\\to 0}\\sum\_{i=1}^N \\vec{F}(\\vec{s}\_i)\\cdot \\Delta \\vec{s}\_i$
%[text] Let's take a curve $C$ in three dimensions. Then this integral can also be written in terms of $x$, $y$, and $z$. First, express $\\vec{F}$ component-wise as $\\vec{F}(\\vec{s}) = M(x,y,z)\\textbf{e}\_x + N(x,y,z)\\textbf{e}\_y + P(x,y,z)\\textbf{e}\_z$, where $M, N,$ and $P$ are scalar functions. In this case $\\vec{s} = (x,y,z)$ and thus $d\\vec{s} = dx\\textbf{e}\_x + dy\\textbf{e}\_y + dz \\textbf{e}\_z$ such that the line integral becomes
%[text]{"align":"center"} $\\displaystyle \\int\_C \\vec{F}(\\vec{s})\\cdot d\\vec{s} = \\int\_C M(x,y,z)\\; dx + \\int\_C N(x,y,z)\\; dy + \\int\_C P(x,y,z)\\; dz${"altText":" \int\_C \vec{F}(\vec{s})\cdot d\vec{s} = \int\_C M(x,y,z); dx + \int\_C N(x,y,z); dy + \int P(x,y,z); dz"}.
%[text] This has reduced the line integral of a vector-valued function to the sum of several line integrals of scalar-valued functions. How can we compute this type of line integral? We have to relate the infinitesimal values $dx$, $dy$, and $dz$ to the infinitesimal along the path $C$, $ds$.
clearvars -except testCase FileToRun
tVals = linspace(-2,4,100); %[text:anchor:M_5d68]
xVals = tVals.^3-10*tVals;
yVals = (1-tVals).^2-0.3*tVals;
  %[control:button:3682]{"position":[1,2]}
AnimateDS(xVals,yVals,StartingIndex=25,Animate=false);
%[text] If we consider the parameterization of $C$ expressed as $\\vec{s}(t) = (x(t),y(t))$, then the triangular relationship gives us the suggestion:
%[text]{"align":"center"} $\\int\_C F(x,y)\\; ds  = \\int\_C F(x(t),y(t))\\sqrt{\\frac{dx}{dt}^2+\\frac{dy}{dt}^2}\\; dt = \\int\_C F(x(t),y(t))\\left|\\left| \\frac{d\\vec{s}(t)}{dt}\\right|\\right| \\; dt$
%%
clearvars tVals xVals yVals
%[text] Does this hold up as we traverse $C$?
tVals = linspace(-2,4,100); %[text:anchor:M_5d68]
xVals = tVals.^3-10*tVals;
yVals = (1-tVals).^2-0.3*tVals;
  %[control:button:3351]{"position":[1,2]}
AnimateDS(xVals,yVals);
%[text] The differential along the curve $ds$ changes length (or, equivalently, speed) as the starting point traverses the curve at a rate determined by the parameterization. Therefore a scalar line integral is defined to be:
%[text]{"align":"center"} $\\displaystyle \\int\_C F(\\vec{s})\\; ds = \\lim\_{||\\Delta \\vec{s}\_i\\,||\\to 0} \\sum\_{i=1}^N F(\\vec{s})\\Delta \\vec{s}\_i = \\int\_C F(\\vec{s}(t))\\; ds = \\int\_a^b F(\\vec{s}(t))||\\vec{s}\\prime(t)||\\; dt$.
%[text] if $C$ is parameterized by $\\vec{s}(t) = (x(t), y(t))$ for $a \\leq t \\leq b$.
%%
clearvars tVals xVals yVals %[text:anchor:TMP_73c8]
%[text] ## Independence of Parameterization
%[text] To compute any line integral, we will need to parameterize the curve over which the line integral is defined. Two parameterizations define the same curve if they trace out the same set of points in space. They might trace the curve at different speeds or use different parameter values, but since they trace the same points, the function $F$ evaluated along the curve is the same at corresponding locations. However, we are free to pick whichever parameterization is the most convenient for the calculation because the result is independent of parameterization. Consider two different parameterizations of $C$ given by $\\vec{s\_1}(t)$ from $t=a\_1$ to $t=a\_2$ and $\\vec{s\_2}(u)$ from $u=b\_1$ to $u=b\_2$. We know that $\\vec{s\_1}(a\_1)= \\vec{s\_2}(b\_1)$ and $\\vec{s\_1}(a\_2) = \\vec{s\_2}(b\_2)$, and in fact: 
%[text]{"align":"center"} $\\displaystyle \\int\_{a\_1}^{a\_2}F(\\vec{s\_1}(t))||\\vec{s\_1}\\prime(t)||\\; dt = \\int\_{b\_1}^{b\_2}F(\\vec{s\_2}(u))||\\vec{s\_2}\\prime(u)||\\; du$.
%[text] This has to be true because we could choose all the same waypoints $\\left(\\vec{s}\\!\\right)\_i=\\left(\\vec{s\_1}\\right)\_i=\\left(\\vec{s\_2}\\right)\_i$, and then $\\Delta \\vec{s}\\!\\!\_i$ are all identical lengths and $F(\\!\\vec{s}\\!\_i)$ are all identical values. Fundamentally, when the step size for each integral changes it is exactly counteracted by the change in speed so $\\left|\\left|\\frac{d\\vec{s\_1}}{dt}\\right|\\right|\\; dt = \\left|\\left|\\frac{d\\vec{s\_2}}{du}\\right|\\right|\\;du$. 
%[text] ### Notation for Line Integrals of Scalar Functions
%[text] The line integral of a scalar function along a curve $C$ is calculated using the same limit of Riemann sums as all the integrals studied in your first class in integral calculus but now the calculation looks like
%[text]{"align":"center"} $\\int\_C F(x,y)\\; ds = \\int\_C F(x(t),y(t)) \\; \\left|\\left|\\frac{d\\vec{s}}{dt}\\right|\\right|\\; dt = \\int\_C F(x(t),y(t)) \\sqrt{\\left(\\frac{dx}{dt}\\right)^2 + \\left(\\frac{dy}{dt}\\right)^2} \\; dt.$
%[text] ### Notation for Line Integrals of Vector Fields
%[text] Computing a line integral over a vector field sounds like it might be more complicated, but in some ways it is a simpler calculation. The component of the vector field which is aligned with the curve at each point will contribute and the perpendicular components will not. Therefore
%[text]{"align":"center"} $\\int\_C \\vec{F}(x,y) \\cdot d\\vec{s} = \\int\_C \\vec{F}(x,y)\\cdot\\left(\\frac{\\partial s}{\\partial x}\\;dx,\\frac{\\partial s}{\\partial y}\\;dy\\right) = \\int\_C \\vec{F}(x(t),y(t))\\cdot \\left(\\frac{dx}{dt},\\frac{dy}{dt}\\right) \\; dt.$
%[text] ### Notation for Line Integrals Around Closed Loops
%[text] One particularly common type of line integral involved integrating along a closed loop path. If we denote the vector field by $\\vec{F}(x,y)$
  %[control:button:6e11]{"position":[1,2]}
[X,Y] = meshgrid(-12:0.4:12,-10:0.4:10);
fig = figure;
BackColor = fig.Color;
q = quiver(X,Y,0.5*sin(X.*Y),X.*cos(Y)/16,"off");
xlim([-12 12])
ylim([-10 10])
axis equal off
hold on
PlotCycle("x","y",[-10 -6],[-8 -8],[-6 -6],[-8 8],[-6 -10],[8 8],[-10 -10],[8 -8], ...
    FillRegion=false,ResetLimits=false,SeriesIndex=2,LineWidth=2);
text(-9,0,"$C_1$",FontSize=20,FontWeight="bold",Interpreter="latex",SeriesIndex=2,BackgroundColor=BackColor)
Alpha = linspace(0,2*pi,100);
PlotCycle("x","y",4*cos(Alpha(1:50)),4*sin(Alpha(1:50)),4*cos(Alpha(50:end)), ...
    4*sin(Alpha(50:end)),FillRegion=false,ResetLimits=false,SeriesIndex=4,LineWidth=2);
PlotCycle("x","y",[5 7],[4 -4],[7 9],[-4 -4],[9 11],[-4 4],8+3*cos(Alpha(1:50)),[4+sin(Alpha(1:49)*5) 4],...
    TitleStr="Three parameterized loops",FillRegion=false,ResetLimits=false,SeriesIndex=7,LineWidth=2);
text(-1,0,"$C_2$",FontSize=20,FontWeight="bold",Interpreter="latex",SeriesIndex=4,BackgroundColor=BackColor)
text(7,0,"$C_3$",FontSize=20,FontWeight="bold",Interpreter="latex",SeriesIndex=7,BackgroundColor=BackColor)
hold off
%[text] the integral around a closed loop is denoted with a specific integral symbol, $\\oint$, as in:
%[text]{"align":"center"} $\\displaystyle \\oint\_{C\_1} \\vec{F}(x,y) \\cdot d\\vec{s}$     or     $\\displaystyle \\oint\_{C\_2} \\vec{F}(x,y) \\cdot d\\vec{s}$     or     $\\displaystyle \\oint\_{C\_3} \\vec{F}(x,y) \\cdot d\\vec{s}$.
%[text] ![Warning symbol](text:image:20da) **Note:** The notation $\\oint$ for an integral around a closed loop is commonly used for [contour integrals](https://www.mathworks.com/help/matlab/math/complex-line-integrals.html), which are line integrals around a closed loop in complex variable space. 
%%
clear Alpha BackColor fig q X Y %[text:anchor:TMP_4d7f]
%[text] ## Computing Line Integrals
%[text] ![Try this icon](text:image:0fbf) **Try.** Choose a curve and a vector field and observe the resulting value.
F = "radially outward"; C = "diagonal line";   %[control:dropdown:0c54]{"position":[5,23]} %[control:dropdown:03ec]{"position":[29,44]} %[control:button:0c3a]{"position":[46,47]}
Pts = IdentifyCurve(C,F);
LineIntegralValue = CalculateResult(F,Pts);
PlotVectorField(1,VectorField=F,Dim="2D");
axis equal
hold on
PlotCycle("x","y",Pts(1:2),Pts(3:4),...
    FillRegion=false,ResetLimits=false,SeriesIndex=2,LineWidth=2,TitleStr="$\int_C F\; ds = $" + LineIntegralValue);
hold off

% displayFormula(['"The value of this integral is: "' "LineIntegralValue"])

%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

function Val = CalculateResult(F,Pts)
dx = sign(Pts(2)-Pts(1));
dy = sign(Pts(4)-Pts(3));
if dx ~= 0
    XVec = Pts(1):sign(Pts(2)-Pts(1)):Pts(2);
else
    XVec = Pts(1);
end
if dy ~= 0
    YVec = Pts(3):sign(Pts(4)-Pts(3)):Pts(4);
else
    YVec = Pts(3);
end
if numel(XVec) ~= numel(YVec)
    if isscalar(YVec)
        YVec = YVec*ones(size(XVec));
        dir = "dx";
    elseif isscalar(XVec)
        XVec = XVec*ones(size(YVec));
        dir = "dy";
    else
        error("Incompatible dimensions of X and Y")
    end
else
    dir = "diag";
end
switch F
    case "x"
        MyIntegrand = [XVec; zeros(size(XVec))];
    case "negative y"
        MyIntegrand = [zeros(size(YVec)); -sign(YVec)];
    case "radially outward"
        RVec = sqrt(XVec.^2 + YVec.^2);
        RVec(RVec==0) = 1;
        SinTheta = YVec./RVec;
        CosTheta = XVec./RVec;
        MyIntegrand = [CosTheta; SinTheta];
end
switch dir
    case "dx"
        if F ~= "x"
        Val = sum(MyIntegrand(1,:))*(sign(Pts(2)-Pts(1)));
        else
        Val = (Pts(2)^2-Pts(1)^2)/2*(sign(Pts(2)-Pts(1)));
        end
    case "dy"
        Val = sum(MyIntegrand(2,:))*(sign(Pts(4)-Pts(3)));
    case "diag"
        if F ~= "x"
        Val = sum(MyIntegrand*sqrt(2)/2.*[sign(Pts(2)-Pts(1)); sign(Pts(4)-Pts(3))],"all");
        else
            Val = (Pts(2)^2-Pts(1)^2)*sqrt(2)/4*(sign(Pts(2)-Pts(1)));
        end
    otherwise
        error("Unset integration direction.")
end
end

function Pts = IdentifyCurve(C,F,opts)
arguments
    C 
    F 
    opts.Simple (1,1) logical = false 
end
EndPt = randi([-7 -4],1);
XShift = randi([-6 6],1);
if opts.Simple && F == "radially outward"
    YShift = XShift;
else
    YShift = randi([-6 6],1);
end
switch C
    case "??"
        StartX = 0;
        StopX = 6;
        StartY = 0; 
        StopY = 0; 
    case "horizontal line"
        StartX = abs(XShift);
        StopX = EndPt + abs(XShift);
        StartY = YShift; 
        StopY = YShift;         
    case "vertical line"
        StartX = XShift;
        StopX = XShift;
        StartY = abs(YShift); 
        StopY = EndPt+abs(YShift); 
    case "diagonal line"
        StartX = EndPt + abs(XShift);
        StopX = abs(XShift);
        StartY = EndPt + abs(YShift); 
        StopY = abs(YShift); 
    otherwise
        warning("Unexpected value for C: " + C)
end
Pts = [StartX,StopX,StartY,StopY];
if ~opts.Simple
FlipEnds = randi([0 1],2);
if FlipEnds(1)
    Pts = [Pts(2) Pts(1) Pts(3) Pts(4)];
end
if FlipEnds(2)
    Pts = [Pts(1) Pts(2) Pts(4) Pts(3)];
end
end
end
%[text] ![Lightbulb mark](text:image:0a5d)**Reflect.** What relationships between the vector fields and the curves result in positive, negative, or zero-valued line integrals? Can looking for symmetries help you simplify the problem?
%%
%[text] ### Qualitative Computation
%[text] ![Paper and pencil icon](text:image:8ba7) **Exercise 1.** Choose a curve and a vector field. Then determine whether the integral of that vector field along that curve is positive, negative, or zero.
clear F C LineIntegralValue Pts
F = "radially outward"; C = "clockwise rectangle";   %[control:dropdown:76dc]{"position":[5,23]} %[control:dropdown:7429]{"position":[29,50]} %[control:button:9b4f]{"position":[52,53]}
step = 1;
PlotVectorField(step,VectorField=F,Dim="2D");
axis equal
DefineCurve(C)
%%
SignOfIntegral = "zero";  %[control:dropdown:5a25]{"position":[18,24]} %[control:button:11ae]{"position":[25,26]}
CheckEx1(SignOfIntegral,C,F)
function CheckEx1(MyAns,C,F)
arguments
    MyAns (1,1) string {mustBeMember(MyAns,["??" "positive" "negative" "zero" "unclear"])}
    C (1,1) string {mustBeMember(C,["??" "circle" "positive circular arc" "negative circular arc" "clockwise rectangle" "counterclockwise rectangle" "sinusoid"])}    
    F (1,1) string {mustBeMember(F,["x" "negative y" "radially outward" "concentric circles" "eddies"])}
end
if C == "??"
    disp("You must select a curve to determine a line integral.")
    return
end

ClosedLoop = (C == "circle" || C == "clockwise rectangle" || C == "counterclockwise rectangle");
PositiveOrientation = (C == "circle" || C == "positive circular arc" || C == "counterclockwise rectangle");
Conservative = (F == "x" || F == "negative y" || F == "radially outward");
NegativeOrientation = (C == "clockwise rectangle" || C == "negative circular arc");

switch MyAns
    case "positive"
        if F == "x" && (C == "positive circular arc" || C == "sinusoid")
            CorrectMessage(C,F,MyAns)
        elseif F == "x" && C == "positive circular arc"
            CorrectMessage(C,F,MyAns)
        elseif F == "concentric circles" && PositiveOrientation
            CorrectMessage(C,F,MyAns)
        elseif F == "radially outward" && C == "sinusoid"
            CorrectMessage(C,F,MyAns)
        else
            IncorrectMessage(C,F,MyAns)
        end
    case "negative"
        if (F == "x" || F == "negative y") && C == "negative circular arc"
            CorrectMessage(C,F,MyAns)
        elseif F == "concentric circles" && NegativeOrientation
            CorrectMessage(C,F,MyAns)
        else 
            IncorrectMessage(C,F,MyAns)
        end
    case "zero"
        if Conservative && ClosedLoop
            CorrectMessage(C,F,MyAns)
            if F == "radially outward" && (C == "clockwise rectangle" || C == "counterclockwise rectangle")
                disp("This does require observing that the radially outward field is conservative.")
            end
        elseif (F == "negative y" || F == "concentric circles") && C == "sinusoid"
            CorrectMessage(C,F,MyAns)
        elseif (F == "radially outward") && (C == "negative circular arc" || C == "positive circular arc")
            CorrectMessage(C,F,MyAns)
            disp("The field is perpendicular to the path.")
        else
            IncorrectMessage(C,F,MyAns)
        end
    case "unclear"
        if F == "eddies"
            disp("Yes, it is unclear what the solution is from this plot.")
            disp("This vector field is rapidly changing and would require careful calculation.")
        elseif F == "radially outward" && (C == "clockwise rectangle" || C == "counterclockwise rectangle")
            disp("Fair, the sign might not be immediately visible.")
            disp("In fact, this vector field is ")
        else
            IncorrectMessage(C,F,MyAns)
        end
    case "??"
        disp("This is the default value. Please select positive, negative, zero, or unclear.")
    otherwise
        warning("Unexpected answer selction: " + MyAns)
end
end

function CorrectMessage(C,F,MyAns)
    if F == "x" || F == "eddies"
        ModStr = " an ";
    else
        ModStr = " a ";
    end
disp("Yes, the integral of" + ModStr + F + " field over this " + C + " is visibly " + MyAns + ".")
end

function IncorrectMessage(C,F,MyAns)
disp("No, it is not correct that the integral of a field that is " + F + " over this " + C + " is visibly " + MyAns + ".")
end
%%
%[text] ### Analytic Computation
%[text] To integrate a scalar function $F(x,y)$ along the path $C$, let's think about what this looks like in the basic integrals along the $x$-axis case:
%[text]{"align":"center"} $\\int\_{x=a}^{x=b} F(x)\\; dx.$
%[text] This is a limit of Riemann sums of rectangles with height $F(x)$ and width $dx$. In this more general case, our height will still be the value of our function, but the width has to be an incremental step along our path. Let's denote that incremental step as $ds=\\left|\\left|\\frac{d\\vec{s}}{dt}\\right|\\right| \\; dt= \\sqrt{\\left(\\frac{dx}{dt}\\right)^2 + \\left(\\frac{dy}{dt}\\right)^2} dt$, which is the [arc length element](internal:M_5d68) along our parameterized path. 
%[text] ![Try this icon](text:image:0175) **Try.** Use the button to randomly select a point and calculate its arc length along a parameterized piecewise path.
clearvars C F SignOfIntegral
  %[control:button:7d9f]{"position":[1,2]}
PlotPiecewisePath()
function PlotPiecewisePath()
if ~exist("xyVAll","var")
syms t
xFun = [t.^2 1-(t-1) 2.*(t-2)];
yFun = [t.^3 1+8.*(t-1) 9-sin(t-2)];
assert(numel(xFun)==numel(yFun))
n = numel(xFun);
Steps = max(ceil(100/n),10);
xyVAll = cell(2*n,1);
for idx = 1:n
    tVals = linspace(idx-1,idx,Steps);
    xVals = matlabFunction(xFun(idx));
    yVals = matlabFunction(yFun(idx));
    xyVAll{2*idx-1,1} = xVals(tVals);
    xyVAll{2*idx,1} = yVals(tVals);
end
figure
ax = PlotCycle("x(t)","y(t)",xyVAll{:},TitleStr="");
s = scatter(ax,0,0,40,"filled",SeriesIndex=2);
q = quiver(ax,0,0,0,0,SeriesIndex=2,LineWidth=2);
end
idx = randi(n,1);
MyStep = randi(Steps,1);
tVals = linspace(idx-1,idx,Steps);
t0 = tVals(MyStep);
xF = xFun(idx);
yF = yFun(idx);
dx = diff(xF,t);
x0 = xyVAll{2*idx-1}(MyStep);
y0 = xyVAll{2*idx}(MyStep);
try 
    dx0 = subs(dx,t,t0);
catch
    dx0 = dx;
end
dy = diff(yF,t);
try
    dy0 = subs(dy,t,t0);
catch
    dy0 = dy;
end
dxdy = sqrt(dx0^2+dy0^2);
title(ax,"A curve $C$ showing $ds$ at x(" + t0 + "), y(" + t0 + ")")
subtitle(ax,"$||ds|| = " + latex(dxdy) + "$",Interpreter="latex")
s.XData = x0;
s.YData = y0;
q.XData = x0;
q.YData = y0;
q.UData = double(dx0)/5;
q.VData = double(dy0)/5;
end
%%
%[text] Therefore, changing variables back to our parameterization gives:
%[text]{"align":"center"} $\\int\_C F(x,y)\\; ds = \\int\_C F(x(t),y(t)) \\; \\left|\\left|\\left(\\frac{dx}{dt},\\frac{dy}{dt}\\right)\\right|\\right|\\; dt = \\int\_C F(x(t),y(t)) \\sqrt{\\left(\\frac{dx}{dt}\\right)^2 + \\left(\\frac{dy}{dt}\\right)^2} \\; dt$
%[text] When $C$ is composed of multiple components, the integral can be split into sums of the integral over each subcomponent:
%[text]{"align":"center"} $\\int\_C F(x,y)\\; ds = \\int\_{C\_1}F(x,y)\\; ds + \\int\_{C\_2}F(x,y)\\; ds + \\cdots + \\int\_{C\_n}F(x,y)\\; ds$
%[text] ### Conservative Vector Fields
%[text] Recall that one formulation of the fundamental theorem of calculus states that if $\\frac{dF}{dx} = f(x)$, then $\\displaystyle \\int\_a^b f(x)\\; dx = F(b)-F(a)$. If we are in a scenario where the integrand is the gradient of a scalar function, $\\vec{F} = \\nabla G = \\frac{\\partial G}{\\partial x}\\mathbf{e}\_x+\\frac{\\partial G}{\\partial y}\\mathbf{e}\_y$ , then the line integral can be solved by the fundamental theorem of calculus, as well. Let $\\vec{s(t)} = (x(t),y(t))$ be a parameterization of $C$ from $t=a$ to $t=b$, then
%[text]{"align":"center"} $\\int\_C \\vec{F}\\cdot d\\vec{s} = \\int\_C \\nabla G \\cdot \\left|\\left|\\frac{d\\vec{s}}{dt}\\right|\\right|\\; dt = \\int\_C \\frac{dG(\\vec{s})}{dt} \\; dt = \\int\_C dG = G(\\vec{s}(b))-G(\\vec{s}(a)).$
%[text] ![Warning symbol](text:image:4d84) **Note:** Remember the multivariate chain rule: With $G(x,y)$, $\\frac{d}{dt}\\left(G(x,y)\\right) = \\nabla G\\cdot \\left(\\frac{dx}{dt},\\frac{dy}{dt}\\right) = \\frac{\\partial G}{\\partial x}\\frac{dx}{dt} + \\frac{\\partial G}{\\partial y}\\frac{dy}{dt}$.
%[text] A vector field where $\\vec{F}=\\nabla G$, for some scalar function $G$, is called ***conservative.*** This means that the results of line integrals are independent of the path chosen and only depend on the first and last point of the path. It also means that the integral of a conservative vector field around any closed loop must be zero. Conversely, if the integral of a vector field around any closed loop is not zero, the vector field is not conservative. 
%[text] ![Lightbulb mark](text:image:6770) **Reflect.** Why does it follow that integrals of conservative vector fields around closed loops must be zero?
%[text] #### Identifying Conservative Vector Fields
%[text] In the 2D case, we know that $\\vec{F}$ is conservative if there exists a $G$ with $\\vec{F} = \\nabla G$. To check for this, note the following:
%[text:table]
%[text] | <p align="center">**Mathematical statement**</p> | <p align="center">**Reasoning**</p> |
%[text] | --- | --- |
%[text] | <p align="center">$\\vec{F} = F\_x\\mathbf{e}\_x + F\_y\\mathbf{e}\_y = \\nabla G$ </p> | <p align="center">By hypothesis,$\\vec{F}$ is a conservative vector field with </p><p align="center">components$F\_x$ in the $x$-direction and $F\_y$ in the $y$-direction</p> |
%[text] | <p align="center"></p><p align="center">$F\_x \\,\\mathbf{e}\_x + F\_y \\,\\mathbf{e}\_y = \\frac{\\partial G}{\\partial x} \\mathbf{e}\_x + \\frac{\\partial G}{\\partial y} \\mathbf{e}\_y$ </p> | <p align="center">Apply the definition of gradient, </p><p align="center">$\\nabla G = \\frac{\\partial G}{\\partial x}\\mathbf{e}\_x + \\frac{\\partial G}{\\partial x}\\mathbf{e}\_y$,</p><p align="center">and observe that $F\_x=\\frac{\\partial G}{\\partial x}$ and $F\_y = \\frac{\\partial G}{\\partial y}$.</p> |
%[text] | <p align="center">$\\Rightarrow \\frac{\\partial \\vec{F}\\!\\!\_x}{\\partial y} = \\frac{\\partial \\vec{F}\\!\\!\_y}{\\partial x} = \\frac{\\partial^2 G}{\\partial x \\partial y}$</p> | <p align="center">Compute the crossed partial derivatives, $\\frac{\\partial F\_x}{\\partial y} = \\frac{\\partial^2G}{\\partial y\\partial x}$ and</p><p align="center">$\\frac{\\partial F\_y}{\\partial x} = \\frac{\\partial^2 G}{\\partial x\\partial y}$, and note that for smooth $G$, $\\frac{\\partial^2G}{\\partial x\\partial y} = \\frac{\\partial^2G}{\\partial y \\partial x}$.</p> |
%[text] | <p align="center">$\\Rightarrow \\text{curl}(\\vec{F}) = \\left(\\frac{\\partial \\vec{F}\\!\\!\_y}{\\partial x} - \\frac{\\partial \\vec{F}\\!\\!\_x}{\\partial y}\\right)\\mathbf{e}\_z = 0$</p> | <p>The definition of curl for a 2D vector field is $\\left(\\frac{\\partial \\vec{F}\\!\\!\_y}{\\partial x} - \\frac{\\partial \\vec{F}\\!\\!\_x}{\\partial y}\\right)\\mathbf{e}\_z $,</p><p>but by the previous line $\\frac{\\partial \\vec{F}\\!\\!\_y}{\\partial x} = \\frac{\\partial \\vec{F}\\!\\!\_x}{\\partial y}$, so $\\text{curl}(\\vec{F})=0$.</p> |
%[text:table]
%[text] A similar result in 3D also shows that $\\vec{F}$ is conservative if and only if
%[text]{"align":"center"} $\\displaystyle \\text{curl}(\\vec{F}) = \\left(\\frac{\\partial \\vec{F}\\!\\!\_z}{\\partial y} - \\frac{\\partial \\vec{F}\\!\\!\_y}{\\partial z}\\right)\\textbf{e}\_x + \\left(\\frac{\\partial \\vec{F}\\!\\!\_x}{\\partial z} - \\frac{\\partial \\vec{F}\\!\\!\_z}{\\partial x}\\right)\\textbf{e}\_y + \\left(\\frac{\\partial \\vec{F}\\!\\!\_y}{\\partial x} - \\frac{\\partial \\vec{F}\\!\\!\_x}{\\partial y}\\right)\\textbf{e}\_z = 0$.
%[text] ![MATLAB icon](text:image:1380) **Pro-tip**. You can compute the curl of a symbolic vector field in MATLAB with the command [`curl(V,X)`](https://www.mathworks.com/help/symbolic/sym.curl.html)`.`
%[text] ```matlabCodeExample
%[text] syms x y z
%[text] V = [x*y x^2 -z^2];
%[text] X = [x y z]
%[text] curl(V,X)
%[text] ```
%%
%[text] ![Paper and pencil icon](text:image:4bec) **Exercise 2.** Which of the following vector fields are conservative? Justify your answers.
%[text] a) $\\vec{F} = (x-3)\\,\\textbf{e}\_y$
%[text] b) $\\vec{F} = \\sin(x)\\,\\textbf{e}\_{x}-y^2\\,\\textbf{e}\_y$
%[text] c) $\\vec{F} = \\frac{6}{r^3}\\mathbf{e}\_r$
%[text] d) $\\vec{F} = 2\\mathbf{e}\_x -3\\mathbf{e}\_y + \\mathbf{e}\_z$
%[text] e) $\\vec{F} = y\\sin(x)\\,\\mathbf{e}\_x - y\\cos(x)\\, \\mathbf{e}\_y$
%[text] **Solution:**
%[text] <u>Reasoning for a)</u>
%[text] In this case $F\_x = 0$ and $F\_y=x-3$ so $\\frac{\\partial F\_x}{\\partial y} = 0$ and $\\frac{\\partial F\_y}{\\partial x} = 1$. Therefore, the curl is not zero and this vector field is not conservative.
%[text] <u>Reasoning for b)</u>
%[text] In this case $F\_x = \\sin(x)$ and $F\_y = -y^2$, so $\\frac{\\partial F\_x}{\\partial y} = 0$ and $\\frac{\\partial F\_y}{\\partial x} = 0$. Therefore, $\\text{curl(\\vec{F}) = 0$ and this vector field is conservative. We can identify the scalar function by integrating the components of $\\vec{F}$ and recognizing that they must be equal. Thus, $\\displaystyle G = \\int F\_x\\; dx = -\\cos(x)+C\_1(y)$ and $\\displaystyle G=\\int F\_y\\; dy = -\\frac{y^3}{3}+C\_2(x)$ and so $\\displaystyle G = -\\cos(x)-\\frac{y^3}{3}$ is a scalar function such that $\\nabla G = \\vec{F}$.
%[text] <u>Reasoning for c)</u>
%[text] In this case $F\_r = \\frac{6}{r^3}$ and $F\_{\\theta} = 0$, so $\\frac{\\partial F\_r}{\\partial \\theta} = 0$ and $\\frac{\\partial F\_{\\theta}}{\\partial r} = 0$. Therefore, $\\text{curl(\\vec{F}) = 0$ and this vector field is conservative. We can identify the scalar function by integrating the components of $\\vec{F}$ and recognizing that they must be equal. Thus, $\\displaystyle G = \\int F\_r\\; dr = -\\frac{3}{r^2}+C\_1(\\theta)$ and $\\displaystyle G=\\int F\_\\theta\\; d\\theta = C\_2(r)$ and so $\\displaystyle G = -\\frac{3}{r^2}$ is a scalar function such that $\\nabla G = \\vec{F}$.
%[text] <u>Reasoning for d)</u>
%[text] In this case $F\_x = 2$, $F\_y = -3$, and $F\_z=1$, so all partial derivatives with respect to any variables are 0. Therefore, $\\text{curl(\\vec{F}) = 0$ and this vector field is conservative. We can identify the scalar function by integrating the components of $\\vec{F}$ and recognizing that they must be equal. Thus, $\\displaystyle G = \\int F\_x\\; dx = 2x+C\_1(y,z)$ and $\\displaystyle G=\\int F\_y\\; dy = -3y+C\_2(x,z)$, and $\\displaystyle \\int F\_z\\l dz = z+C\_3(x,y)$, so $\\displaystyle G = 2x-3y+z$ is a scalar function such that $\\nabla G = \\vec{F}$.
%[text] <u>Reasoning for e)</u>
%[text] In this case $F\_x = y\\sin(x)$ and $F\_y=-y\\cos(x)$ so $\\frac{\\partial F\_x}{\\partial y} = \\sin(x)$ and $\\frac{\\partial F\_y}{\\partial x} = y\\sin(x)$. Therefore, $\\text{curl}(\\vec{F}) = (y-1)\\sin(x) \\textbf{e}\_z$ is not zero and this vector field is not conservative.
%[text] 
  %[control:button:1cb2]{"position":[1,2]}
%        a), b), c), d), e)
CheckEx2(true,false,false,false,true) %[control:checkbox:4662]{"position":[10,14]} %[control:checkbox:4923]{"position":[15,20]} %[control:checkbox:4d21]{"position":[21,26]} %[control:checkbox:767e]{"position":[27,32]} %[control:checkbox:2ace]{"position":[33,37]}
%%
%[text] ### Practice Computing Line Integrals
%[text] ![](text:image:44b6) **Exercise 3.** 
clear F x y
F = "radially outward"; C = "diagonal line";   %[control:dropdown:5cd0]{"position":[5,23]} %[control:dropdown:1249]{"position":[29,44]} %[control:button:9b6e]{"position":[46,47]}
Pts = IdentifyCurve(C,F,Simple=true);
StateProblem(F,Pts)
function StateProblem(Field,Pts)
x1 = Pts(1);
x2 = Pts(2);
y1 = Pts(3);
y2 = Pts(4);
str = ['"The curve C is a straight line from ("' "x1" '","' "y1" '") to ("' "x2" '","' "y2" '") and "'];

syms F e_x e_y e_r x
switch Field
    case "x"
        displayFormula([str "F==x*e_x" '"."'])            
    case "negative y"
        displayFormula([str "F==-sign(y)*e_y" '"."'])
    case "radially outward"
        displayFormula([str "F==1*e_r" '" or, equivalently, "' "F==x/sqrt(x^2+y^2)*e_x + y/sqrt(x^2+y^2)*e_y" '"."'])
    otherwise
        error("Unexpected field value: " + Field)
end
end

PlotVectorField(1,VectorField=F,Dim="2D");
axis equal
hold on
PlotCycle("x","y",Pts(1:2),Pts(3:4),...
    FillRegion=false,ResetLimits=false,SeriesIndex=2,LineWidth=2,TitleStr="$\int_C F\; ds = ??$");
hold off
%%
%[text] **Solution:**
  %[control:button:5133]{"position":[1,2]}
try
SolutionExercise3(F,Pts,C,PrintSolution=true);
catch 
    error("You must generate a problem for Exercise 3 before solving it.")
end
%%
clear F C Pts
%[text] ![](text:image:5276) **Exercise 4.** Compute the following integrals. You can work on paper or in the Solution space given to document your computation.
%[text] a) $\\displaystyle \\int\_C (x-3)\\,\\textbf{e}\_y \\cdot ds$ where $C$ is the curve $y=x^2$ from $x=0$ to $x=2$
%[text] <u>**Solution**</u>
%[text] $\\int\_0^2 (x-3)\\mathbf{e}\_y \\cdot (\\mathbf{e}\_x+2x\\mathbf{e}\_y)\\; dx = \\int\_0^2 2x^2-6x\\; dx = \\left.\\frac{2}{3}x^3-3x^2\\right|\_0^2 = \\frac{16}{3}-12 = -\\frac{20}{3}$
Ex4SolnA = double(-20/3);  %[control:editfield:1657]{"position":[19,24]} %[control:button:23ed]{"position":[26,27]}
CheckEx4(Ex4SolnA,"a")
%%
%[text] b) $\\vec{F} = \\sin(x)\\,\\textbf{e}\_{x}-y^2\\,\\textbf{e}\_y$ where $C$ is the curve $y=\\sin(x)\\cos(x)-\\frac{2x}{\\pi}$ from $x=\\frac{\\pi}{2}$ to $x=\\frac{3\\pi}{2}$.
%[text] <u>**Solution**</u>
%[text] Note that $\\vec{F}$ is conservative with $G = -\\cos(x)-\\frac{y^3}{3}$ and the initial point is $\\left(\\frac{\\pi}{2},-1\\right)$ while the final point is $\\left(\\frac{3\\pi}{2},-3\\right)$. Thus, 
%[text]{"align":"center"} $\\displaystyle \\int\_C \\vec{F}\\cdot ds = \\left(-\\cos\\left(\\frac{3\\pi}{2}\\right)-\\frac{(-27)}{3}\\right) - \\left(-\\cos\\left(\\frac{\\pi}{2}\\right)-\\frac{(-1)}{3}\\right) = \\frac{26}{3}$
Ex4SolnB = double(26/3);  %[control:editfield:46d1]{"position":[19,23]} %[control:button:9805]{"position":[25,26]}
CheckEx4(Ex4SolnB,"b")
%%
%[text] c) Let $G = 6.6743\\times 10^{-11} \\,\\frac{\\text{N}\\cdot\\text{m}^2}{\\text{kg}^2}$ be the gravitational constant, while the mass of the Earth is approximately $5.972\\times 10^{24}\\,\\text{kg}$. The Saturn V massed approximately $2.8\\times 10^6\\, \\text{kg}$ of which most was rocket fuel. Let's assume $2.479 \\times 10^6 \\,\\text{kg}$ is RP-1 and LOX fuel for the first stage of the boost, and this fuel is used up at a constant rate over the burn. Calculate the work done *against* gravity$\\vec{F} = -\\frac{GM\_Em\_R}{r^2}\\mathbf{e}\_r$ to lift the Saturn V rocket 67 kilometers. The radius of the Earth can be assumed to be $6.371 \\times 10^6\\, \\text{m}$.
%[text] <u>**Solution**</u>
%[text] $m\_R = 2.8\\times 10^6-\\left(\\frac{2.479\\times 10^6}{67\\times 10^3}\\right)(r-M\_E) = 2.8\\times 10^6-37(r-M\_E)$
%[text] Thus, the antiderivative of $\\vec{F}$ is $GM\_E\\ln(r) - \\frac{GM\_E(2.8\\times 10^6+37M\_E)}{r}$. By the fundamental theorem of line integrals, the solution is $W = GM\_E\\left(1+\\frac{67000}{M\_E}\\right)+GM\_E(2.8\\times 10^6 + 37M\_E)-\\frac{GM\_E(2.8\\times 10^6 + 37M\_E)}{M\_E+67000}$.
%[text] $W = \\int\_{M\_E}^{M\_E+67000}-\\vec{F}\\cdot d\\vec{r}$
%[text] $= GM\_E\\int\_{M\_E}^{M\_E+67000} \\frac{2.8\\times 10^6-37(r-M\_E)}{r^2}\\; dr$
%[text] $= GM\_E \\left(\\left.-\\frac{2.8\\times 10^6+37M\_E}{r}\\right|\_{M\_E}^{M\_E+67000} +37\\ln\\left(\\frac{M\_E}{M\_E+67000}\\right)\\right)$
%[text] $= GM\_E \\left(-\\frac{2.8\\times 10^6+37M\_E}{M\_E+67000}+\\frac{2.8\\times 10^6}{M\_E}+37 +37\\ln\\left(\\frac{M\_E}{M\_E+67000}\\right)\\right)$
%[text] d) $\\displaystyle \\oint\_C 2\\mathbf{e}\_x -3\\mathbf{e}\_y + \\mathbf{e}\_z\\cdot d\\mathbf{s}$ where $C$ is the closed loop shown below.
%[text] 
  %[control:button:4c3e]{"position":[1,2]}
[X,Y,Z] = meshgrid(5:11,-5:5,-2:3);
figure
quiver3(X,Y,Z,2*ones(size(Z)),-3*ones(size(Z)),ones(size(Z)))
Alpha = linspace(0,2*pi,100);
hold on
PlotCycle3("x","y","z",[5 7],[4 -4],[-1 1],[7 9],[-4 -4],[1 3],[9 11],[-4 4],[3 1],8+3*cos(Alpha(1:50)),[4+sin(Alpha(1:49)*5) 4],linspace(1,-1,50),...
    TitleStr="$C$ on the Vector Field $\vec{F}$",FillRegion=false,ResetLimits=false,SeriesIndex=7);
pt1 = [5 4 -1];
pt2 = [7 -4 1];
dir = pt2-pt1;
tip = pt1 + 0.55*dir;
tail = pt1 + 0.45*dir;
perpdir = [0 dir(3) -dir(2)];
perpdir = perpdir/norm(perpdir);
tail1 = tail + 0.03*norm(dir)*perpdir;
tail2 = tail - 0.03*norm(dir)*perpdir;
arrowhead = [tail1; tip; tail2; tail1];
% fill3(arrowhead(1,:), arrowhead(2,:), arrowhead(3,:), "r",SeriesIndex=7)

fill3(arrowhead(:,1),arrowhead(:,2),arrowhead(:,3),"r",SeriesIndex=7)
scatter3([7 9 11],[-4 -4 4],[1 3 1],"filled",SeriesIndex=7)
hold off
%%
Ex4SolnD = double(0);  %[control:editfield:55bf]{"position":[19,20]} %[control:button:26d4]{"position":[22,23]}
CheckEx4(Ex4SolnD,"d")
%%
%[text] <u>**Solution**</u>
%[text] e) $\\displaystyle \\int\_C \\left(y\\sin(x)\\,\\mathbf{e}\_x - y\\cos(x)\\, \\mathbf{e}\_y\\right)\\cdot d\\mathbf{s}$ if $C$ is a straight line from $x=0$ to $x=\\pi$ with $y=1$ and then at straight line from $y=0$ to $y=1$ with $x=\\pi$.
  %[control:button:928c]{"position":[1,2]}
figure
[X,Y] = meshgrid(linspace(-pi/4,5*pi/4,19),-0.125:0.125:1.125);
quiver(X,Y,Y.*sin(X),-Y.*cos(X))
hold on
PlotCycle("x","y",[0 pi],[1 1],[pi pi],[1 0],ResetLimits=true,SeriesIndex=2,TitleStr="Plot $C$ on the Vector Field $\vec{F}$");
hold off
%[text] <u>**Solution**</u>
%[text] $\\int\_{0}^{\\pi} (\\sin(x)\\mathbf{e}\_x-\\cos(x)\\mathbf{e}\_y)\\cdot\\mathbf{e}\_x\\; dx + \\int\_1^0 (y\\sin(\\pi)\\mathbf{e}\_x-y\\cos(\\pi)\\mathbf{e}\_y)\\cdot\\mathbf{e}\_y \\; dy = \\int\_{0}^{\\pi} \\sin(x)\\; dx + \\int\_1^0y\\; dy $
%[text]  $= \\left.\\left.\\frac{y^2}{2}\\right|\_1^0-\\cos(x)\\right|\_{0}^{\\pi}  $
%[text]  $=\\left(0-\\frac{1}{2}\\right)-((-1)-1) = \\frac{3}{2}$
Ex4SolnE = double(1.5);  %[control:editfield:9282]{"position":[19,22]} %[control:button:56c4]{"position":[24,25]}
CheckEx4(Ex4SolnE,"e")
%%
clearvars Ex4SolnA Ex4SolnB Ex4SolnC Ex4SolnD Ex4SolnE %[text:anchor:TMP_98ad]
%[text] ## Green's Theorem
%[text] Let $L$ and $M$ be functions of $x$ and $y$, and let $C$ be a positively (counterclockwise) oriented curve. If $L$ and $M$ have continuous partial derivatives and $C$ is piecewise smooth, then
%[text]{"align":"center"} $\\oint\_C L\\; dx + M\\; dy = \\int\\!\\!\\!\\!\\!\\!\\int \\left(\\frac{\\partial M}{\\partial x} - \\frac{\\partial L}{\\partial y}\\right) \\; dA$
%[text] ![Lightbulb mark](text:image:124c) **Reflect.** What are you calculating if $M=x$? Or if $L=3-y$?
%[text] ### Applications of Green's Theorem
%[text] Green's Theorem can be used to move calculations from one dimension to another. For instance, if we consider functions $L$ and $M$ such that $\\left(\\frac{\\partial M}{\\partial x} - \\frac{\\partial L}{\\partial y}\\right)  = 1$ then the right hand side of Green's Theorem is $\\displaystyle \\int\\!\\!\\!\\!\\!\\!\\int 1 \\; dA = \\text{Area}$. This means that for shapes where the boundary is easier to work with, we can compute the area by only doing an integral around the boundary. 
%[text] #### Calculating Area
%[text] We can calculate the area of a complex shape in a variety of ways by using Green's Theorem. Consider calculating the area of an irregular star:
  %[control:button:9abe]{"position":[1,2]}
ControlPoints = GenerateStar();
PlotStar(ControlPoints)

function PlotStar(ControlPoints)
fill(ControlPoints(1,:),ControlPoints(2,:),"b")

StarEdges = cell([1 numel(ControlPoints(:,1:end-1))]);
for edge = 1:numel(ControlPoints(1,1:end-1))
    StarEdges{2*edge-1} = ControlPoints(1,edge:edge+1);
    StarEdges{2*edge} = ControlPoints(2,edge:edge+1);
end

hold on
PlotCycle("x","y",StarEdges{:},TitleStr="Area with Boundary Path",SeriesIndex=2,ResetLimits=false);
hold off
end
%[text] By computing 
%[text]{"align":"center"} $\\displaystyle \\oint\_{\\partial \\text{Star}} -y\\; dx = \\int\\!\\!\\!\\!\\!\\!\\int\_{\\text{Star}} 1\\; dA = \\text{Area},$
%[text] and because each edge is straight this becomes a series of 10 integrals
ComputeAreaSolution(ControlPoints);

function Total = ComputeAreaSolution(ControlPoints,opts)
arguments
    ControlPoints (2,:) double
    opts.ShowSolution (1,1) logical = true
end
Total = 0;
syms x y
for edge = 1:numel(ControlPoints(1,1:end-1))
    if ControlPoints(1,edge+1)==ControlPoints(1,edge)
        EdgeIntegrand = -y;
        OutVal = 0;
        if opts.ShowSolution
        OutValPrint = 0;
        end
    else
        m = (ControlPoints(2,edge+1)-ControlPoints(2,edge))/(ControlPoints(1,edge+1)-ControlPoints(1,edge));
        EdgeIntegrand = -round(vpa(m),4)*(x-round(vpa(ControlPoints(1,edge),4),4))-round(vpa(ControlPoints(2,edge),4),4);
        OutVal = int(-m*(x-ControlPoints(1,edge))-ControlPoints(2,edge),x,ControlPoints(1,edge),ControlPoints(1,edge+1));
        if opts.ShowSolution
        OutValPrint = round(vpa(OutVal),4);
        end
    end
    Total = Total + OutVal;
    if opts.ShowSolution
    a = round(vpa(ControlPoints(1,edge)),4);
    b = round(vpa(ControlPoints(1,edge+1)),4);
    displayFormula(['"Edge "' "edge" '":"' "int(EdgeIntegrand,x,a,b)==OutValPrint"])
    end
end

TotalPrint = round(vpa(Total),4);
if opts.ShowSolution
displayFormula(['"The area of the star is the sum total: "' "TotalPrint"])
end
end
%%
clearvars ControlPoints
%[text] ![](text:image:46de) **Exercise 5.**
%[text] Compute the area of the figure shown below:
  %[control:button:939f]{"position":[1,2]} %[text:anchor:TMP_5dc5]
CP = round(GenerateStar(Points=4));
CPsmall = CP(:,1:2:end);
if mod(numel(CPsmall),4)~=2
    CPsmall = CPsmall(:,1:end-1);
end
PlotStar(CPsmall)
%%
%[text] **Solution:**
%[text] 
Ex5Soln = 0;  %[control:editfield:762a]{"position":[11,12]} %[control:button:37f5]{"position":[13,14]}
CorrectSoln = ComputeAreaSolution(CPsmall,ShowSolution=true)
if CorrectSoln==Ex5Soln
    disp("Correct!")
    disp("One way to calculate that is: ")
ComputeAreaSolution(CPsmall);
elseif Ex5Soln == 0
    disp("That is the default value. The area is positive.")
elseif Ex5Soln < 0
    disp("Which direction are you integrating? The area should be positive.")
else
    disp("That is not correct. Please try again.")
end
%[text] #### ![](text:image:8c08)Application: Faraday's Law
%[text] Let $\\vec{E}$ be an electric field and $\\vec{B}$ the associated magnetic field in SI units. Faraday's law states that for any stationary closed spatial loop $C=\\partial S$ for a surface $S$, 
%[text]{"align":"center"} $\\displaystyle \\int\_C \\vec{E}\\cdot d\\vec{s} = \\frac{d}{dt}\\int\\!\\!\\!\\!\\!\\!\\int\_S \\vec{B}\\cdot d\\vec{A}$.
%[text] 
%%
function AnimateDS(xVals,yVals,opts)
arguments
    xVals 
    yVals 
    opts.StartingIndex = 1 
    opts.Animate (1,1) logical = true
end
clf
ax = PlotCycle("x","y",xVals,yVals,TitleStr="Parameterized Curve $C$ from $t=a$ to $t=b$");
ax.XTickLabel = ["" "x(a)" "x(b)"];
ax.YTickLabel = ["" "y(b)" "y(a)"];
x0 = xVals(opts.StartingIndex);
y0 = yVals(opts.StartingIndex);
dx0 = xVals(2:end)-xVals(1:end-1);
dy0 = yVals(2:end)-yVals(1:end-1);
scaleFactor = 7./sqrt(dx0.^2+dy0.^2);
dxInit = dx0(opts.StartingIndex)*scaleFactor(opts.StartingIndex);
dyInit = dy0(opts.StartingIndex)*scaleFactor(opts.StartingIndex);
pt = scatter(ax,x0,y0,50,"filled",SeriesIndex=2);
ds = quiver(ax,x0,y0,dxInit,dyInit,SeriesIndex=2,AutoScale="off",LineWidth=2);
dy = quiver(ax,x0,y0,0,dyInit,SeriesIndex=3,AutoScale="off",LineWidth=2);
dx = quiver(ax,x0,y0+dyInit,dxInit,0,SeriesIndex=4,AutoScale="off",LineWidth=2);
legend(["" "" "" "ds" "dy" "dx"],Location="best")
if opts.Animate
for idx = 2:99
    pt.XData = xVals(idx);
    pt.YData = yVals(idx);
    ds.XData = xVals(idx);
    ds.YData = yVals(idx);
    ds.UData = dx0(idx)*scaleFactor(idx);
    ds.VData = dy0(idx)*scaleFactor(idx);
    dy.XData = xVals(idx); 
    dy.YData = yVals(idx);
    dy.VData = dy0(idx)*scaleFactor(idx);
    dx.XData = xVals(idx);
    dx.YData = yVals(idx)+dy0(idx)*scaleFactor(idx);
    dx.UData = dx0(idx)*scaleFactor(idx);
    pause(0)
end
else
    text(x0+0.5*dxInit+0.2,y0+0.5*dyInit-0.2,"ds",SeriesIndex=2)
text(ax,x0+0.5*dxInit,y0+dyInit-0.35,"dx",SeriesIndex=4)
text(ax,x0+0.35,y0+0.5*dyInit,"dy",SeriesIndex=3)
end
end

function PlotVectorField(step,opts) %[text:anchor:TMP_94ac]
arguments
    step (1,1) double {mustBePositive} = 0.5
    opts.VectorField (1,:) string = ""
    opts.Dim (1,1) string {mustBeMember(opts.Dim,["2D" "3D"])} = "2D"
    opts.Coords (1,1) string = "Cartesian"
end
figure
% Create a grid of points for the vector field
if opts.Dim == "2D"
    [x, y] = meshgrid(-6:step:6, -6:step:6);
else
    [x, y, z] = meshgrid(-6:step:6, -6:step:6, -6:step:6);
    % Calculate the radial distance from the origin
    r = sqrt(x.^2 + y.^2 + z.^2);
    cIdx = ceil(r)+1;
end

% Define a grid for the vector field with the
% mesh size (re)-defined by the learner
switch opts.VectorField
    case "concentric circles"
        % Define a tangent vector field to the radial field
        u = -y; % velocity in the x-direction
        v = x;  % velocity in the y-direction
        if opts.Dim == "3D"
            w = sign(z);
            titleStr = "A circulating vector field";
        else
            titleStr = "A vector field in the $\theta$-direction with magnitude $r$";
        end
    case "x"
        u = x; % velocity in the x-direction
        v = zeros(size(y)); % No velocity in the y-direction
        if opts.Dim == "3D"
            w = zeros(size(z)); % No velocity in the z-direction
        end
        titleStr = "A vector field in the $|x|$-direction";
    case "negative y"
        [x,y] = meshgrid(-10:step:10,-6:step:6);
        u = zeros(size(x)); % velocity in the x-direction
        v = -y./abs(y); % normalized velocity in the y-direction
        if opts.Dim == "3D"
            w = zeros(size(z));
        end
        titleStr = "A vector field in the $-y$-direction";
    case "radially outward"
        if opts.Dim == "2D"
            u = x./sqrt(x.^2+y.^2); % velocity in the x-direction (normalized)
            v = y./sqrt(x.^2+y.^2); % velocity in the y-direction (normalized)
            titleStr = "A normalized vector field in the $r$-direction";
        else
            % Define the unit vector field radially outward from the origin
            u = x ./ r; % velocity in the x-direction (normalized)
            v = y ./ r; % velocity in the y-direction (normalized)
            w = z ./ r; % velocity in the z-direction (normalized)

            % Set NaN for points at the origin to avoid division by zero
            u(r == 0) = NaN;
            v(r == 0) = NaN;
            w(r == 0) = NaN;
            titleStr = "A normalized vector field in the $\rho$-direction";
        end
    case "eddies"
        if opts.Dim == "2D"
            u = cos(x+y)./sqrt((cos(x+y)).^2+(sin(y.*x)).^2);
            v = sin(y.*x)./sqrt((cos(x+y)).^2+(sin(y.*x)).^2);
        else
            r = sqrt((cos(x+y+z)).^2+(sin(y.*x)).^2+(sin(z.*x+y)).^2);
            u = cos(x+y+z)./r;
            v = sin(y.*x)./r;
            w = sin(z.*x+y)./r;
        end
        titleStr = "A normalized vector field in many directions";
    otherwise
        n = 6;
        dim = numel(opts.VectorField);
        U = cell([1 dim]);
        NumSteps = (2*n)/step+1;
        titleStr = "A vector field in " + opts.Coords + " coordinates";
        switch opts.Coords
            case "Cartesian"
                vec = -n:step:n;
                if opts.Dim == "2D"
                    [x,y] = meshgrid(vec,vec);
                else
                    [x,y,z] = meshgrid(vec,vec,vec);
                end
                for idx = 1:dim
                    U{idx} = AdjustForScalar(eval(opts.VectorField(idx)),size(x));
                end
                u = U{1};
                v = U{2};
                if dim == 3
                    w = U{3};
                end
            case "Polar"
                [r,theta] = meshgrid(0:step:n,linspace(0,2*pi,NumSteps));
                for idx = 1:dim
                    U{idx} = AdjustForScalar(eval(opts.VectorField(idx)),size(r));
                end
                [u,v] = pol2cart(U{2},U{1});
                [x,y] = pol2cart(theta,r);
            case "Cylindrical"
                [r,theta,z] = meshgrid(0:step:n,linspace(0,2*pi,NumSteps),-n:step:n);

                % Calculate the radial distance from the origin
                cIdx = ceil(r)+1;
                for idx = 1:dim
                    U{idx} = AdjustForScalar(eval(opts.VectorField(idx)),size(r));
                end
                [u,v,w] = pol2cart(U{2},U{1},U{3});
                [x,y,z] = pol2cart(theta,r,z);
            case "Spherical"
                [r,theta,phi] = meshgrid(0:step:n,linspace(0,2*pi,NumSteps),linspace(0,pi,NumSteps));

                % Calculate the radial distance from the origin
                cIdx = ceil(r)+1;
                for idx = 1:dim
                    U{idx} = AdjustForScalar(eval(opts.VectorField(idx)),size(r));
                end
                elev = pi/2-phi;
                [u,v,w] = sph2cart(U{2},pi/2-U{3},U{1});
                [x,y,z] = sph2cart(theta,elev,r);
        end
        xlim([-10 10])
        ylim([-6 6])
end

% Plot the vector field using quiver
if opts.Dim == "2D"
    quiver(x, y, u, v,"off")
else
    cmap = summer(max(cIdx,[],"all"));
    quiver3(0,0,0,nan,nan,nan,"off")
    hold on
    for col = 2:length(cmap)
        quiver3(x(cIdx==col), y(cIdx==col), z(cIdx==col), u(cIdx==col), v(cIdx==col), w(cIdx==col), 'off',Color=cmap(col,:));
    end
end
xlim([-6 6])
ylim([-6 6])
zlim([-6 6])
axis equal
title(titleStr,Interpreter="latex")
xlabel("X-axis")
ylabel("Y-axis")
if opts.Dim == "3D"
    zlabel("Z-axis")
end
grid on
end

function DefineCurve(C,opts)
arguments
    C
    opts.LineWidth (1,1) double {mustBePositive,mustBeInteger} = 2
    opts.ColorIdx (1,1) double {mustBePositive,mustBeInteger} = 2 
end
switch C
    case "circle"
        Alpha = linspace(0,2*pi,100);
        hold on
        PlotCycle("x","y",4*cos(Alpha(1:50)),4*sin(Alpha(1:50)),4*cos(Alpha(50:end)),4*sin(Alpha(50:end)), ...
            TitleStr="A circular path",FillRegion=false,ResetLimits=false,SeriesIndex=opts.ColorIdx,LineWidth=opts.LineWidth);
        hold off
        clear Alpha
    case "positive circular arc"
        Alpha = linspace(-pi/2,pi,100);
        hold on
        PlotCycle("x","y",4*cos(Alpha),4*sin(Alpha),FillRegion=false,ResetLimits=false, ...
            TitleStr="A positive circular arc path",SeriesIndex=opts.ColorIdx,LineWidth=opts.LineWidth);
        hold off
        clear Alpha
    case "negative circular arc"
        Alpha = linspace(0,-pi/2,100);
        hold on
        PlotCycle("x","y",4*cos(Alpha),4*sin(Alpha),FillRegion=false,ResetLimits=false, ...
            TitleStr="A negative circular arc path",SeriesIndex=opts.ColorIdx,LineWidth=opts.LineWidth);
        hold off
        clear Alpha
    case "clockwise rectangle"
        hold on
        PlotCycle("x","y",[0 5],[0 0],[5 5],[0 -4],[5 0],[-4 -4],[0 0],[-4 0],FillRegion=false, ...
            TitleStr="A clockwise rectangular path",ResetLimits=false,SeriesIndex=opts.ColorIdx,LineWidth=opts.LineWidth);
        hold off
    case "counterclockwise rectangle"
        hold on
        PlotCycle("x","y",[-5 -5],[2 -2],[-5 5],[-2 -2],[5 5],[-2 2],[5 -5],[2 2],FillRegion=false, ...
            TitleStr="A counterclockwise rectangular path",ResetLimits=false,SeriesIndex=opts.ColorIdx,LineWidth=opts.LineWidth);
        hold off
    case "sinusoid"
        Alpha = linspace(0,2*pi,100);
        hold on
        PlotCycle("x","y",Alpha,sin(Alpha),FillRegion=false,ResetLimits=false,SeriesIndex=opts.ColorIdx,LineWidth=opts.LineWidth, ...
            TitleStr="A sinusoidal path");
        hold off
    case "??"
        disp("Please select a curve.")
    otherwise
        error("Uexpected option for curve: " + C)
end
end

function CheckEx2(a,b,c,d,e)
arguments
    a (1,1) logical
    b (1,1) logical
    c (1,1) logical
    d (1,1) logical
    e (1,1) logical
end
syms x y z G
AllCorrect = 1;
if a == 0
    displayFormula(['"What is the curl of "' "(x-3)*e_y" '"?"'])
    AllCorrect = 0;
end
if b == 1
    displayFormula(['"What is the curl of "' "sin(x)*e_x-y^2*e_y" '"?"'])
    AllCorrect = 0;
end
if c == 1
    syms r
    displayFormula(['"What is the curl of "' "6/r^3*e_r" '"?"'])
    AllCorrect = 0;
end
if d == 1
    displayFormula(['"What is the curl of "' "2*e_x-3*e_y+e_z" '"?"'])
    AllCorrect = 0;
end
if e == 0
    displayFormula(['"What is the curl of "' "y*sin(x)*e_x-y*cos(x)*e_y" '"?"'])
    AllCorrect = 0;
end
if AllCorrect
    disp("You are correct.")
    syms r z
    displayFormula(['"a) curl(F) = "' "e_z"])
    displayFormula(['"b) "' "G == -cos(x) - y^3/3"])
    displayFormula(['"c) "' "G == -3/r^2"])
    displayFormula(['"d) "' "G == 2*x-3*y+z"])
    displayFormula(['"e) curl(F) = "' "(y-1)*sin(x)*e_z"])
else
    disp("Please correct your reasoning and try again.")
end

end

function CheckEx4(MyAns,prob)
arguments
    MyAns (1,1) double 
    prob (1,1) string {mustBeMember(prob,["a" "b" "d" "e"])}
end

switch prob
    case "a"
        CorrectAns = -20/3;
    case "b"
        CorrectAns = 26/3;
    case "d"
        CorrectAns = 0;
    case "e"
        CorrectAns = 3/2;
end
CorrectFlag = 0;
if MyAns == CorrectAns
    CorrectFlag = 1;
    disp("This answer is correct.")
end
if ~CorrectFlag
    disp("The value " + MyAns + " is not correct.")
    if round(MyAns,1) == round(CorrectAns,1)
        disp("Please enter a precise numerical answer.")
        ErrorPct = abs(1-MyAns/CorrectAns)*100;
        disp("Your answer is off by " + ErrorPct + "%.")
    end
    if -MyAns == CorrectAns
        disp("What is the direction of integration around C?")
    end
    if MyAns == -999
        disp("That is the default value.")
    end
    disp("Please try again.")
end
end

function cp = GenerateStar(opts)
arguments
    opts.Points (1,1) double {mustBeInteger,mustBePositive} = 5
end

cp = randi(5,[2 1]);
cp(:,11) = cp(:,1);
for side = 3:2:(opts.Points*2-1)
    cp(:,side) = [cos(2*pi/opts.Points) -sin(2*pi/opts.Points) ; sin(2*pi/opts.Points) cos(2*pi/opts.Points)]*cp(:,side-2);
end
for side = 2:2:(opts.Points*2)
    cp(:,side) = (cp(:,side-1)+cp(:,side+1))/(randi(6,1)+2);
end
end

function CheckEx3(CorrectSoln,TestSoln)
if CorrectSoln == TestSoln
    displayFormula(['"Yes, the solution is "' "TestSoln" '"."'])
elseif abs(CorrectSoln-TestSoln) < 0.1
    displayFormula('"Your solution is close, but appears to be rounded. Please enter an exact solution."')
    displayFormula(['"Remember, you can use sqrt(7) for "' "sqrt(7)" '" for example."'])
elseif abs(CorrectSoln) == abs(TestSoln)
    displayFormula('"Are you integrating in the correct direction?"')
elseif TestSoln == -999
    displayFormula('"This is the default value. Please solve the problem."')
else
    displayFormula(['"No, "' "TestSoln" '" is incorrect. Please try again."'])
    displayFormula('"Are there any symmetries you can use to simplify the calculation?"')
end
end
function CorrectSoln = SolutionExercise3(Field,Pts,Curve,opts)
arguments
    Field 
    Pts 
    Curve 
    opts.PrintSolution (1,1) logical = false
end
x1 = Pts(1);
x2 = Pts(2);
y1 = Pts(3);
y2 = Pts(4);
mx = x2-x1;
my = y2-y1;
syms t ds dt
switch Curve
    case "horizontal line"
        % Cx = x1+mx*t;
        % Cy = y1;
        CEqn = [x1+mx*t y1];
    case "vertical line"
        % Cx = x1;
        % Cy = y1+my*t;
        CEqn = [x1 y1+my*t];
    case "diagonal line"
        % Cx = x1+mx*t;
        % Cy = y1+my*t;
        CEqn = [x1+mx*t y1+my*t];
    otherwise
        error("Unexpected option for C: " + Curve)
end
Cx = CEqn(1);
Cy = CEqn(2);
        eqnStrX = "x(t) == Cx";
        eqnStrY = "y(t) = Cy";

dCx = diff(Cx,t);
dCy = diff(Cy,t);

syms x y e_x e_y
switch Field
    case "x"
        FEqn = [Cx 0];           
        FStr = "Cx*e_x";
    case "negative y"
        FStr = "-sign(Cy)*e_y";
        FEqn = [0 -sign(Cy)];
    case "radially outward"
        FEqn = [Cx/sqrt(Cx^2+Cy^2) Cy/sqrt(Cx^2+Cy^2)];
        FStr = "Cx/sqrt(Cx^2+Cy^2)*e_x + Cy/sqrt(Cx^2+Cy^2)*e_y";
    otherwise
        error("Unexpected field value: " + Field)
end
assume(t,"real")
ScalingFactor = diff(CEqn,t);
Integrand = FEqn*ScalingFactor';
CorrectSoln = int(Integrand,t,0,1);
if opts.PrintSolution
disp("The curve is a straight " + Curve + ".")
displayFormula(['"C can be parameterized as "' "s(t)" '" = ("' "x(t)" '","' "y(t)" '") with "' eqnStrX '" and "' eqnStrY '" for "' "0<=t<=1" '"."'])
displayFormula(['"This means that "' "ds/dt" '" = ("' "dCx" '","' "dCy" '")."'])
displayFormula(['"Note that in this case, the field can be parameterized as "' FStr '"."'])
displayFormula(['"So the problem becomes:"'; "int(Integrand,t,0,1) == CorrectSoln"])
end
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[text:image:12a9]
%   data: {"align":"baseline","height":293,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAjAAAAGkCAIAAACgjIjwAAA5A0lEQVR42u2df0xcZb7\/STZmwx\/X\/cOrMYbktn+oKVYIod+1nfBtYb03xNCt6XdZrWtDiGm4ICHaiFZaEbaYptnVu5Rd7N2bBvaKNlzHxexsDCGkU6LtBnRd0b1bWUhTQrykKdKGNN5qhcz3w5z17HFmGIaZOec8z3Ne75DmzJmH6eEz5zyvz6\/znIIYQgghpIAKMAFCCCGAhBBCCAEkhBBCAAkhhBACSAghhAASQgghBJCU1djY2OXLl5P3X716NRqNYh\/OBM4HBJBQfvTxxx\/v27fvjjvueOqppw7GVVNTU19fb7376aefvv766\/bgw4cPFxYWfvXVV9bL06dP\/\/GPf8z6v75+\/frPf\/7z9GN+8YtfOKe81+J6++23rT19fX2yPTIy8utf\/3pmZibNTpTfMyGlcjwfLH3++ee9vb3yUe+8885aA06ePCmngXzFaX5ldnb2N7\/5jYz83e9+l2ZnymEIASTf9Oabb1ZUVDj3NDc3WxsHDhxw7hcHuby83LnHnrA2qqNHj8rEd9ddd6UZI3OEc8CLL75obci8I7OPbDQ0NGzatGnnzp3yJ9jDUu5E+T0T1lLW54Mt+eLm5+dlo6WlZXR0NOHdr7\/+urS0VAgk201NTe+\/\/37KX1lZWZE\/ZGlpSbZlQ3yUlDtTDkMIIPkpmcEPHTpkbVsX54kTJyyX+aWXXnKOHBwcFMc5IYI5d+5cdv\/vu+++mwZIV65cEdfVHnDjxo2HH37Y2pYQTaYe2Th16lTyL6bcifJ7JqSJaLM+H0QSYP3gBz+w3ZEf\/ehHycgU\/NhnY11dXcpfEW5VV1f\/9a9\/lW3Z8+yzz6bcmXIYQgDJT913333Dw8OyMTIyYuW4xHOUf48dO5aQNhH\/9\/Dhw2+\/\/XZvb6+1Z3x8XPa4AaSTJ09ev37dOeD+++\/fu3ev+MISXVnHKeyR6U8mqYsXLzqBlLwT5fdMiMVTo2JkGe+MY3I5H0Svv\/76vn37rG35Er\/3ve8l\/6c1NTXWtpyHcsDpf0VOoXvvvTchc5u8M+UwhACS1\/r888+\/853vyOz\/yiuvbNmyxfmWXOdXr1517rn77rutJImQSXBiBSvJbuxnn33Wu4ac13waIP3+97+XD0kA0uXLl4uKiuRobW9dyGSV2eUY7OpFyp0ov2dCZ2enxK8WIX7yk5\/Y+3M5HyxnQoIe+3i++93vJnyUxGril1jb8uv\/8A\/\/kOZX5AR76qmnrOxump0phyEEkHyQOLmhUMieDpxvSThi9y+IJDTZvn27tb1\/\/\/7BwUFr2\/ZY8xUhCU4ESJbfag8QV725ufnKlSsycdxxxx0JGSRxk3\/84x8nu9vJO1HuZ8Ls7Kz9vbzwwgsWmWxlfT5YeJNTy9r+85\/\/XFhYmDzm+PHjMkyCoWeffVYOY91fkeNJ7p1J3plyGEIAyVM1NTXZqfO5uTnnW+LqOqeht99+WxxJa\/vee+8VX9XixA9\/+MOEz1xaWnpnDVnl6PRAEu\/b6vJqaGiQ+UU2bty48WZc1gDBksRqH330ke0aCx1LS0tlI+VOlN8zQQhkM2Dnzp3OKCeX88E6xwR+1vbIyMh9992X8lAlXBOvRb5fCd1S\/oo4T3ZPoARSd955Z8qdKYchBJB80\/3332+FIylnKHE57Zdy\/b\/22muy8f777z\/00EM2G2wAOOeLtSYg540sCUASn9fqlbI1OjpqDxiMy3lsY2NjdofFiy++aPWDpdyJ8nsmSFDyyiuvWF+0fEECIaevkPX5YP26\/Y1LlGZ\/ffa58fXXXz\/88MPybyzegiH7U\/6KnKg2XQ4fPvz9738\/5c6UwxACSD5IppijR48WFBRIRCLzePKABAaIn3vgwAGZROrr62UWsHb+9re\/TcjYZChxZmVmkQDohRdesNqcysvLnX23slP8Xxlw7NgxmYBk1pMJaHh4eHZ2VmbDP\/zhDzJGNj6KSz7K9rVT7kR5PBOEIvLVyHchABAjS2xhV5iyPh9sHTp06OTJk\/LFVVdX27iyzw05Daz9MkaOdq1fkXNV3JHx8fG\/\/OUvghmrlJi8M+UwhACSivrqq6+eeOIJ5x6ZDm7cuJHgOyeUu12VTBwyD1oOsiUJ12RCSRiWcidy40yQDWc2Ly\/nw6effirfsvNjEw5G3k1ooUz5K3IaRKNRq1Ewzc6UwxACSMpJoo00vbDz8\/MZ3p6CzD4TOB8QQEJe6NixYwlRke0jHz161BmsoGCeCZwPCCAh75SyEiM7mX04EzgfEEBCCCGEABJCCCGAhBBCCAEkhBBCAAkhhBACSAghhJD2QLKe0YAQQggg+ane3t6EB0IjhBACSJ7q2rVrzz\/\/fFlZGUBCCCGA5Kc6Ojp+9rOfDQ8PZwekS5cu9ff3d8bVH9fZs2c5GxDK8JLhekEA6e+yVg4eGxtLA6T9+\/ffk6TbbrutsLDwlltukX9vi+vWW2+V7YKCAtkpL+9B+dP+oqKJwkLsoK82b94sF8Xq1XHX5oJdtQW1T6\/+7Kq9pfT\/yvUi105RUZHuf+PQrbceuvPOQFyP3zz1ESC5ovRAki\/A+VLcOrmuKisrZSOlAyhOX319\/aZNm+zHwKBcdfbsRKqHZAdNCaeiLpILoeD2olUC\/epcwX\/NJv7IzidflgFyycjlo++3I0CKpZoTOA8BkitAkqtFOCSXTSZ5BhksI4VMTKMAKbBAsi6ZVRQlcygZS7VPa+3GASSA5B2QLMBs6GqRX5Hxuvt9AImJINsv7exqYNQxuD6NnFjaVaupGweQAJJHQFq9tAoKsivAym8Jk5hMc5zbPrv7bszQ09Ojy6GuZraFRpmjKClU0u7bmdiyBSABJNeBVFRUlGGaLn3igjgpFyDFKisxg040Kt6eDY3sHx2ZJIEdQAJIrv9t2cZGCUwidweQgvFdnc2VRpoyCSABJA+0efPmvHwOTAJIgaBRdpm6NZikUz0JIAEkvazf399fycQKkAymkShlb3d2P\/EeB2367gASQNLO+nJ10QsOkIzUpk2bNtZTlyGTbi\/SY0EHgASQtLO+1eDQH4wTFyAFR5neb5QVk\/TIdQMkgKSj9SkmASTDlIe2uvQ\/T76sQa4bIAEkTa1PMQkgGSNxrfJcOkr5U7xd9WISQAJI+lqfxB1AMkOrybonX3aXRlok7gASQNLX+iTuAJIBcj1Zp1HiDiABJK2tT8cdQNJdq8m6vHfWpem4K96ubl4BIAEkra1vddzxjDKApKnEnVp9uJE3NHIk7gASQAJILs20LL0KkDT9TuK3wXpJI+tH2eXAARJAMsD6dDcAJB3lUS+DRt0NAAkgGWB9q7uBCQ4gaRYeedbLkKq7QcUgCSABJDOsXx8X0xxA0ik88qyXQZf1hAASQDLD+gRJAEkjedrqrVELOEACSMZYnyAJIOkiVxZRNSBIAkgAyRjrc58sQCI80jtIAkgAySTrEyQBJMKjjd4nq1CQBJAAkknWp5IEkAiPNA6SABJAMsz6BEkASWX53FyneCUJIAEkw6xPkASQCI90vScJIAEk86zPwg0ASd3wyJelGTJYuEGJIAkgASTzrM\/qdgBJyW\/Ap5XrNFrdDiABpHU1Nzc3Ojo6NTW11oBLly7JgAsXLqhjfZYAB0iqaXVhbwXDI6WWAAdIACm9IpFIKBRqbW2tqqrq7u5OHtDX12cNqK6uPnLkiCLWFxrxgHOApNYVrmx4pM4DzgESQEqj5eXlsrKymZkZ2V5cXCwtLU247XRlZaW4uHh6elq2l5aWZDtlnOS99a3WBoIkgKRQeOTxc482+tMx6H+QBJAAUhpFo1EJjOyXLS0tAwMDCUDasmXL3NycbN+8eXPr1q2Tk5OKWL+\/v5\/+b4CkUHj0q3NKAykeJPnswwEkgJRGQ0NDTU1N9su2trb29vaEMYODg7t37+7u7n7kkUe6urrWsr6tnp4eL4MkpkKA5LtWu70VD48UuUnWaCDJ1OecCQHShhUOh5ubm+2XR+JKGNPa2iooeuONNxoaGiQi+eKLL9RxB+R4\/E+LA6TAS7mbYdPcJFtQ4GeQRIQEkNIoEok0NjY6I6SOjg7ngDNnzjz44IPLy8s2AH75y1+qY336vwGSAoY\/q3o7g\/On9mk\/E90ACSCl0fj4eEVFhf1S4CSIcg546623nDk9wdVzzz2nlPXp\/wZI\/krpbm\/V+r8BEkBKo5WVFQHS2NiYbE9PT5eUlCwsLMj25OTk\/Py8bFy4cEF2Xrx4MRbvsqupqRFEKWX9\/v5++r8Bkp8XthbtDN9ubfBtoROABJDWDZJCoVBdXV15efnw8LDt9IXDYWt7cHBQ3rIGHDt2TDXr85AkgOSjtGln+Hb\/t28+HEACSMZbn9YGgOSXFHr0kRbrfwMkgGS89WltAEh+nXg6tTOo0NoAkABSEKxPawNA8iU0l5ldSyD51doAkABSEKxPawNA8uGS1q6dwfdVGwASQAqC9Vm1ASB57wPp187g+6oNAAkgBcT6QX9qH0Dy\/HzT6fajNbJ2XrenAiSAFBDrB\/2BFADJ4+tZ03YGfx9IAZAAUkCsL76ez+t0AaTASPt8nV8PpABIACk41g\/0DUkAyUNpeftRyhuSPG5tAEgAKTjWD\/QNSQDJw9PMhHydLzckASSAFCjrB\/eGJIDkYSBuQr7OlxuSABJACpT1Ozs7A\/oYWYDklVbzdfrefuTvDUkACSAFyvrBvSEJIHmi1XaG4u3m0MjjrB1AAkhBs35As3YAyaMZtV7v24\/8zdoBJIAUNOsHNGsHkDyRafk6j7N2AAkgBc36Ac3aAST3ZcjtRz4uIwSQAFIArR\/ErB1A8mI6NS5f53HWDiABpABaP4iLfwMkD65hrZf3ViFrB5AAUgCtH8SsHUBy38sxM1\/nZdYOIAGkYFo\/cFk7gOT6XGpovs7LrB1AAkjBtH7gsnYAye0L2OB8nWdZO4AEkIJp\/cBl7QCSy\/6Nyfk6z7J2AAkgBdb6wcraASR3J1Kj83WeZe0AEkAKrPWDlbUDSK5evcbn67zJ2gEkgBRY6wcraweQ3PRszM\/XeZO1A0gAaV3Nzc2Njo5OTU2tNWBxcfHMmTPj4+PaWT9AWTuA5OIsGoB8nTdZO4AEkNIrEomEQqHW1taqqqru7u7kAWNjYzt27HjmmWdqa2sff\/zxlZUVjawfoHXtAJJrMnP9Ol+ydgAJIKXR8vJyWVnZzMyMFQaVlpZeunQpYYDQaGJiwnpZU1MzPDyskfUDlLUDSO7IwOdN+Pg0CoAEkNIoGo1KYGS\/bGlpGRgYcA44c+aMBEaZWN9WT0+PUn9jULJ2AMm9fF3t0wECkqtZO6OBJFOfcyYESBvW0NBQU1OT\/bKtra29vd054K233jp48KDsLCkpkVjq1KlT2rkDnXEBJES+zv+sHRESQEqjcDjc3NxsvzwSl3PA8ePHi4uLBwcHZXtqamrbtm3vvfeeXtaXSysQWTuA5FK+ThQoGrmatQNIACmNIpFIY2OjM0Lq6OhwDjh9+vRDDz3kHCDSzvqByNoBJJfydQFp+Hb+dAy65cMBJICURuPj4xUVFfZLgZMgyjlgZGTECaTkEEoL6wciaweQXMrXdQwGDkjuZe0AEkBKo5WVFQHS2NiYbE9PT5eUlCwsLMj25OTk\/Py8bNy8efOBBx6IRqOxeBvezp07U96NpLj1A5G1A0huXLQBzNdZP7tqXfHhABJAWjdICoVCdXV15eXldkt3fX19OBy2tj\/44IPKyspHH31UBvT29upo\/UuXLsnEYnjWDiDlWwFaoCFV1s6VJRsAEkDC+rF4Ganf7CsBILlwzgRlgYZUzd+u+HAACSBh\/fh0fdbwhVYBUt6v2MDm674pI+XfhwNIAAnrx4KwZANAyqsCna9zL2sHkAAS1rczMCaXkQBSnmfO+uDm69xbsgEgASSsb8nwhVYBUn4v14A8AMnj5m+ABJCwviXDs3YAKX8K3IKqni3ZAJAAEta3ZXLWDiDlc9qsD3oByaWsHUACSFjflslLNgCk\/CmIC6p6k7UDSAAJ6zsmbXOXbABIebxWA97w\/e2sXT59OIAEkLC+LZOXbABIeRIN3y42fwMkgIT1nTJ2yQaAlL8zJOgN30lLNiQ8SBogASSsnzf\/18wlGwBSvi5U8nXulZEAEkDC+k4Z2\/wNkPLkr5CvS\/x58uW8+XAACSBh\/eScjIFlJICUnwmznnydi83fAAkgYf0Emdn8DZDyIRq+3c3aASSAhPWTpm4Tm78BUs6ymjDBj4vN3wAJIGH9lPOOaVk7gJSzKCClaf7Ojw8HkAAS1k9WZWWlaVk7gJSPs4ICkrvP6wNIAAnrp8zamdb8DZByv0TJ17n9vD6ABJCwfsqsnWllJIBEvk795m+ABJCw\/lr5GaPKSAAp16mShm\/3m78BEkDC+illWvM3QMpNNHx70fwNkAAS1l9jAjer+Rsg5Xh9UkDyoPkbIAEkrJ9SpjV\/A6QcRAHJo+ZvgASQ1tXc3Nzo6OjU1FT6YZOTk1euXDEGSDHDVv4GSLmdCRSQMmz+BkgAyUVFIpFQKNTa2lpVVdXd3b3WsJmZma1btwq3TAKSUSt\/A6Qc83UUkDwoIwEkgJRGy8vLZWVlAhvZXlxcLC0tTfngk5s3b+7Zs0fmbsOAZFTzN0AiX+dJGSknHw4gAaQ0ikajEhjZL1taWgYGBpKHHT9+\/MSJEw0NDWmAZKunp0evXI0hZSSAlP0kWS\/zLLDxovnbaCDJ1OecCQHShjU0NNTU1GS\/bGtra29vTxgzMTGxd+9e2UgPJE3PIXOavwFStlpt+O4YBDZeZO2IkABSGoXD4ebmZvvlkbicA5aWlqqrq608npFAMmcNIYCU9ZVJw\/eGfnbVZu\/DASSAlEaRSKSxsdEZIXV0dDgHCJ8OHjw4FldtbW13d3fKZjx9gWROGQkgZSUKSFk0f2fvwwEkgJRG4+PjFRUV9kuBkyDKOUAI1PCNduzYsXfv3r6+PpOAFDOmjASQspwhWTHIwzISQAJIabSysiJAkuhHtqenp0tKShYWFmLxW47m5+cTBhuZsovFy0gyKwGkYIoVgzwtIwEkgLRukBQKherq6srLy4eHh223MRwOBwRIhqwhBJCyy9dRQPJyDSGABJCw\/vrfjQFrCAGk7IBEAcnLNYQAEkDC+uvKhAfIAqSsvncKSFmvIZTyJnqABJCwfh48Ze2bvwFSVpExBSRPy0gACSBh\/XVlQvM3QCJfp\/4DZAESQML6GWZv9C4jAaQNz42sGOR58zdAAkhYPxNpv4YQQNqgWDHIh6wdQAJIWD+z+VzzNYQA0kYvSBq+cwbShn04gASQsH4m0r6MBJA2IgpI\/qwhBJAAEtbPUHqXkQDSxiZGVgzyo4wEkAAS1s9QepeRANJGxIpB\/pSRABJAwvoZT+k6ryEEkDZ0NVJA8mUNIYAEkLB+hrp06VKW958DJK1EAcm3MhJAAkhYP3NpXEYCSBuYFSkg+VRGAkgACetnLo0fRQGQNpSvo4DkSxkJIAEkrL+hrJ2uZSSAlHm+jgKSX2UkgASQsP5G3Wcts3YAKXMgUUDy61EUAAkgYf0NSddHUQCkjL9fCki+PYoCIAEkrL9RD1rLNYQAUsYRMAUk38pIAAkgYf0NSdcyEkAiX+dfGSlTHw4gASSsn0VWR78yEkDKaD6sB0h+Nn8DJICE9bMAkn5lJICUgVZXDKKA5MZPhq1AAAkgYf2Nz+0aPooCIGVyEdLw7e+jKAASQML6G5WWZSSAtJ4oIPn\/RHOABJCwfnZZO83KSABp\/cmQZ5b7XUYCSABpXc3NzY2Ojk5NTa01YGZmRgZ8+OGHwQGSfo+iAEjriUdO+N\/8DZAAUnpFIpFQKNTa2lpVVdXd3Z08oKurS96SAXv27Hnssce+\/PLLIABJvzISQFr3CqSA5HsZCSABpDRaXl4uKyuTAEi2FxcXS0tLE+64vnDhwtatW69du2a93L17dzgcDgKQ9CsjAaS0ooCkxKMoABJASqNoNCrRj\/2ypaVlYGDAOWB+fv78+fPOASdOnAgCkGLalZEA0jozIY+cUKCMBJAAUhoNDQ01NTXZL9va2trb29caPDs7K9GSxEwprW+rp6fHjFNKszISQEorCkhKlJGMBpJMfc6ZECBtWOFwuLm52X55JK6UIy9fviwRw6uvvqqpO5DVDK9VGQkgpb\/8KCCp8CgKIiSAlEaRSKSxsdEZIXV0dCQP++STT3bs2NHX16ev9bOQZmUkgLS2KCCpUkYCSAApjcbHxysqKuyXAidBVMKY8+fPb9u2bWRkRGvrZyedykgAKd00SAFJjTISQAJIabSysiJAGhsbk+3p6emSkpKFhQXZnpycnJ+fj8VvUSorK4tGoze\/0fLycnCApFMZCSCtLQpIqpSRABJAWjdICoVCdXV15eXlw8PDtkdptXcfP378nm\/rpz\/9aXCAJJeWNlk7gJTm2qOApEgZCSABJKyftS5duiRTGUDSWhSQFCojASSAhPVzkTZlJIC05hxIAUmZMhJAAkhYPxd1dnbKjAaQ9BUFJIXKSAAJIGH93OZ5TcpIAGmNr48CkkJlJIAEkLB+LrLKSAlL\/AEkXUQBSa0yEkACSFg\/R+lRRgJIqSdACkgqlZEAEkDC+jlKjzISQEolCkhqlZEAEkDC+jlP9TqUkQBSynwdBSSlykgACSBh\/Tx8eQUFqmftAFJKIFFA8qmMlNqHA0gACevnLg3KSAApxexHAcm3MlLqO8oBEkDC+rmrs7NT9UdRAKRUcS0FJLXKSAAJIGH93KXBoygAUnK+jgKSamUkgASQsH6+3G2ls3YAKRlIFJBUKyMBJICE9fMi1ctIAClx6qOApF4ZCSABJKyfL49b6TISQEqKaCkgKVdGAkgACevnRaqXkQBSQr6ueDtI8L2MlHhHOUACSFg\/XxIgqZu1A0gOdXZ2UkBSsYwEkAAS1s+XKisr1X2iOUD69jdFAUmRMtK3FiYGSAAJ6+cxEaRuGQkgOS82CkhqlpEAEkDC+vmS0mUkgOTwGyggKVpGAkgACevnUeqWkQDSN6KApG4ZCSABJKyfR6lbRgJIju+IApKiZSSABJCwfn7TQYqWkQCSfaVRQFK2jASQABLWz6PULSMBpG88BvJ16paRABJAyl1zc3Ojo6NTU1MAKabsGkIA6W8zXj1AUveJ5gAJIOWoSCQSCoVaW1urqqq6u7sBkqJlJIAU1+ozyykgqfZjL0wMkABSLlpeXi4rK5uZmZHtxcXF0tLSb93mFkggyaWlYhkJIFmXGY+cULmMBJAAUi6KRqMSGNkvW1paBgYGAg4kRctIAIkCksJlpL\/5cAAJIOWioaGhpqYm+2VbW1t7e3tK6wdKhYWFRUVFSh3S\/qKic3dtvu1fu4L8U\/hPd8tPwI2g4s\/\/+9dbbrlFNv7rn+4+dOedAZklAFL+FQ6Hm5ub7ZdH4gp4hKRoGens2bMsT3B7UX8wHHAtU6kdg\/27aomQAFL2ikQijY2Nzgipo6MDIKlYRgJI8eI5U7+yPhxAAki5anx8vKKiwn4pcBJEASQVy0gA6cmXE5++g5TR6npOxdsBEkDKSSsrKwKksbEx2Z6eni4pKVlYWABIMQXvRgJIu2oBkso+3GpCFSABpNyDpFAoVFdXV15ePjw8rKn18y6Z+9QqIwGk24vUfXwiit8i1n97EUACSFjflflfrTISQKKApHxSoV++I4AEkLC+GykItcpIAQcSBSTl1b96mxhAAkhY3zWPT6EcUcCBtKtW3afLo298OIAEkLC+W+qMCyBRQEKZnqSbNgEkgIT13UKAQmWkgAOJApIWQVJl5aVgBLIACev7kIJQqIwUZCBRQNJF9fX9wVhxESBhfR+kUBkpyECigKQPkDrVfL4lQML6BkihMlKQgUQBSR8g1dvPRgJIAAkg5Z0CqpSRggwkCkhaASkI4SxAwvo+SKEyUmCBRAFJKyCdra+vDEAZCSBhfX+kShkpsEDaVcsjJzQC0qXOzk0BKCMBJKzvj1QpIwUWSLcXSZzKVK8LkGL9\/cotTAyQsL4xUqWMFFggUUDSEEjGl5EAEtb3R6qUkYIJJApIGgJJxedbAiSsb4yUSEEEE0gUkDQEkorPtwRIWN8YKVFGCiaQKCBpCKSYgs+3BEhY3xgpkYIIJpAoIOkJJLUWJgZIWN8kKZGCCCCQKCBpCyTjy0gACev7Kf9TEAEEEgUkbYFkfBkJIGF9P+V\/CiKAQKKApC2QYqaXkQAS1vcZBz6nIAIIJApIOgPJ7DISQML6fsr\/FETQgEQBSXMgmV1GAkhY32f5nIIIGpAoIGkOJLPLSAAJ6\/ssn1MQQQMSBSTNgRQzuowEkLC+z5JLy0+PL2hAooCkP5AMLiMBpOw1Nzc3Ojo6NTWVZszMzIyM+fDDDwHSWhKH3c9ZMlBAooBkBJAMLiMBpCwViURCoVBra2tVVVV3d3fKMV1dXfKujNmzZ89jjz325ZdfAqSU8jMFESggUUAyAkgGl5EAUjZaXl4uKyuT6Ee2FxcXS0tLk\/PyFy5c2Lp167Vr16yXu3fvDofDACmlOjs7ffPcAwUkCkhGAClmbhkJIGWjaDQqoY\/9sqWlZWBgIGHM\/Pz8+fPnnWNOnDiRbH1bPT09gb3c\/CwjBQdIHYMUkIwBkkllJJn6nDMhQNqwhoaGmpqa7JdtbW3t7e1pxs\/Ozkq0JDETEVJKWWUkfzy+4ACJApJBQPK5FYgISSmFw+Hm5mb75ZG41hp8+fJlia9fffVVHa3vmXxLQQQHSBSQDAKSz61AAMl3dXV1lcVVUVERiUQaGxudEVJHR0fK3\/rkk0927NjR19enqfU9U2dnpz+NQ8EBUkEBBSRjgBQztIwEkDLVxYsXz8c1MTExPj4uWLLfEjgJopJ\/RQZv27ZtZGREX+t7Jt8ahwICpCdfpoBkGJCMvBsJIGWjlZUVAdLY2JhsT09Pl5SULCwsWG9NTk7Oz8\/H4ncpSTgVjUZvfqPl5WWAlEYCJB88voAAqfZpCkiGAcnIMhJAylISJIVCobq6uvLy8uHhYceZU2+1dx8\/fvyeb+unP\/0pQEqjyspKHzy+gACpeDsFJMOAZJWRDEvDAiSsr4pkxvShjBQQIFFAMg5IMRPLSAAJ66sif8pIQQASDd+GAsm3ViCABJCCIB88viAAaVctQDISSOatIQSQsL5aQPK6jBQEIN1eRAHJSCCtzo9+3VEOkACS8fJhGeMgAImGb3OB5E8rEEACSEGQDykI44FEAcloIPnTCgSQAFJA5HUZyXggsWKQ0UAyrIwEkLC+WvL6\/nPjgcQjJ4wGUsys5m+AhPXVktdlJOOBRAHJdCDV19cbU0YCSFhfLXmdgjAbSBSQAgAkk55oDpCwvnLyNAVhNpAoIAUASCaVkQAS1ldOnpaRzAYSBaQAAClmUBkJIGF95eTpMsZmA4kCUjCAZMyjKAAS1ldOni5jbDCQKCAFBkjGlJEAEtZXUd6lIAwGEgWkwADJmDISQML6Ksq7ZYwNBhKPnAgMkGKmlJEAEtZXUd55fKYC6cmXzXucKEBK78MZkKEFSFhfUXn0RHNTgcQzywMGJDOeaA6QsL6i8mgZY1OBxCMnAgYkqxVI96wdQML6isqjxiFTgUTDd8CAZPlwunshAAnrKyqPykhGAomG70ACyYBHUQAkrK+uvGgcMhJINHwHEkgGNH8DJKyvrry4\/9xIILFiUCCBFNO\/+RsgYX115UUZyUggUUAKKpB0X0MIIGWvubm50dHRqampdUdOTk5euXIFIG1UVuMQQKKABJAyBJLuawgBpCwViURCoVBra2tVVVV3d3eakTMzM1u3bhV0AaQs5HoKwjwgUUAKMJB0LyMBpGy0vLxcVlYmpJHtxcXF0tLStVL2N2\/e3LNnj8yqACk7uX7\/uXlAooAUYCDFNC8jAaRsFI1GJTCyX7a0tAwMDKQcefz48RMnTjQ0NACk7OS6x2cYkJ58mQJSwIGk9RpCACkbDQ0NNTU12S\/b2tra29uTh01MTOzdu1c20gDJVk9PD9ddSrm7hpBhQGLFoMADSbs1hGTqc86EAGnDCofDzc3N9ssjcSWMWVpaqq6utpInREi5yN01hAwDEisGBR5Iq5OmtmsIAaRM1dXVVRZXRUVFJBJpbGx0RkgdHR0J4wVRBw8eHIurtra2u7s7uR8PIGWIDBcbhwwDEvk6gOTZOpAAyUddvHjxfFwTExPj4+OCJfstgZMgKmG8EKjhG+3YsWPv3r19fX0AKQu5W0YyCUg0fAOkuPRdQwggZaOVlRUBkoQ+sj09PV1SUrKwsGC9NTk5OT8\/nzCelF2OcrFxyCQg0fANkDzw4QCSgpIgKRQK1dXVlZeXDw8PO86c+nA4DJDyKxfvPzcJSDR8AyQPfDiAZKoAUubUcMvjMwZIvzpHAQkgeeHDASSAFHC5+PAxY4BEAQkgeePDASSAhNx6+JgxQCreTgEJICX4cNqlcAES1tdDbjUOGQMk8nUAKcmH066MBJCwvh5yq3HIDCCRrwNInvlwAAkgIbc8PjOARMM3QPLMhwNIAAnFXGocMgNINHwDJM98OIAEkFDMpcYhA4BEwzdA8tKHA0gACcVcav42AEgUkACSlz4cQAJIyE5B5NnjMwBINHwDpLQ+nEbpXICE9XVS\/lf+NgBI5OsAUlofTiN\/BSBhfZ2U\/8Yh3YFEvg4gpZVezd8ACetrpjw3DukOJBq+AZLHPhxAAkjIVmdnZz5jAt2BRMM3QPLYhwNIAAm55fFpDaQnX6aABJC89uEAEkBCbnl8WgNpVy0FJICUyTmuS9YOIGF9HS\/P+rw1f2sNpNuLdHwIG\/IYSCIBkhanCkDC+vopn83fWgOJfB1A8t6HA0gACTmVzzKSvkCi4Rsg+eLDASSAhBKUtzKSvkCi4Rsg+eLDASSAhBKUt9v99AWShs8DRX4BKaZJ8zdAwvpaKm8en6ZAIl8HkPzy4QASQEJueXyaAol8HUDyy4cDSAAJJSs\/t\/tpCiQWaABIfvlwAElNzc3NjY6OTk1NpRmzuLh45syZ8fFxgJR35cfj0xFILNAAkHz04QCSgopEIqFQqLW1taqqqru7O+WYsbGxHTt2PPPMM7W1tY8\/\/vjKygpAyq\/y4PHpCCQWaABIPvpwAEk1LS8vl5WVzczMWDFQaWlpcv5ExgiNJiYmrJc1NTXDw8MAKb\/KwxOadQQS+TqA5KMPB5BUUzQalcDIftnS0jIwMJAw5syZMxIY6W59xZWHRbq0A1LHIPk6gOSnDweQVNPQ0FBTU5P9sq2trb29PWHMW2+9dfDgQdlfUlIi4dSpU6dSWt9WT08P110250dBQU4en3ZAqn2afB1A8tOHy7dk6nPOhABpwwqHw83NzfbLI3EljDl+\/HhxcfHg4KBsT01Nbdu27b333iNCcuFSzW2RLu2AxIKqAMlfH44ISQV1dXWVxVVRURGJRBobG50RUkdHR8L406dPP\/TQQ84xIoCUd+W6SJd2QCJfB5D89eEAkgq6ePHi+bgmJibGx8cFS\/ZbAidBVML4kZERJ5BSRlEAKXddunQpJ49PLyCxQANAyocPp2yvHUDKRisrKwKksbEx2Z6eni4pKVlYWLDempycnJ+fl42bN28+8MAD0Wg0Fu\/E27lzZ\/LdSAApL5IIKXuPTy8gFW9ngQaA5LMPB5AUlNAlFArV1dWVl5c7+7nFgQ2Hw9b2Bx98IHPlo48+KmN6e3t1tL4WyilrpxeQyNcBJN99OIBkqgCS\/x6fRkAiXweQVPDhABJAQm55fBoBiXwdQFLBhwNIAAm55fFpBCTydQBJBR8OIAEktK7Hl2XjkC5AIl8HkBTx4QASQEKZeHzZZLR0ARL5OoCUbx9OwawdQML6hihLj08XIJGvA0gu+HCqZe0AEtY3RFl6fFoAiXwdQHIBSApm7QAS1jdH2Xh8WgCJfB1AcuEEUDBrB5CwvjnKxuPTAkjk6wCSOx6JauvaASSsb46y8fjUBxL5OuQakFRb1w4gYX3DrtwNenzqA4nnTSDXgCQ+nFLPkAVIWN8obdjjUxxIPB8WuQmkmGLPkAVIWN80bczjUxxIu2rJ1yFXgZT9TeUACSChTDy+DUziigPp9iKZL\/hOAVLMzTZLdbJ2AAnrm6aNeXwqA+nJl9VckhkZBqSN+XAACSAhtzw+lYG0q5bbj5AHQFInaweQsL6Bknk809hCZSAVFJCvQx4AKaZM1g4gYX0DtQGPT1kgcfsR8hBIG\/DhABJAQll4fBnlu5QFEssFIQ+BZPlwvkfkAAnrm6lMlxFSFkjcfoQ8BFJMjcW\/ARLWN1OZLiOkJpBqnyZfhzwGkgrLCAEkrG+sMmpmVRNILBeEPAdSTIHWBoAEkEwOktb3+BQEErcfIZ+A1N\/f729oDpAAksla3+NTEEjcfoR8ApLvNyQBJIBkstZvZlUQSLQzIJ+AFMu8PRUgqaa5ubnR0dGpqan0HoeMuXDhAkDyReu3NqgGJG4\/Qr4Cyd\/WBoCUpSKRSCgUam1traqq6u7uTjmmr6\/PGlNdXX3kyBGA5NO1XJ9uilcNSLQzIF+BFPO1tQEgZaPl5eWysrKZmRnZXlxcLC0tTb6hbGVlpbi4eHp6WraXlpZkOzlOAkjeBEnpPD6lgEQ7A1IASD62NgCkbBSNRiUwsl+2tLQMDAwkA2nLli1zc3OyffPmza1bt05OTiZb31ZPTw\/XnXse35ppcaWAxOoMSAEgebxqg0x9zpkQIG1YQ0NDTU1N9su2trb29vbkYYODg7t37+7u7n7kkUe6urp0dAfMULq0uDpA+tU52hmQCkCK\/4f1vqzaAJCyUTgcbm5utl8eiSt5WGtrq6DojTfeaGhokC\/4iy++AEi+SHy9NdPi6gCJh8MiZYDkV\/83QMpUEuKUxVVRURGJRBobG50RUkdHR8L4M2fOPPjgg8vLy7bH8ctf\/hIg+aU1+7\/VARIPm0DKACnmU2sDQMpUFy9ePB\/XxMTE+Pi4YMl+S+AkiEoY\/9ZbbznTekKs5557DiD5GCSJx5fiAlMESHR7I8WA5Ev\/N0DKRisrKwKksbEx2Z6eni4pKVlYWLDempycnJ+fl40LFy7IfsFYLN5lV1NTI4gCSL5e1Kn6vxUBEt3eSDEgpUt0AyTVJEFSKBSqq6srLy8fHh52znrhcNjaHhwclHetMceOHdPR+uYFSSoCiW5vpB6QYn48tQ8g+SmA5H2QlNg7pAKQircTHiEFgbRmohsgASTkSpDkO5AIj5CqQIp5fpMsQAJIwVLiTbK+A4mbYZHCQPI4SAJIACnYQZK\/QOoY9P0ZnQggqRMkASSAFMCru\/7vQYm\/QCI8QsoDyWq38+YmOYAEkIIdJPkIJMIjpAOQvAySABJACqL+XknyEUiER0gTIHlWSQJIACnYQZJfQKK5DukDJM+CJIAEkAJ7jccXbvALSNx7hLQCkjdBEkACSIEOki719\/sAJMIjpBuQYp4s3ACQAFJw1dnZWS9On\/dAYuU6pCGQPFjdDiABpEAHST4AieceIT2BFHN\/CXCABJCCzaT+\/rO3F3nZ6s1jYZG+QIq5\/DBZgASQgi1x+QQRtU\/Ty4AAUoZ5Bfe6GwASQAo6kOTyKpAg6Vfn6GVAACkTudfdAJAAUtCBFIvfJFvgdiVJgMdDypERQIrFby13I3EHkAASQKq0LjB3E3ck65BBQHIpcQeQABJAqvzbBfZ\/KlabDtygUe3TJOuQSUCKxRN3ee+4A0gACSBVfrN5tsCNjjsWUUUmAilm3cmX13sYABJAAkiVzgusYFdt3ktHJOuQkUCybpXNYzEJIAEkgFSZ4PTls5hE6QiZC6RYvpdv2Lx5M0ACSAAp8QLLD5N4wAQyHUh5ZJJ8jvqdqAAJeQqkvDEJGqFgACmWj6Y7i0ZFRUVESAAp0ED67O6713L6smTSr85pR6Oenh7OBWX12T\/\/c0z50ymXepK1RJ78Sw3Jdb377rsASWUgTRQWrnWBrdaTNrqIQ3y1Ou3qRpyKKmvo1ltjOvg32TFJxtvRFUByV729vRUVFcwCOgLJvlpWmZRJqCTcqn3amyc9AySApCyTnIDJBGDOW\/QAklu6du3a888\/X1ZWBpC0BpJ92aTDUhxFEhi5twoyQAJIGh2wdc9sfX39WlhaffJLfb2MSbhkAJJb6ujo+NnPfjY8PJwGSPv3778H+ar9RUUCpExGbt68+dZbb13Fkvzsql0lkPzIxu1Ft9xyy2233SYDsCdyQwKkQ3feqdcxy+Vw5513FhYWytUh\/8q1c1tcsi2um\/wr2ymux\/37AZIrWllZkX\/HxsbSAAlpJ\/HsxOkTB7AzLtngNiOE0l8y\/XHZl4zWf47eNSSAhBBCxkgbIHV1dZXF5SQQQEIIIYDktS5evHg+romJCYCEEEIASS0BJIQQAkgACSGEEEBCCCEEkBBCCCGAhBBCCCDppsXFxQ8cWlpa4stWVjMzM6Ojox9++KF5f9rc3Jz8aVNTU3zLrurmzZti57x8lHxZ8lFpnhuk4+mqy3xoLJBOnTpVXFxc9o3ee+89Llo11dXVVVVV1draumfPnscee+zLL7805k+LRCKhUEj+NPkDu7u7+a7d07Vr1\/KyUNu\/\/du\/\/cu\/\/Mvzzz\/\/4IMP\/vu\/\/7sxp6su86GxQDp48OAbb7zBhaq4Lly4sHXrVplNrJe7d+8Oh8Nm\/GnLy8ty5Ys3bfmnpaWlij+sEyBNT0\/bZ+OVK1e2bNkiX5wZp6su86GxQKqurh4fH5fzSWJ5Ltc8Sqza0NDwwAMPiIf4H\/\/xH8nZjJ9+Wz\/\/+c\/TfNr8\/Pz58+ftly0tLSdOnDDDUNFoVFxp5582MDDA+eMqkGTOlfimtrY2OX2XyZm5srJiORD2B16+fNmM01WX+dBMIIlzKt5NTU3Njh07ZOPIkSNcsXmRXJAlJSUS78tp\/ac\/\/am4uPiTTz7JBUhOzc7OivspTqgZthoaGmpqarJftrW1tbe3cwq5CqTnnnvu+vXrcn5KbJpQt8v8zJTZY3BwUPyt9LDR6HTVaD40E0j\/8z\/\/I86L\/Cvb4uPs3Lnz9OnTXLS5yyqN2lOARAD5qiTL11RZWfnqq68aY6twONzc3Gy\/PBIXp5B7QJKp1q7oCP4FOdl91JUrV\/7zP\/\/zwIEDjzzyiJ2d0\/p01Wg+NAdIKVdftd965plnuGjzooGBgccff1zsvHfvXomWEoD03\/\/9383fljit635NEmaJ79bX12eSoSKRSGNjozNC6ujo4PxxD0jbtm1zegMHDx7c0JmZrLq6upStKLqfrirPh+YAybn6qkTTzmJje3v7uicfykTDw8PiXk1OTlrPo3rggQcSgCTe5TvfVsKA5EVyZVumkpGREcNsNT4+7oSuwEkQxSnkHpC2bt1qv3zppZeef\/75DZ2Z1snprPPJpJHwIZqerhrNh2am7KampoqLi636pISooVCItu+8qLe3137opBDlnnvuyTFlNzc3J9FSNBq9+Y2Wl5fNsJUwW4A0NjYWi7dvSTS5sLDAKeQekORstJC\/uLgols\/ikpevSeYNwZJsy5cl88aZM2dkWzyw+fl5fU9XjeZDY7vs3njjDTl1JOiWfw3LBfkocTOrq6v37Nnz6KOPtrS0iHlPnTqVywceP3484SnLWaf+1QyS5OIXK5WXl0twyfnjKpBKS0sPHDjw2GOPySWf3P+ZoU6fPi2f88QTT8i\/9n1I9fX1VoSh7+mqy3xo8tJB4qJ+8cUXVnIJ5VH\/+7\/\/SzN95uIk9PjkzDFqkS9LwiNjInW95kPWskMIIQSQEEIIIYCEEEIIICGEEEIACSGEEEBCCCGEABJCCCGAhJAOGhsbS3jcgKWrV69Go1EfD8DLY0AIICHkuj7++ON9+\/bdcccdTz311MG4ampq6uvrrXc\/\/fTT119\/3R58+PDhwsLCr776ynp5+vTpP\/7xj14eQLJyOYbPP\/+8t7dXPuGdd95Jfrevr+\/tt98eGRn59a9\/bT8QSBD4WlzylrVndnb2xIkTzz77bMJKbtevX094lEPKD0QIICH0d7355psJi8HbT4g4cOCAc79EKuXl5c49Njm8OYCUyvoYdu7caa3G1tLSkrz8YENDw6ZNm2SMHJ6988UXX7Q2hGFCMuHTK6+8Ii+\/\/vrr73\/\/+\/aSUUePHhW+3nXXXet+IEIACaFvTZSHDh2ytpeWluRf6yFsEru89NJLzpGDg4MJzy\/4xS9+ce7cOc8OIKWyOwaJq37wgx9Y27\/73e9+9KMfJQxIXpDwxo0bDz\/8sLUtYaJgTCKef\/zHf7T2SNyzfft2e\/C7776bAKQcVzhEAAkh83XfffdZi5yOjIxYqSRraa9jx44l5LIkFjl8+LDMwr29vdae8fFx2ePZAfT19Ul4IYOdAU12x\/D666\/v27fP2haefe9730sGkuyX\/85a6NrS\/fffv3fvXomrJAaSQ71+\/frvf\/976y2B6A9\/+MP0QEr+QIQAEkJ\/0+eff\/6d73zn5MmTr7zyypYtW5xvyXx99epV55677777\/ffft8gkE64VKCTHFi4dQGdn529+8xsLSz\/5yU\/s\/SmP4bPPPutdQxbzBA91dXX2MXz3u99N+ARBjtVMIR9ul6lkT1FRkRxwQugmBJWDdwZqyUBK+YEIASSE\/iZx2EOhkO3CO9+SUMDuXxBJWGCnpPbv3z84OGht19TUJHymkKM5SWs9jjPDA5idnbXn9xdeeMEik63kY1hXQjX7KVZ\/\/vOfCwsL08RSP\/7xjy3qyB9y5cqV06dP33HHHU4mPfvss3abw1pASv5AhAASQn9XU1OTTKbW9tzcnPMtceSdQJIJ96mnnrK277333o8\/\/tiao515KvcOQAhk82Pnzp3OLrWUx7C0tPTOGpJ4yPpzBHjW4JGRkfvuu8\/56x999JEdPwl6S0tLLXba\/QiCJYkXbbZZ8aLz+BOAlPIDEQJICP1d999\/v10FSUaFhA72S5lGX3vtNdl4\/\/33H3roIXtetudZVw9AJn2rn+3q1asy0QuEnGxIPgYZthaQrLyZ\/JYNDInMrL6+c+fOWX13Y2NjdvvGiy++aL07GJfz8CyYjY+Px+KNdidPnlwLSCk\/ECGAhNCqZK4\/evRoQUFBZ2en9UzxBCXMvxJzHDhwQCb0+vp6mc2tnb\/97W8TsmcuHYBQZN++fcPDwwKPhx9+uLe31y4vZX0Mhw4dEoRIwFRdXW1Rqry83H5yqPDvo7jkv7OCKqFgQ0ODHMPs7Ky8+4c\/\/EHeveWWWwq+kY0coZT8VmFh4QsvvPDXv\/51rQ9ECCAhlJG++uqrJ554wrlHZuQbN24kBDEJjQ\/uHYD9v8uGM5eYyzF8+umnAhjnpzklsaAV\/Tj1l7\/8RX5F4qEs\/ruUH4gQQEJofYlTn2ZNgfn5+UzuE3LvALw5BoQAEkJK6NixYwlRkR2vHD16NLtAIS8H4OUxIASQEFJCKQsestMzEqxVcfHyGBACSAghhAASQgghBJAQQgghgIQQQgggIYQQQg79fwGdtNUF+n1yAAAAAElFTkSuQmCC","width":390}
%---
%[text:image:8fa8]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:8980]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:8e20]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:0248]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:179d]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:8183]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:15db]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:8349]
%   data: {"align":"baseline","height":353,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAjAAAAGkCAIAAACgjIjwAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH5wIJFgAxiShCiAAAACR0RVh0U29mdHdhcmUATUFUTEFCLCBUaGUgTWF0aFdvcmtzLCBJbmMuPFjdGAAAACJ0RVh0Q3JlYXRpb24gVGltZQAwOS1GZWItMjAyMyAxNzowMDo0OcYTIygAACAASURBVHic7d17XFTV3sfxJeMoQsI4QgY2Cd7Q1MwLmhwT5aiVl0zNS4+KaN7FrDxd7eWlvHQ5mqbRUY+pPWViqZVlap4UFVIxOz4qhoBAJJfQQVAGcLg8f+yapgEBdQ97z8zn\/dfs7Z69l77OmW9r7d9aq15FRYUAAEBpbko3AAAAIQgkAIBKEEgAAFUgkAAAqkAgAQBUgUACAKgCgQQAUAUCCQCgCgQSAEAVCCQAgCoQSAAAVSCQAACqQCABAFShvtINABQ2bty4oqIiy2HDhg179eoVGRnp5mb7n2uRkZGZmZkRERGPP\/645eT+\/fv\/9a9\/3XfffatWrbK5vry8\/L333tu1a9fp06e9vb0fffTRl156qWXLlrfdyK1bt7q7u9\/G1wHHUAG4tsaNG1f+\/8XIkSMrX\/nCCy8IIfr06WN9cujQoUKIV1991ebioqKiPn36SHdr1KiR9KFJkyZnzpy57UZeu3btNr4LOAqG7AAhhPjyyy9LSkry8\/OXLFkihNixY0dCQoLNNePHjxdCHD58OCsrSzpjMpn27t0rhBg3bpzNxQsWLDh8+HDLli3PnDljMpkyMzNDQkLy8vJmz55t978M4JgIJEAIIerXr9+gQQMvL6\/58+d7enoKIS5evGhzzQMPPNCpUychRHR0tHRmx44dZrO5S5cu999\/v\/WV5eXlUVFRQogPP\/ywY8eOQgg\/P7+NGzfOnj177ty5CxcuHDJkyJ49e6SLs7KyhgwZMnr0aCFEaWnp4sWL27Zt6+Xl9eCDD27cuLFyU69fv\/7MM880a9ZMp9M99dRT6enp8v5TAIpRuosGKEwaDfvmm2+kw++\/\/176v8bJkycrXyz1n0JCQqRDabxuxYoVNpcdO3ZMCKHRaMrKyirfZN26dUKIwYMHS4erV68WQkyePLmioiI8PFwIcd99940cObJJkyZCiI8++qjir0N2ffv2FUL06NFj5MiRQoh77rnn8uXL8vxbAIoikODqpN\/6xo0b+\/j4WN4nhYWFVXlxWlqadEFaWlphYaFWq9VoNNnZ2TaXffPNN9I9q7yJ5YtGo7GiokJ61XT48GHp5o0aNZICZvfu3Y888sg777xTYRVIUl526dJFutWiRYuEENI1gKOjyg4QQoji4uIbN27Ur1+\/ZcuWw4YNk37or1y5EhgYKF3QtGnT1NTUFi1a9O7d++jRo9u2bbvvvvvMZnNYWFizZs1s7iZV6BUXF1f5LA8Pj3Hjxm3evPmLL74YNGjQ4cOHAwICHn744Z07dwoh+vfv37RpUyHEkCFDhgwZYvNdqe91\/fr1qVOnCiGkDPvxxx\/l+ncAFMQ7JEAIIb744ovi4uLr16+npKSsXLnSy8tLOn\/tD9evX5fOSPUL0dHRn332mfij0sFG7969hRBms\/nnn3+2nLxw4UJoaOjKlSuFEBEREUKIzz77bNeuXUIIaaSurKysxnbm5+dLd75y5cqVK1caN248fPjwBx988A7+6oBqKN1FAxRm8w7JxjUr0hmj0ajRaIQQWq1Wq9UWFRVV+cVHHnlECDF48GDLa6Rhw4YJq\/dPLVu21Gg0Dz30kBAiMTGxoqLip59+EkJ4enpK9\/zpp5\/uvffeKVOmVFgN2W3fvl0I0b9\/f+kmp0+f3rVr1y+\/\/CLbPwegHAIJrq76QKqSFC1CiLFjx97smqSkJB8fHyFEQEDAqFGj2rRpI2VYXFycdMHrr78u3eShhx6yfEt6n9StW7fZs2cHBQUJIRYsWFBhFUhFRUX+\/v5CiLlz527evFn6vHv37tv92wMqQiDB1d1GIG3btk3Kkuq\/lZSUJPWTJB06dDh06JDlTy31ER988IHl5G+\/\/fbYY49J5zUazezZs6UOlnWV3ZkzZ6Tqc6k7VbnGD3BQ9SoqKuQeBQTwpxs3bpw5c6ZNmzaW91KSjIyMwMBANze3nJwcqcLb+iu5ubl+fn6Vly+yKC4uzs\/P9\/X1reYawLFQZQfYV4MGDbp162Z9Jj4+\/quvvvryyy\/LysqeeuopmzSSvtK8efPqb+vu7s66dnAy9JCAuvb1119LM2q7dOnyzTff+Pn5Kd0iQBUIJEABJpPJzc2NLg5gjUACAKgCr0MBAKpAIAEAVMGZA2nNmjVKNwEAUFvO\/A4pKCgoMTFR6VYAAGrFmXtIAAAHQiABAFSBQAIAqAKBBABQBQIJAKAKBBIAQBUIJACAKhBIAABVIJAAAKpAIAEAVIFAAgCoAoEEAFAFAgkAoAoEEgBAFQgkAIAqEEgAAFUgkAAAqkAgAQBUgUACAKgCgQQAUAUCCQCgCgQSAEAVCCQAgCoQSAAAVSCQAACqQCABAFSBQAIAqIIqAik5OfnAgQOnTp2q\/rLTp0\/n5uZan0lMTDxw4EBaWpodGwcAqBPKB9KSJUumTZu2b9++xYsX\/8\/\/\/E9JSUmVlyUnJ48fP\/706dOWM+++++6cOXP+85\/\/TJkyZd26dXXVXgCAXdRX9vHnz5+Pjo4+cuSITqcTQgwdOnT37t1PPvmkzWVms3nevHk+Pj6WM0lJSR9++KH0xdzc3NDQ0FGjRun1+jptPQBAPgr3kHQ63bp166Q0EkIEBgZmZmZWvmzlypV\/\/\/vf27ZtaznTqlWrXbt2SV\/UarVlZWVms7nyF4P+sGbNGvv8DQAA8lC4h+Tn5+fn5yd9Tk9PP3jw4MyZM22uOXHixPHjx3fu3Dl9+nTLSTc3t9atW5eVlX3++edbt26dPXt2s2bNKt8\/MTHRfo2vUZqxOEDvrmADAMCBKP8OSZKTkxMRETFr1qz27dtbny8oKFiwYMHKlSur\/JbRaCwpKbn77rtjY2OvXr1aJy29Bf0+OBW4NG7xvlSlGwIADkAVgXTmzJnhw4eHh4dX7h69\/fbb999\/f3p6ekxMjNFoPHfunHWnx9fXNzw8fMOGDe7u7lu2bKnbVtcgzVhcVloWPfLehEtGKZbSjMVKNwoA1EvhITshRFxc3Ny5c5cuXTpw4MDKf+rr65uQkLB161YhxKVLl2JiYry8vIKCgi5evBgXFzd+\/HjpsnvuuSc7O7tO2107Bm\/tqsf8M\/LN289d7fdBVt9WTSYG39O3VROl2wUAqqNwIGVkZERGRq5YsaJ3795SVYKbm5tGozl9+vTdd9\/t5+c3d+5cy8XTp08fNWpU\/\/79hRBlZWXLly8PCQlp2bLl5cuXjx49+sYbbyj216iJwVs7L8R3dAfd9nNXwz8+q6mvWTgwMCLYT+l2AYCKKDxkt3Xr1sLCwhkzZnT8w9KlS4UQq1atio2NreaLbdq0ee2110aMGPH000\/3798\/PDw8LCysrlp9m6RY+nxMi2d76NfHpvN6CQCs1auoqFC6DfYSFBSkYJVdmrG4z5r449Na3+yCjHzzirjcE1kljOMBgFC8h+TKpNdL0SPvbao194v6adK284dS8pRuFAAoRvmiBhdneb30Q4bp1d2JWYXlEd39Fj4SqHS7AKCuEUiqYPDWGry9R3f0lsbxApdmRXT3mxjsx7xaAK6DQFIXysQBuCzeIamRNI4nvV4K\/\/hs4NK4zfFZSjcKAOyLHpJ6Wb9eWh+bvnh\/KuN4AJwYgaR21q+XGMcD4MQYsnMYjOMBcG70kBwM43gAnBWB5JAYxwPgfBiyc2yM4wFwGvSQnAHjeACcAIHkPBjHA+DQGLJzQozjAXBE9JCcFuN4ABwLgeTkGMcD4CgYsnMV1uN4r+5OZL9aAGpDD8m1SLE0T4i4DNP2s0Zpn4vQ1jo6TAAURyC5qBCDR4jB4\/dxvKjUvq10E4P9IoL9lG4XANfFkJ1LkzpMx6e2fqKNx\/rYdMbxACiIHhKq2K+WwgcAdY9Awp+s96sN\/\/ispr5m4cBAxvEA1A0CCbaYwARAEQQSqmYzgSlwaWpEsF9oKx0dJgB2QlEDamApfHiwaT0KHwDYDz0k1AqFDwDsjUDCralc+BDR3W\/hI4FKtwuAw2PIDrfj93G8aa2f7aFPuGQMXBo3adv5Qyl5SrcLgAOjh4Q7Mrqj1cqtUT8F6N2pFAdwewgkyIBKcQB3jkCCbKrc6oJKcQC1xDskyM+y1YV1pXiasVjpdgFQNXpIsBebSvF+J6kUB1AdAgl2Z10p\/uruxKzCcirFAVRGIKGOWPYGZGotgCoRSKhrTK0FUCUCCcr4vcMU4mvZTJ0OE+DiCCQozHozdTpMgCsjkKAK1lNr4zLoMAGuiECCithMraXDBLgUAglqRIcJcEEEEtSLDhPgUggkOAA6TIArIJDgMOgwAc6NQILjocMEOCUCCY6KDhPgZAgkODxLhymjwMyiD4DjIpDgJAzeWoO3lkUfAMdFIMHZWFbJY1lxwLEQSHBalmXFf8gwWfZhmhjsF6B3V7ppAKpAIMHJVblxbWgrXUSwn9JNA\/AXBBJchXWHaX1s+uL9qRHd\/UJb6xjKA1SCQIJrsSkW7xeVGqB3XzgwkA4ToDgCCS7Kenat1GGi9gFQFoEEl8bsWkA9CCRACJYjAlSAQAL+ZNNholgcqEsEElCF32fXCkGxOFBnCCSgOpWLxRnKA+yEQAJqRu0DUAcIJOAWUPsA2A+BBNwyah8AeyCQgNtnXfuw\/dzVwKWpfVvpJgb7UfsA3AY3pRvgVAKXxi3el1r5fEa+eWR0+rPfZtZ9k1A3pGQ6PrX1E2081semBy6Nm7Tt\/KGUPKXbBTgSekhyCmjivvlklhDC+l13Rr752b2ZP2SY5o1poVzTUBeqrH24pddLm8a2t1\/zAJUjkOQ0Mdhv0rbzi\/anSp+FEBn55iej0zMKzAYvbYjBQ+kGoo7YbBK4\/Vx+bb4VoHdPMxbzFgoui0CSk+W\/hRftT03LKxZC9NyQLJ2ZF+KrWLOgHGka07wQX+m\/S252WYDefdPY9pTqwcXxDklOAXr3vq100ufN8VnWP0C96B65MIO39vMxLQxe2sp\/1LeVLnV+SOr8ENIIIJBkVuVMydEdvA3eVfwYwXVImTQvxMf6ZIDePUDfiNoHQEIgySygSaPKJ0MMnnXfEqiNwVs7uoPOOpPSjMUmk4mqPEBCIMksQO9eeQ7K6I7eijQGavNHscNf+kk7xrSIHnlvU605\/OOzN5s5ALgCihrkt3Bg4Ob4LMvh6A6kEf5CqnBZEXdZCPFDhklYrUiUUWDefvb3FYlYXByupl5FRYXSbbCXoKCgxMRERR7dL+rUoZSr0ufPx7Sg4BuVZeSbpSLMyv8LkRYXjz53NauwnLXy4DoIJLvYHJ81adt5IYTBS3t8WmtF2gD1k6ap3eut3XGTSdPSBNvtZ\/OlxcVZKw\/OjSE7u7D89yzTj1ANqfROGrW72QXWE2z7ncwKaOLOWnlwVvSQ7EUatTs+tTUF35ALQ3lwbgSSvRxKyQv\/+CzjdbAHaSgvLsMkbXsR2lpHMsEJMGRnL1VOSAJkYbPtRb+o1AC9OzvYwtERSIADq3IHW+rF4aAIJMDhWW978UOGaX1s+uL9qbxkgsORP5BMJlN2dnZhYWF5ebmnp6ePj49Op5P9KQAqq3JDJurF4SjkDKS4uLj58+dnZmYKIdzd3TUaTWFhoRCiadOms2bNGj9+vIzPAlANm3rxwP2pAXr3hQMDGcqDmslTZWc0GocNGyaEmDVr1oABA\/R6vZubm+WP\/vvf\/y5btiw3N\/f999\/v3bv3nT+ulpStskszFvdZE0+VHdRAGsqLyyg8kVXCSyaoljyBFBYWtm7dujZt2lRzTW5u7vTp0zdv3uzl5XXnT6wNAgmwwUwmqBnzkOyFQIKasSgRVEj+ooaCgoL8\/Pzy8nLp0Gw27927NzIyUvYHAbhtvGSCCsncQ9q1a9fLL79sc9LHxyc2NlbGp9QSPSSglnjJBDWQeYO+lStXzpgxIyEh4e67796\/f398fHyPHj2mT58u71MAyMvgrR3d0XvVY\/7RI+99sGk9NrGFImQOpIKCggkTJmg0mnvuuSc2NtbLy2vz5s3vvPOOvE8BYCdSMlk2sX11d6K0iS3JhDogcyBptVqp4Ds8PDw6OloIodFoPD09CwoK5H0QALuSXjJJyXTt+jXL9uppxmKlmwanJXMgtW7devHixSaT6YEHHrh48WJZWVl6enpeXl7Dhg3lfRCAuiEl0+djWvxzQLOES8bApXH9ok5tjs9Sul1wQjJX2W3durVHjx5vvvnm66+\/7uvre\/\/99wshgoODCSTAoRm8tQZvbYjBY16I7w8Zpm\/PZErL5VH+ABnZdx7SuXPnGjRoUP2EWfuhyg6wH+bYQnZy9pAyMzNNJpNer9fr9dKZDh06yHh\/AOphs5Drq7sT2S0Qd0i2QBo+fHhCQoL0ecSIEcuXL5frzgDUzGa3wPCPf5VWfyCZcKvkKWr4+OOPExISPvnkkx9\/\/PHtt9\/euXNnenq6LHcG4CikZDo+rXX0yHsTLhn7Rf1EYR5uiWyB9MADD3Tv3v2uu+4aNmxY8+bN16xZI8udATgcg7d21WP+x6e2fraHPuGSsd8HpyjMQ23IM2RXWlrq7v7nyoyNGzdOSkqS5c4AHNTN9rGlMA83wxbmAOyLHdZRSwQSgDpSZWEeyQQL2QLpxIkTY8aMkT7\/\/PPPQgjLYb169bZt2ybXgwA4OpvCPErGIZEnkHx8fIqKin799VfLoRDCcmjZzhwArFEyDmvsGGsvrNQA3AZpw8Dt5\/ID9O5sZetq5Okh1VhTp9TqQQAci1QyLq2YF5dhlLayjejut\/CRQKWbBruTJ5BmzpyZkZFxsz\/VaDSWRRwAoEaW8oc\/k2lpVkAT94nBfpSMOzF5Aqldu3aZmZlNmzadMmXKyJEj77rrLlluC8DF2ZSMs8q4c5PzHdLFixfnzZuXkJDg7+\/\/zDPPDBo0SNldJ3iHBDgfm1XGSSZnYpeihqSkpLlz56akpBgMhvnz5\/fp00ej0cj+lBoRSIATY\/8L52OXibFt2rTZs2dPeXn5qVOnxo0bxzskALKzGc1jmq0TsNdKDUlJSc8991xSUpKnp+egQYPs9BQAYAEIpyFzIFlyyN3dvW\/fvuvXr\/f395f3EQBQpSoXgCCZHIhs85CkHKpfv35ISMgHH3xgMBhkuTMA3CqSyUHJNg\/JaDQuW7asRYsWQoicnJycnBzrC7p37y7LgwCg9iotTXSWpYnUTJ5Aaty48dWrV2+2bXm9evXi4+NleRAA3IbfkynEl0Xz1Iy17OyFsm9AzaRk2n42n2RSD3l6SLm5ub6+vjVeVlJSouxUWQCQ0GdSIXk2hpg8efKECRMuX758swuuX7++YMGCHj16mEwmWZ4IALKQkun4tNbRI++9dv1av6ifApfGLd6XeiglT+mmuRx5eki7d+\/esWNHnz59mjZt2qlTpzlz5nh4eGi12sLCwi1btsTGxmZmZk6YMOH06dOyPA4AZCcl0+gOuowC8\/azxkV\/LDROn6nOyPwOae\/evW+\/\/XZOTk5paakQQqPRNGvWbNKkSWPGjKn7wTreIQG4bRn55owC8\/azVy2bM5FM9mavogaz2VxeXs7iqgQS4OhIpjpjr6WDtFqtne4MAHXJ4K01eGtDDB7zQnwZzbMrewUSADgZSzKtesyf2jx7IJAA4JZRNW4PBBIA3D6SSUbyB1J5efnatWv37t27dOlSDw+PwsLCrl27yv4UAFCVKpOJFV1viTwTYy1MJlP79u2jo6NTUlKEEJcuXXrqqafWrl0r71MAQLWsZ9o21Zpf3Z0YuDRu0rbzzLStkcyBNGLEiClTpsTGxrZr104IERYWtnHjxqioKHmfAgDqJyXTjjEtpGSatO18mrFY6UapmsyBlJ2dPXXqVOszvXv31mg0BQUF8j4IAByFlExlpWVKN0TtZA6k+vXrFxUVWZ8pLy+\/ceNG\/fpUTwAAqiNzIA0ZMmTo0KFGo1E6NJlM48ePb968uYeHh7wPAgA4GZk7LosWLUpNTe3Vq5cQYtKkSUVFRY0aNWJ3PgBAjWQOJKPRuGXLlqysrMuXL5eXl+t0OmlTcwAAqidzIA0aNGj8+PGRkZF+fn7y3hkA4NxkfodUWlpKlwgAcBtk7iG9\/\/774eHhmZmZAwYM0Gg0lvOkFACgejIH0osvviiEWLly5cqVKy0nNRpNQkKCvA8CADgZmQMpJiZG3hsCAFyEzIGUmZlZ5Xl\/f395HwQAcDIyB9JTTz2VnZ1tc9LLy4upSACA6skcSN9\/\/7314bVr11544YUuXbrI+xQAgPORuexb81c6nS4qKmr16tXyPgUA4HxkDqTKtFqtEOLq1av2fhAAwKHJPGSXnp5uc2bZsmUNGjTQ6XTyPggA4GRkDqTw8HCboobGjRuvW7dO3qcAAJyPfYsarBdrAACgGvIXNezbty8nJ0ej0axdu7Z79+5hYWHyPgIA4JRkDqTVq1c\/99xz165dy83NjYqKCg8Pv+eeex5++GF5nwIAcD4yB9Knn376+eefBwUF\/fvf\/27cuPEzzzyzdevW3377zWZfcwAAbMgcSEVFRYGBgUKIPXv2dOjQQTrZoEEDs9ks74MAAE5G5qIGLy+vH3\/8sXPnzr\/99tuWLVuEECdOnLhx44aXl5e8DwIAOBmZA2nx4sXTpk0TQrRp06Zly5Y7dux49dVXJ0+eLO9TAADOR+ZACgsLO378+LVr1wwGgxBiyJAhPXr0kD4DAFANmQNJCKHT6SzrMjRs2JA0AgDUhvxr2e3Zs0faFWn16tXMQwIA1BLzkAAAquDA85CSk5MPHDhw6tQp2e98h\/JMmesPT31r7+CCkpxNP076Lnml0i0CAAcg8zukauYhNWrUSMYHLVmy5Pvvv+\/WrduFCxc8PT03bdrUsGFDGe9\/2\/JMmW99O1gIIYReCFFQkpPwW86v+WcmddukbMMAQOVk7iFJ85CuXr3622+\/LVy4UNhnHtL58+ejo6N37tz5zjvvfPnll9euXdu9e7eM978T62OmVj5ZUJJDPwkAqidzIEnzkHr27GmZhzRhwgTZ5yHpdLp169ZZavkCAwOlMorKgv6wZs0aedtwM3mmqlvya\/6ZumkAADgoh5yH5Ofn5+fnJ31OT08\/ePDgzJkzq7wyMTFR3kdX72LuSetD74Z5e5LHGrxSOt0dX1CSU1CS49WwWV22BwAciPxl315eXrt27Ro0aNBPP\/2UlpaWm5sr+yMscnJyIiIiZs2a1b59e\/s9pfaaePpbPns3NA5qs83glXL2t+B\/\/Th\/T\/LYs781VrBtAKByMveQTCZTly5dfHx8Ll++LIS4dOnSzJkz58yZExkZKe+DhBBnzpyZPn361KlTJ02aJPvNb08TD\/+Wvt0t\/STvhsZOdxs73R2fX6L\/9frj\/\/gup6y0bHRH714GzxCDh7JNBQC1kbmHNGLEiClTpsTGxrZr104IERYWtnHjxqioKHmfIoSIi4ubPHnyokWL1JNGklHdFzfx8Lc52eXelrunzU2dH3J4TvAVs\/bJ6PSe65NXxNmx7wgADkfmQMrOzp469S9lZr1799ZoNAUFBTI+JSMjIzIy8u233+7Xr5\/ZbDabzWVlZTLe\/0408fCfFrqhW4vHLYf920+f1meDdBigd980tn3q\/JDXB7W+Ytb2XJ\/87LeZ28\/mK9deAFALmYfs6tevX1RUZKl\/E0KUl5ffuHGjfn05H7R169bCwsIZM2ZYzowbN27BggUyPuJONPHwH9V9cf\/7p1fuKkkC9O4Rer+IYL80Y\/GhlLwt8Vkr4nJ7GTxGd9QxlAfAZckcSEOGDBk6dOj+\/fulQ5PJNGXKlObNm3t4yPk7+9JLL7300ksy3tAebpZG1qyTaUt81tqTec99m8lLJgCuqV5FRYW8d5w4ceKxY8eEEI0aNSoqKmrUqFF8fLxWq5X3KbURFBRUx2Xfd05Kps0ns6Tyh9EddAZvBf7pAMiu5\/rkw3OCA\/TuSjdEvWQOJKPRqNfrs7KyLl++XF5ertPpWrRoIeP9b4kjBpJFmrF48f7UzfFZBi\/t6I7e80J8lW4RgDtCINVI5iG7QYMGjR8\/PjIy0jJxFbdHKn9YODDwUEpeTMrVnuuTexk8Qgyeozt6K900ALALmQOptLRUwS6R86H8AYDrkDmQ3n\/\/\/fDw8MzMzAEDBmg0Gst5UuoO2STT2vis577NJJkAOBOZ3yGFhoZmZ2fbnNRoNAkJCTI+pZYc+h1SjaTyh0MpeSm5hRTmAerHO6QaydxDiomJkfeGuJkAvfvCRwIXikApmf7xXRbrEgFwaHKu1JCZmZmcnGw0GmW8J2okJVPq\/JCPxndkXSIAjku2HtLw4cMt43IjRoxYvny5XHdGLfVt1aRvqybWhXn3emvHdNBRmAfAIcgTSB9\/\/HFCQsInn3zSrl27\/\/znPy+++OKMGTMoZFCETflDTMrVFZSMA3AE8hQ1PProo40bN\/7ss8+kw7CwsK5du\/7zn\/+88zvfCecuaqg9S8l4Sm4hyQQohaKGGsnTQyotLXV3\/\/NfuXHjxklJSbLcGXeOyUwAHILMVXZQsyrXciWZAKgEgeSKbErGWWUcgBrIFkgnTpwYM2aM9Pnnn38WQlgO69Wrt23bNrkeBBkxmQmAesgTSD4+PkVFRb\/++qvlUAhhOXRzk3lfWsju92R65PdkejI6VVplnGQCUGfkCSQ6QE5DSqaJwX5peUVb4rOfjE6XkomdmQDYG++QUIUAvXuA3l2aZislU88NySQTALsikFAd62T6fQGIDckGL+28EF8mMwGQF4GEWrGUjFuSaQVLEwGQFYGEW1Pl0kQkE4A7RyDhNpFMAORFIOFO3WxpIhbNA3BLCCTIhmQCcCcIJMiPZAJwGwgk2BHJBKD2CCTUBZIJQI0IJNQpkgnAzRBIUAbJBMAGgQSFMZ8JgIRAglqQTICLI5CgOtUkUy+DB2uNwxFtP5ufUWBOyysK0Lsr3Rb1IpCgXpWT6dm97IIBhxR97qoQYkt8dt9WTZRui3rVq6ioULoNp+HmUwAAEVBJREFU9hIUFJSYmKh0KyAnSzJtjs9iT1s4irgM05PR6UKIAL176vwQpZujXgQSHBLJBAfy7LeZ28\/lS58PzupCJ+lmCCQ4tjRjsbSnLckE1eq5PjmjwCx97ttKd3BWV2Xbo1q8Q4Jjs9ltPSb56j++yyorLSOZoBJSOYPlMC2v+FBKHp2kKtFDghNKMxZvic86lJKXklvYy+AxuqOOZIJSrMfrJIsGBi58JFCp9qgZgQRnRjJBcf7\/PG9zhtKGmyGQ4BJskokFilA3tp\/Nf3ZvZuXzlDZUiUCCa7EsnUcyoQ6MjE7\/IcMkhDB4aYUQmvqaNGOxECIi2G\/T2PYKN0593JRuAFCnAvTuEcF+B2d1PTwn+LFO\/l8kmXquTx4Znb79bH7NXwZuRVyGSUqjXgaP49NaCyE2jW0vrdRwKCVP4capEoEEF2WdTNP+1uK\/Vyr8\/3m+5\/rkFXG5cRmm2t8nLsOUkW+u+Tq4nu1nrwohehk8doxpIZ0JaNLo4MyuAXp3qaeuaOvUiECCq5OSadPY9qnzQ14f1PqKWftkdHrtk2n72atPRqeviMutg6bCsfyQYbJOI0mA3l3KpMX7UpVqmGrxDgmwZZlseyglr6y0rPryvIx8c88NyUKIeSE+80J867alULWMfLP1ios91ycfnhMsDdlJb5JYaNUGgQRUpzaF49Yvrj8f04JVX1El60BClQgkoFaqKRy3dJKEEAYv7bwQXyr3UBmBVCOWDgJqJUDvvvCRwIUi0HrPdcv+gb0MHlInKaPAvCIuN6PgBsN3wK0ikIBbU8UuTX+dip9RYF4Rdzkuw2TzNhtA9aiyA26TVJ63cGBgRLBf5T\/9IcPUc30yFeFA7dFDAm7f4n2pi\/bftHg3o8D8ZHT66I7eDN8BtUEgAbcjzVjc74NTUvFuNaThu4x8M2sUATUikIDbkZZXFNDEXVofM6DJ73VTLfTu4o\/JJQFNGkmfKxdB9DJ4UBoOVEbZN1BH2HbdxVH2XSN6SEAdsZTnSZvbbonP\/sd3OTWuBAG4DgIJqGuWbdfFH\/Nt157Me+7bTLbDgIsjkAAlVTPf9l5vLd0muBQCCVCFKubb7k3nVRNcCkUNgEpJi47HJF+tfmlXOAqKGmpEDwlQKcurJmlAj1dNcHoEEuAAbF41SQvoMaAHJ0MgAY7EunZcSiZqx+E0CCTAIVmSSVA7DmdBIAEOr8racSEEA3pwLAQS4Dwq144\/GZ1u8NIyoAeHQNk34OSq2XwddYmy7xrRQwKcHBV6cBQEEuAqqqnQo9sENSCQAJdTuULvi6S8FXG5UjKxXROUQiABLq2KAb29yQzoQREUNQD4i8pr6DGgJwuKGmpEDwnAX9isocfEJtQZAgnATVWe2EQdBOyHQAJQs5vVQbCXIGREIAG4NVXVQbAeBGRAUQOAO5VmLBZC2KwHQfm4DYoaakQPCcCdkn5kKR\/HHaKHBMAuKB+3QQ+pRvSQANhF5fJxltFD9eghAag7rtxtoodUI3pIAOpOlbNun92bSbcJgkACoBTrWbdSt4ld2F0cgQRAYbxtgoR3SADUqMq3TQ49t4l3SDWihwRAjaruNu1NZkkIJ0YPCYDDqLLb5Cgr6dFDqhE9JAAO4ybdJlbScxL0kAA4NpuV9KQOkwpLIegh1YgeEgDHVuVKeuzb5IgIJADOw2bfJra7dSwEEgDnZDPxdkt89tqT+ZaJtw5dQe6sCCQATs5SCiH+6DZRQa5OFDUAcEV1XwpBUUON6CEBcEWUQqgQgQTA1VVZCiGtQc6YXl0ikADgTzdbg1y105ucCYEEAFWoclUIxvTsSkWBdOTIkYcfftjmpNFovHjxovUZHx+fgIAA6XNycnJaWpper+\/atWvdNBKAC2JMr26oJZCioqI+\/fTTI0eO2Jw\/efLkyy+\/bDksLi4ePXr0okWLhBBLliz5\/vvvu3XrduHCBU9Pz02bNjVs2LAu2wzABTGmZz\/Kl31fvXr1rbfe2rdvn6enZ+VAsnb06NH58+d\/+eWXOp3u\/Pnzo0ePPnLkiE6nE0IMHTp04sSJTz75pPX1lH0DqBuWMb00Y9HNdm+i7LtGyveQVq1apdfrly1btnTp0mouM5lMr7zyyrJly6QE0ul069atkz4LIQIDAzMzM+uiuQBQSeUxPeu5t7xwqiXle0jl5eVubm4xMTGvvfZaNT2k1atXnz17dsOGDZX\/KD09fciQIdu3b2\/fvr31+aCgIMvnyMjIOXPmyNhsAKiezdxbTX3NwZld6SFVQ\/kekpubW43XlJSUbNq06X\/\/938r\/1FOTk5ERMSsWbNs0kjCkB0ApdjMvbWcwc3UHAZqsHfvXoPB0KlTJ5vzZ86cGT58eHh4+MyZMxVpGADUhlRErnQr1E75HlJtxMTEDBgwwOZkXFzc3Llzly5dOnDgQEVaBQCQkUp7SKdPn87KyrIcHjt2rHPnztYXZGRkREZGvv322\/369TObzWazuaysrM6bCQCQjUoDadWqVbGxsdLn8vLyK1eu3H\/\/\/dYXbN26tbCwcMaMGR3\/UH2RHgBA5ZSvsrMf5iEBgANRaQ8JAOBqCCQAgCoQSAAAVSCQAACqQCABAFSBQAIAqAKBBABQBQIJAKAKBBIAQBUIJACAKhBIAABVIJAAAKpAIAEAVIFAAgCoAoEEAFAFAgkAoAoEEgBAFQgkAIAqEEgAAFUgkAAAqkAgAQBUgUACAKgCgQQAUAUCyY7WrFmjdBMAqAU\/CDUikOxo7dq1SjcBgFrwg1AjAgkAoAoEEgBAFepVVFQo3QZ7mTBhwokTJ5RuBQCoQmRk5Jw5c5RuRXWcOZAAAA6EITsAgCoQSAAAVSCQAACqQCABAFSBQAIAqAKBBABQBQIJAKAKBBIAQBXqK90Ap2I0Gv\/73\/96enr27NnTcjIjIyMxMdFgMAQFBSnYNgB1yWg0Xrx40fqMj49PQECA4Dfh5ggk2cTExLzyyishISHp6ekNGzb86KOP3Nzcdu\/e\/eabb4aEhPz444\/Dhg2bO3eu0s0EUBdOnjz58ssvWw6Li4tHjx69aNEifhOqUwE5lJaW9urV6\/jx49Lh4MGDv\/3229LS0i5duiQlJVVUVFy5cqVz586pqalKthKAEo4cOdKnT5+8vDx+E6pHD0keMTExzZs379Gjh3T49ddfCyEOHjyo0+lat24thNDr9X369Dl69KjUZwfgIkwm0yuvvLJs2TKdTsdvQvUoapBHXl6ewWBYsGBB586du3btunHjRiHE1atX27VrZ7nmrrvuunDhgnJtBKCADRs2tGvX7uGHHxb8JtSEQJJHcnLyvn37OnTocPr06U8\/\/fRf\/\/rX0aNHy8rK3Nz+\/Bd2c3MrLy9XsJEA6lhJScmmTZueeeYZ6ZDfhOoRSPK47777WrRoMWbMGCFEUFDQgAED9uzZ07Bhw7KyMss15eXl9eszRgq4kL179xoMhk6dOkmH\/CZUj0CSR9OmTa0P3dzc3Nzc7r777rNnz1pO5uXldevWrc6bBkAxMTExAwYMsBzym1A9Akke\/fr1MxqNBw8eFEIYjcYjR44MHTo0ODhYCBETEyOESEpKiouL69Wrl8INBVCHjh071rlzZ8shvwnVY8dY2Zw8efKFF15o1qxZcnLy5MmTZ82aJYQ4fvz4888\/37p163Pnzi1ZsuTRRx9VupkA6kh5eXn79u2PHj3q6+trOclvQjUIJJkVFRU1aNBAo9FYnzSZTO7u7tYvMwG4Mn4TqkQgAQBUgXwGAKgCgQQAUAUCCQCgCgQSAEAVCCQAgCoQSAAAVWAZJcBJXL58+ZNPPsnOzn7iiSes9ywGHAU9JMAZFBUVjRw5UqfTDRgw4I033ti\/f7\/SLQJuGT0kwBlcvHhx5MiREydOFEJcu3Zt\/\/79AwcOVLpRwK0hkABn0KFDhw4dOgghCgoKvvrqq9DQUKVbBNwyhuwA53HgwIGIiIiff\/45JCRE6bYAt4xAgtN69913161bV\/n8hg0boqKiqvliZGTkuXPn7NauKkycODEpKenO79O\/f\/+dO3e+8cYbTz\/9tHRm7NixFy9evPM7A3WAQILT0uv17733nslksj5ZUlLy3nvv2WyoaOO77767fPmynVv3py1btvj7+7dp0+ZObpKVlXXmzBnpc1hYWHZ2dklJiRDimWeemTdvngytBOyPQILTGjp0aEVFxZ49e6xP7t69283N7YknnlCqVTaKioo++OCDqVOn3uF9fvnllxdeeEEKoYMHDzZv3rxhw4ZCCGnszuYfAVAnAglOS6\/X9+\/ff\/fu3dYnv\/zyy2HDhkk\/1tevX1+6dOnf\/va37t27z5o1q\/LQ1vTp0y3dDuvD6dOnHzhwYMKECV27dh07dmx6evqOHTv69+8fHBy8fPlyy\/UlJSXvvPNOaGiodP\/09PTKjfzqq6\/8\/PxatmwpHZpMpuXLlz\/88MPdu3d\/\/vnnc3Jyavm4nj179u\/ff+jQoVOnTn3jjTfeffddyyMef\/zxjz766A7+IYG6UgE4r9jY2LZt22ZnZ0uHly5datu27f\/93\/9Jh2PGjBk+fHh8fHxSUtLLL7\/cvXv3zMzMioqKtm3bHjp0yPqDxPp8SEjIV199FRsb+8QTT\/Tu3XvatGmxsbE7d+5s3779vn37pOtnz549ePDg+Pj4S5cuLVy4sFevXleuXLFp4ZQpU958803L4eTJkx9\/\/PFTp06lpqbOmDHjscceq\/3jKioqbty4YTKZbB6RkJDQtm3byo8G1IZAgpPr27fvhx9+KH1+\/\/33hwwZIn0+duxY27ZtL126ZLly8ODBy5Ytq6hdIP373\/+WTn7++eft27e\/du2adDhmzJglS5ZU\/BEDSUlJ1vePioqyaV7Hjh2\/+eYb6fOFCxesv5Kbm\/viiy9euXKlNo+rRllZWfv27b\/77rua\/qkAhTEPCU5u5MiRO3funDRpkhBi586d4eHh0vlff\/3Vy8vL39\/fcuUDDzzwyy+\/1PK2LVq0kD40atTI3d39rrvukg69vb3LysqEEBcuXBBCbNiwwfKVwsLCn3\/+2fomZrP5xo0bnp6e0mFKSkqDBg1at24tHfr4+Lz11lu1fFw13NzcGjRoUFhYWMu\/GqAUAglObsSIEWvWrElOTi4oKMjKyhoxYoR0\/saNGxqNpvb3qfF330ZpaWmDBg2Cg4MtZ4KDg63zrzKz2ezmZpfXuna6LSAvAglOzt\/f\/6GHHvrmm29yc3MHDRpk6Vs0bdq0oKDg+vXrljO\/\/PLLfffdZ\/N1Sw5J9QW1p9frb9y4ERoa6uvrK52JiYlp1KiR9TVarVaj0RQVFUmHzZo1Ky4uvnz5so+Pj\/ToKVOmPP\/887f03CoVFxdb+mGAavHfTXB+o0aN+vbbb\/fu3Ttq1CjLyb\/\/\/e\/NmjVbsGCBVCodHR0dHx8\/btw46y8aDIavv\/66vLz8+vXrb7755i09NDQ01GAwvPbaa9JEqO+\/\/37atGl5eXk2l3Xq1CkxMVH63KNHj1atWi1btsxsNgsh3n33Xemt0q3\/jf\/i4sWLZWVllpFAQLUIJDi\/xx577MqVKzqdrkePHpaTGo1m48aNqampXbt27dy5c1RU1OrVq6Xl4CwWLVp07NixTp069erVq3PnzrfUyXBzc9u0aZPRaAwODn7wwQeff\/75F198MSwszOay0NDQ+Ph4y+G6devS0tKkJu3Zs2ft2rVShfqdiI+PDwwMDAgIuMP7APZWr6KiQuk2AEoqKSkpKirS6XRV\/ml5ebnRaGzSpMktvXCyZjabjUajr69vlS9yjEZjaGjo\/v37\/fz8rJt07do1aeDuzo0fP\/7RRx8dP368LHcD7IdAAhT2zjvv1K9f\/7nnnrPHzZOTk59++ukDBw5otVp73B+QEUN2gMJmz569b9++3Nxce9x8xYoVr7\/+OmkEh\/D\/iWVaEZXJSd8AAAAASUVORK5CYII=","width":470}
%---
%[text:image:97c4]
%   data: {"align":"baseline","height":196,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUEAAAEXCAYAAAAz2fbbAAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAgAElEQVR4nO19f3xU5Z3ukzCYCRKcSQEnkcSEpNWsorAY0E\/SCmo37lbY6i3V8V5Xa3uhJW1ttbexXdqmV7o13dVd7jVppbe17fYyVvaKJXZrWlvATYoQaVB0I5qQOJHMCJgZk8ickYHcP06+Z95zcmYyP97vyQ\/O8\/n4MTMJ7\/uec973Od8f7\/t9csrLy8dgw8Y4zs1bCOXy9bjA3wHHqaPs\/Y3Wfh2xhZfB9cxn2fv6oLQG5+Z9CBf4\/4Tc06fY+7MxM5Czf\/9+FhI8cOAAtm3bhn\/8x3\/EJZdcwtEFC6bruH2dQZQWOlFT4TL9vaxxD4QUbPr9GHJPn8Kz95Rk3E4q2H+kFw91FwMAHv94DkrcTra+BkIKvv8fI+hX5mfdVyr32tcZBAB4qz0Z9yMb03VuTwbucTuuvfZa6Y2KuOSSS8DdBwdSHbd\/SEFpId\/iJXz++f3w9ynYvfpy1FaaEyGQ\/f2O9YSB33fh3LyF6JtTxrqIYwsvB7q7tJ+v5eyrJ4z+36t9FX14Oa5Ncg9TRaJ77R9S8K9P7UdpoRPbpuHcn+1rMl3kSm\/xPIJ\/SEG9rxv1vm7L+mxq67Osrx0HA6zti9fS3hOyrC9O0JywCk1tfVi+dT\/8Q4plfc42sJGgx+PB3XffDY9n6twBcknSQTrjLi10YiCkwNcZZJ\/45AZ39IZNFzTH\/e7oDaO9JyytvWTI5FmlivaeMDp649cxEMqOMJLda19nQOuL070HVAJsausHgJS8kWzmiFXzwAzcXMJKgn\/3d383ZSRIxLSuuSutf5fuuImcuIlQnORNbf0TJqWs+20kCC4Lyj+k6IiJvuOA7GtIdK\/be8IaKQFIGrbIFiIBJooTG5HJHPEPKWhq68P6li5LvRAR3FwyJe4w3VjOtwvFsjp6w1i+dT9bX7WVbu1nTiIsLczXff7ik7yWJ5EulzUoEp5o5coGWYE1FS7W2K1\/SJnwTIzPTBZEAgQAb3URSz\/+IWWc\/PpRWuhk6wfgNyKSISEJcsYYSgudaGrrx\/qWLqxr7mLri4iQHiaHy2VMHFhhERJpcPTjH4oAUInJW+2Bt9rDQh4DIQWrL52PlZeobTfUlbG4j+riVZ8RtU\/XKBNkJYlky3E9RgIsLXSyWJzGWCPXS0SMq1sZfhFhSoK+ziCWb93PakE11JUBiFtqHKZ2Q1257jNXEkMkQm+1h+VhEvGVuJ3o6A3jsTuq0OytktoHoFoVuzevAKDOg2ZvFcvk91Z7sGvTMu1zQ105y2IuLXSi2VuFjt4waitd2L15BYtF0+ytwmN3VGlWJ\/UtE\/4hNf4szjfZREtemki0gHxrk\/pZvnW\/ZpzUVLhY5oB\/SMG65i4U3r\/H1BAyJUF6iGRBiQOVhYa68glxLtmka9xXV1Phgq8zKP1ayCWm9ndvXiH9YdJiJuLzdfJkbsmyoGuaDVnHuDXjRm0ln1vs6wygtNCJhrpyNNSVSe+ntNCJ3ZtXwNcZ1Ob1navkkpOvM6CtDxq\/bHLydQY1N5tA81smfJ1BrGtW+aujN5xwn60pCdLNJpDJKpsMH7sjftGlhU6UuJ344pPdUhceWYM1FS509IbR7K2SvveNXEbqiyuATP14qz2s2VTqC+CJ01kNK4icrDRyG41eiCw0tfVp7SfbPJ8pVAJXx05WpuxrIW9MfEmIXJAN6Dmsa+7SXGyxD7MXU8KYYG2lS3NZacAlbqfUBV5b6dImDd3w3ZtXSH2Din3UVLhQ75NLsoTDW65DbaULzd4q+DqDzEkf9e3PTYSlhU72\/XtWoKM3xBY7i\/ehPm\/O5AEtcAodHN5yHYvL3dTWp70EOVzUZm8VStxO7aCBzD5KC50a+Yn3xlvtSdhH0uxwQ125LiA6EFKkvxWavVXwDynaADliduRGttav0IiQC95qD2oqXKzbCYjYuTczy7YypgrtPWH2PXs7DgbYYlpA3BsTEz1cfQDxNSPbRfUPKdhxMDDOJWUA5FuaZEgRyU7mak+6RYZIqqbCpVmCsuN2zd4q1FS40VqvuuDp7u1LpQ8CBcll9yGioa4cHb1hVkvtzlVF6OgNs7t63NamFaCkCBdoz6Ps+JyIjt6wlhDjgq9TJScKhRGByAKR7EBIweEt16Gmwp3UQsu0j\/Ut6tqml4UY2jPDpCRI8cHSQqdmScnebiLeCC4iJND1JDp5IQO1ler2Em6LE+A9DjYbkiNiUoQLFKfjttBkE4aIprY++DqDCeNm2cJIgACF3ORZgZRtbqgr00IFxgSsGVLaLC0OlkxkzjOz3ERI8U6zkxeyQOY3NxFyWmqzITnCTeBiQoQLYjKEA3TShYtkzQhQdvtE4g11Zdp9aqgrT+nFlNGJEW+1R0vVcxEVNxFSvHN9C99mbe4kiRUJkpmeHOFOinAnRMRkCJeF9sUnVSuTg2StJMBMryHjY3OUnRoIKWybqrmJkDtRwp0ksSJBMtOTI9xJEc6ECHcyxJgI4WqfkwDXt3ShozeM3ZtXZEziWZ0dpvga7e+biUTInSjhTpJYkSCZyckRzqQId0KEOxliTITIhBUEuHzrfgDZb6vLuoACZ8KEwEmE3IkS7iQJd4JkJidHuJMinAkR7mQIZyKEmwDNEiDZQFoVGe6ECScR6hMl8uNf3EkSb7UHu45wxR1nbnKEk7gHh2PYdSTMFi7gTIa094TYEiGcBJgoAZItpJbSEhMmtz5+RGbTAHiJkBIln\/7p6xgcjklvnzNJQkH51u5R6W0DMzc5wpkUOXRcJViOhAhnMmRwOIav\/FsPSyKEkwAHh2NZJ0ASQXo9QUqYBEZi2Pg0n2vMZW3WVLiw\/SAHUXnGCyzIT2JQgoQWpmzM1OQIZ1Lk0HGFLSHC6WZvPxiGw+FgSYQ0tfWxucDbD4Zx6LiSVQIkEXLGxsZY1ObeGAzj5MmTWHlZCZxOntQ+x5aBNwbDmBsNoaioSPq4OUWZZIybAv0lbt5ztgRFUUscHTquYOjRtez9AVRkNZTVQlIUBYFAgGWOEDjmCo177MJFWLp4vtS2Ab75rSgKDh0dQFFREcu42SpLlxY6UbzAwdU8G5lwVh+eCW3X+7otK6M+OBzTrFerEi9UK2+6J3o45wrXuuQeM9e4bbW5aQ7KhFkJqyr8irFXKxIvRsElbtA2jpm8xeh8gE2C0xz+IUWrjGsluDVMAGslNymzaBUoSaA+P\/nl\/G3Ig02CGSBegpx\/UdE+Pe7KN0ZQhtIqcPdFG4+tgii9yVm8gdDU1jdlQkUzHTYJZoDSQid8nUE0tfWzE5OYIeSsfGMGzkVlpeSm1VagmRgSF0RNkJm4l3M6YNaRILkh3JYFZRdJKIpbnY\/AWflG7E\/UU+YA3a\/iBQ5WyU3Ods1AL0eC7Jp8IkRJTEB+cVIjplIWkxOzjgQBvfA6t5wnEJ+MXORkFIvi7AuIK9o11JWxxrMeuHEJigrUjB+X5CagXg\/dQ849j\/QCFvvguqb2Hv3Ll7ueoajZMRWymJywnAQp28nlnqhHjcoA8Mp5AhM1h9W3Msf547iaHaASBqc8JbVdU+Fmsy5qK1144MYS7TOX5Cb1RSc7GurK2WREzcq4c22mXt\/SpbsGDnIXZTHj8U2+ijmiQJKVmECC\/iGFnenVm9vPqjdsJucp27UTj0z5hxS2NzEQl8JUdW35Au3ikaSO3pl3VC4RxCN0nM+JrGgiQ45nVVqYD2+1R+flyD6+Z5UsJhHt+paJ6nAcMOO3CbsPqcgomdfe6iKpb82GunJtvxaRIcd5wIa6cp20H9X1k7kA6LgawT+kMAmie7Rxq1WA+1BbKb\/8kYiaCte031CcDqwQWwL0R964yJZqSIoqjbKts6a2Pq1tmgcy16dq+QUmiLxzES3pKZNekrh+JliCVLtMtNZkW2zGi1QFnORmWumsLk0U\/xDPmUaqJUd1CblNeaofyG2t11a6Zs0mX8pEcx8FpJc7pxgSoK8DyFVpRuSBmgr1ZS+T1M2Sl0a982xAFiaJr9MpIbP7NYEEaytdpgMhQpQB8WJJFN1b7ZH+BjDKeXJsZ\/FWe9Bav0K7Jn7NYX5JT0B1uQDMiiC4FWJLQNwK5CRbyj5TyEeM4coCEchASPVsOKR2qWoTEM+gy6xtSLVNRfea+jDeL9PEiJEIEzFoNqAafpSF5Ei\/0yTxVhexV6gG4u4xd\/bWCmswXkdw5scFrRBft8IKFAutcivbxWUxXdKTVuSekvFD8XSZfYgiS0SsifpImB2urXRplpm6VUKRrjkcF3fPZ9Mr8VZ7tJtgBRFSOS5OS80qa3C2xAWtiAdyW4Gi3ghH3FnsQyyHJXvrjVEXpLbSrRGtLKjWslp7kETYkxVhTbpFRk1WqFYaaYmsb+mSSiKt9Ss0ohL74LJyrCBCK+KDVliDsyEuaEU80AorkFMPBOAviQ\/oi4FQPJPCSTJAhhrt1dy9ecWkBAiksE+woa58nLFdaK1foelxcCjMkV5JQ10Z2547wDqBd165TX5rcDbEBa0UX+ciWmMcUDasksVUr0GOLogRtKWHSu\/TXtDDW66b1MpMabO0OGCqHM1hFRKIeDnP5loh8M4dH+S2BmdDXJA7HshtBXLHAadKGF12+6L1J\/aRCtlmdGKELDZOq3A26RpznljhtgZnelyQOx7IaQVyxwFnii5wIiSy\/tJFVsfmuK1CK+KEVukac8UH49Ygj7U2k+OC3PHA9p6QrQucAGbxP1mYzPpLF9J0h7msQivihFboGvMpzanW4CN\/eFt628DMjgvy6w73s1mBnHFAK2QxueJ\/sqw\/EQ5FkePqXLPEiRe\/tgL37XwT61u6sPrS+fjnugJEInKqkNx3fRFWXuLEp3\/6Otp7wtj5Wblv352frcKtjx\/BrY8fkTpuQL03qy+dj\/UtXXh64zJcWyZXLObTf7kQ9+3swYG3nKhzya36cusyF+p9wL6jJ3HNEvnCPwAQi8Ugax6K2Hf0JIoXOHDNEqfU9hVFwYG3RnHouIKn7r1c+tgHh2Oo93Vjw4qFuHWZS1r7iqJgIKTgoT3dCIzE8NKD1VLHPjgcwyN\/GMC+o6dw3\/Ue3Hd9kZT2ady\/eKUP2\/YFcesyl\/ZykNF+zrFjx6SrzR06rmDj00HcUJqDrTd7kJeXJ63tweEYNu0KYuUlTjTetFBau4SNTwfx4YIP8OWPXSx13NT2ykuc2LRavuWw8ekgaj0f4PaV8sfd+PwpFBU4pI87Go1i49NB5OXlYftt8oP+jx9QZRpltx2NRvG\/XngHLwzmovXuJVLbBtT7fei4Ir3taDSKLc8F8Xp4Duu4H7\/VI1UUSRz3LZfPlz4PcyKRCIvk5rETIzh16hSuWipflnBwOMamPBWJRPDOO+\/A4\/HMqHEfOzGC3NPvZjVuTklQM0QiEXx026sYHI5h8B949qYlQntPSCtRli445wiBY67M5HEf6QvC45FbzIXg4LoZSxcD+WdH4XQ6pd\/wpczrNC8vb8aNe+liIBDI\/H5TEJtro6wZBodjmuLcidO8ZehF+IcUfO2ZfpS4gxlv1OWaIwSuuTJTx13idqKokGfcs7KytI30QZV2rCxoeeCtUe1nK0vgN7X1zehtPzbkwibBaQiOc9qTgaww7io4InYcDGg\/c0tuxvsJT8mWH6vV+2ykDpsEpyFKC9X6itzVaBLBCs1hABgIxa0xKwjCqDpnlfvt6wyyyjzYyA42CU5T0BEp2hPFDZEQrJCoJFF543ecELWAAWtIUNQDtqKytY30YZNgGiDVLStF1wG1Cq9VRVTVn53s0p5ERlZIbgLxSulWZr+N+sPckpjUJ6fK4myETYJpgI5hUZVt7qKmRrEoK5IWYil10V3l6EeU3Gz2VrHLYZLUAt1Xkfhl92UmwM5Zziv+gu7HQGiilW0jMWYVCZKQChdEpbK48DVv8QLxZyoWyQHS5qWzwmJlXg6UFjp1kptG0pcNqpZO1YxrKlxs7mlHr5p8MT4\/Dlgpiyn2OZuSPDw7d6cA7T1hnboc1yJu9lbpJgCXWh6gusS0mEjGkYuYaivjClxNbf3o6A2jtJCPBKcCcZLg01MGVEKnoh9xDR25kpgAtBJV4oufs\/K0rzOIHQfjcdUSN691axUsswS5t32I8pe0340rIydOMqqOy\/FmJOuIJEPFLSWcqKlwWbZlxUrsOBhgt5KA+FyPu908ZEFlwkQLmqte3\/Kt+3W6wLI1QcT+SFbWKpfeMkuQAtNAv063QOZDa61fgXXNXdqDoj6b2vqlVrPwVnsMe9zCbCctqAxRe09Yc7+5A+x3ripCva+brZLxVIDiuQ11Zex9UQksM2UzmWioK9fIoqbChYGQItVToDlHOh0E2dYmPZv2npDOmCgtzLfEG9EsQf+QgsL792D51v1aBlSm1WaMpxE5UZ+y+jKW1lFd4zLpi7mhrhwdvWFNd5izVD8QV+fjztoCYkXpmVc+KxFEV5gTNLe5LCV9P3pZTNl1DWnNkn43IF8bmHSBjTrEDXVl0gidrEtStCy8fw8K79+j\/V5nCVL8gpgZ6AcgL8ZGbw+j6ygzQE3aomI8Ro2ruaVOSgq000RZ16wWlZUlGmOGhrpyzVWg+B0XyCXmTI5YCStcYbESNKe1bqwHqIoJyZXFpH7E+B8AqdrAgPmLVlYZfjLkzPog67a00Bm3BKl4qdmkV8+VyqlTJwb3KYYneyuGmAkUK1PLjg+Kk84KFTsgboFy7xu8c1URe7bdKlihOAfo3WAuWCGLCcQrQ5e4ndqc47BuiQPi4TH5OiRGGIu9TkiMNHurJsRNZLtFRISU8eQgKdFSo8rUnMJNgDVEaJVbPJtcYitcYSvcYCtkMY3CSGQYydQIEZMt5M7LFmKil7e6y0FMHE3sY05jY2OjsQFVENmtiRd\/\/mNLtBge\/X4yxGIxjI6OoqCgAA7HxPzLJ5YtAgC8F4lpbjJtN3kvEsu41psIvUqeek0\/+J3ax5XFBaZm\/WTjngxkQfk6g1q8UDZqK92amU99ZDtuM7T3hPFeJKY9K9mIxWLwdQbhcDjY7hUAfPOZN1Fa6MSDN8tZYMZ7TeSUkwP88t5lUvowQgYBTjZHaO\/rq4OjeOyOKt0zkeEC+4cU\/OiFAdz1xKsYCCn4\/MeW4Jf3LsN7kVjSEEI6c9vYx99cuRClhU4MKzF8\/mNLTPtIuEWGLCkA8FYXjet3lmnJDBlWW0NduTaohrpyHN5yHbzVHrYTGUZhqJmqawxY4xbPBpfYCleY2w22Uhi9xO3UPCiZoGsg7RHRslS9m+xeUKJ1SVYl9UFiWAn7GEsTb70bGXv4uWNj7q\/+ccz91T+OPfzcMdO\/i0QiY8eOHRuLRCLpdjH21ruRsVse+3PS9rMFXcMtj\/1Z93024zbilsf+PKF9maBr+I83Q1LHLcL91T+O7TgYkNomIRKJjN30T39ivUc7Dga0eyQL4r1+690I6zyltXD1Q3\/Kui2zOULr+eqH\/sRyDSJfXP3QnzJ6DsnmtrH9h587NvbWu+mtgZyxsbGMyuurR2cCmots9LUVRUEgEEBRUebl9en8JQV+ZQdMxX1QtKdLxrhFkDXIlTWm9nd+tkrquMX2uU4hKIq6RcLpdLLfH5nt0xw5k+fGA7v6WHV7ZVqAxrlN7i8A6XsaRX7Idv2arUmz9r3VmZXfz\/jECPnwHG4ygdtFtsI95naNud3imewSc7vCnG6wVbrAHO5vMtdXRtuJ3N5M45ZSdIfNyPCRPwxk2\/SE9jnIStQ1bmrrx62PH5HWNoGTCClbvG1fEIeOyyeqmZwl5swKDw7HsG1fkCUbzEmAg8OxCdlfWfv+jFnfbMlJBI1bJvkRpB2bi2+oLtLM1L2vO9FaLyfrR2QlliiS6R431JWjpsKN9S1dePyAA42flJutpCN9VGxBJhrqynHsxKgmWiQbM3nDNNcG6UPHFbZN0WRhcliArd2jeK6H50hfU1ufdjRR9n1pfP4UTkboJIlc1bmMY4KE6J49ONPdjdirr+KDl15CTl4e8m6+GSerliNY8RGsvKxEukIUuWYc51rfGAxjbjQkPbbGjZk4bkVRUPxNVeVu6NG1Uzya1CE7bmwVaNxjFy7C0sXzWfrgkG1VFAWHjg6gqKiIZdwZW4IfdHZi5OGH8cGBAxN+F\/vhDzEPQFl1Nc5+97vAVVdlM8YJ4DzUX1roRMCaYi1Skem4rdYaFiFarlM5jvMNXNrXAN\/aLF7gQBHTuDOKCY42N+PdW281JUBd452dGN20CWdeey2jwdngRb2vW8sOTgV2dp3Ufp6qmKN\/SNEO8Ns4P5E2CQ5\/97sY+f73U\/77cwMDCH3mM4j12Upb0xFUyWMqIGb6p6J+ISUgzESfbJw\/SIsERx59FO\/\/+McTvp+\/eTNcLS1YtGcPCnfswPzNm3W\/Pzs4mBZx2rAGdDSxozc8JUQoWn9TUa5dVJ\/jPLZnY3ojJSc7+sILCG\/ejHNhvcviqKzEgm99C3k33hj\/7sMfRt7HPoZYbi6Uxx7Tvlf+\/d\/x\/k9\/igvvvVfS0G1kC1H3gvYaWqGIBpjLa1oZFzQKIdlymOcvUrIE3\/v61ycSYHk53E88oSNAEflf+QrOfuITuu+Gv\/1tfHDwYIZDnd2g2JSVAt1Uup9gRcFWgq9TzeKsvMRpieSmvu+goYKxdVoZtJeu8P49lt1rG8kxKQkqra04+\/bb+n+0YAFczc1wlCe3GmIbNyL34ot13w1\/61sYO306g6HOblBcygo5TxFGRbT1LdZo1nqri\/DAjUu0z9ySmwQS5BItP6usQPEkhY3pg0lJcNQkBuj+8Y8xN4VtL2OFhZhnqNR15rXX8N6WLamP8DyB1XKeBLIEiYCM8gSc\/VopuUmorXRNOAdtlfCSKIvJXX7fRuqY3B0+e9bwL3JxQU1Nyh3M\/fjHMf+rX9V9F3nqKYz8wz+k3MZUw6h\/wAXj4iSrkFfb2K25gx294fMiNlbidmoFfVWxeb5iq0R+RiF27tgraQPPJn1gLkyaGCl44AEM\/d3fxb\/IyUm7k4IHHkDs1Veh\/P732nejLS3I\/dCHcOGmTWm3ZyXEydTU1jcuPCNXr0REs7dKp5\/srfawC8rT8Syr9EumGiSHqVYe4T0S6B9StGdIViCnip8qKBTQyI\/kWu2N6IkxqSWYt2aNlI4u+sd\/xNyrr9Z9N\/zQQ4j8279l3TZn\/ExU16KY3fqWLs1Ck01QpO5VU+FCiVuV2uQS0zbizlVF49KHszdgTxW5OXVARDTUlcM\/pGAgpGhkJJt4RXd7fUuXjgBlCyOZ9T3TYZn4eu7ChXA9+ihyF+lLtQ9v3YqxDz7IuF2Kn3FJhQL6KtuEErdzXHJAvqtqlZynEUTAVmaorQZZgVbE48RqMGKFY9mgqjBGQpIddxSF0dc1d0mXy50qWCK+Tm+mEvfFWNXSgnc3bNB+d+7UKUR+9SvMu+uujNtPJhUqq1oGBdTJVe3oDaOmIvuy4In6slrOk0DC6+09\/OpsVoOsQFm6ucmQqBwWxz2lqipUYFSV4JRXycXXGcSOgwHTLUzGbVYyQDslSIXy1mW889AhdspxQQAmnMu896o78MArT2qfld\/8JmMSpBJb65q7Jjwk2W6Ht9qD9p6QVs+MXGOOskRGOU+riNBb7cGOg4FZGRu0ygpMRIAc8UeKVVP7slXbgPgWIiJYgrfaIyVUQ\/wgxk0JpYVOrLykCnOz7iUOugb\/kILaSlecBI0H6TXFedcFeDzLTndvXqG1746OYJGiv9BzQ0NZ9oAJtQYBjFe2lfv2bfZWaS+Nw1uu04oQ1FS4WAnKSiKcjdagVVagFaJI1A\/V7aTS9ZS4k0mAKjGFUpKuzKaPgdDE89tiTDPTyk5kxZJVaeyj2VulkiBlkEQWpj+uXbogs94F1Fa68PKnXGjb9kusPvQcFirv6X7\/evXHUZt1L5R1y0e9r1srpklSoTIfmkhCrfUrNK2S5Vv3s1iFYl9WEOFstAatsAKtIkDR+hPntcwEmpmGh4qwVKJt71HJ1WgBikaFomSffDFL4FAMPBeIu5Rmb8knO99Jv8dz53D2P\/8Tc559FpGHHsKpujo4Pr0On+j41QQCHLyoCP91+C+k7YcjoWgKRnNqoBCMWiUzXeAdmF2ZYisywlYKo9NLXqZ2h7EPYxl7IlhRJldGH+tb1DAWkay6h7Is65c8bW0zi2VSH3QwYEJlaeMboHbpAvz91+u035\/LzcUvf7xPryzX2orovn2I9fXh3IkT6ZfNWnwxnrnpXvx97C8AUFbLLTWGMpk6HiHbqsFmCnYcMKqocVQ75lbKs0JtDlCvQyY5mam2cROgMfaXCRElmyMy1dsSQdzDSN6nt7oItZUu7Rnt3jxR8yTVuU0xRZH4RC83UcIoYXl9ihPeec1i3PW567Xvz+XmYtmnfq518M9vPonL\/\/D\/MrsrBpz73Bfwy+vu1NL9HFKbVkiF0qKgDLIVcpIcJOjrDKLe180ixg1YQ4L0UpJ5DeK9PnEarARoFvvLlJi4pSuTjd+4ptPpYzLyNiM+sQ96gSQySibXGDl3DoHS0vjnOXNwpusofJ0BBPbuR8O\/fj2lCwGA3EWLMDY6irFIJOHfLGhsxIWf+5xmMtP2GtnWYSIylEkmVliFVugOAzzWoFW6w7IJyirdYRnWnwgjeXOSXzKrL5txk+U9GfGlg5xIJDIpCYY+8pH45zlz4D56FABw5re\/xeiXvpTwn55ZvRr5V12FvJUrMXf1auQUFKi\/iMUQ6+pCrKsLkR\/8QD+gBQtw0YEDyJmrJsWJrHZ2ncLgcEy72Puul1MEk9rftk8l2wduXIL\/UnEWF198MfLz86W0f9\/ON3HgrVHUVLiw87Py41IkE\/rPdQXSxk3Y2XUS9+3swdMbl+HaMrkiN4qiYMNPuuFwOLBr0zKpbQPAi\/2juG37ETx17+VaAVkZUBQFrxwL4KE9YQRGYnjpwWppbQOq9srOrpj+GosAACAASURBVJOqBOwyl7RjdjTuPQPAtn1BFC9wYMOKhdLIj8ZNVp+s9mncPaNO7DoS1ohPVvs5x44dm5QEndfH3WHMmQNl717152gUF\/zP\/4ncF17Qfh11zkPb1X+NH7urUXblEmy92YO8vLyEzee+\/jrmfuc7yBkc1L47841v4Ozf\/M2Evx0cjmH7wTBau0excZULm1bLs6wGh2No7R7F9oNh3LcyF7evvDjpuNPFoeMKNj4dRONNC7GuSr5i1pbngvjIgg+kjxtQ5Q5XXuKUPu5oNIqNTweRl5eH7bfJ30NHz7P17iWT\/3EaiEaj2NN9As0v50hvG4iP+5bL50ud49FoFL869A52vpmLWy6fj3VV86WKLj1+IIxnXx\/V5srKS+RYldFoFFueC+KP\/jEUL3BIH\/vkliCA8JVXYkxIU7u6uuJWHYAze\/fi3PHjyC0qwtwbbgAAHDsxglOnTuGqpZO7Z8r27TqL0LFqFQp27Ej496RSxqGadezECHJPvwuPxyNdTnFwOMam9BWJRPDOO++wjJsLkUgEFQ8dBgAM\/gPflhLZsOJec8wVGnfuAr6yZVzjPtIXhMcjN1FDcKTyEB0f+QjOvPJK\/POJE5grnAF23nzzhH+zdDGQf3YUTqdz0oky97bbdCR47s03k\/6bpYxrfOliIBBIbdxpt83MTXl5eSzj5oIouXniNK+Uqmxw32uuuZKXl4eiwpk37hK3k23cKRVQMFaQPnv8uNxBLF6s+zwmYXOkjemP6SC5acNGSiRoLIGlPPec1EHkOPTm81g0KrV9G9MTUy25acMGkKol+Bd\/ofus7N4tdRATLMtz54BJdu7YmPmYaslNGzaAFEkwr1Z\/sndMUfDBgQPSBhHds0ff3w03ZFTB2sbMQSLJTRs2rEbKRVVz5uu3R0Tb26UM4GwggNM+n+4751\/9lZS2bajwdQYtl\/OcDL7OAIoXOKZEcnMyiLKYtoU6+5EyCToqKnSfZcTtYn19CH\/pSzhz5Iju+7zxbTY25KDE7ZwSOc9k8FYX4f4b9JKb3HofqSCu9NcPwBZlPx+QMglesHq17rNDPEqXDmIxRNvb8d4DD+DkRz+KD158Uffr+V\/9KuYUF2fWtg1T1Fa6NGuLFrlVJfsTobTQqckHADwFR9OBWNmE3HJbFvP8QMq7Go2kd3ZgILV\/ePYson\/4A8688go+eOkl1Y02yniOY95dd6HggQdSHZKNNNDsrcLyrfu1zx29YRTev2faWGBTCWMxXsAaWUwb0wMpk+CcJfrjQTG\/P+nfn+3rg8PnQ\/iZZzCWQuXo\/Ntuw0Xf\/36qw7GRJqiGGi12OoPd3hM670mwtDB\/giymVWLwNqYeqZNgSYnu89neXtO\/O\/Of\/4n3f\/QjRJ5+Gg4Ak210ybv+euRv2ID8T34y1aHMClCJfivdrYa6csPevLAl4k3THTUVLq0Ee02FSyvIaxXI\/bZJd2qQOgka4nQxE3d45NFHMfroo5O2NbeqChd89KNw1tVNiDWeLxDLeJFVRhYJJxrqyrX6eiSdeD4ToVEWk+oncvepVu0OGUTZ5Qok2UgNKZNgTkEBcgoKMDYyAgAYGxnBueFh5C5YgDMvv4zh730PH\/zpT6b\/dk5JCfJvuw1zr74ac6+6CnM857f7BajZUSr7TplbQC3QyVl\/kKRDaytdqK20TrxpOsKsIjQJpHOgvSeMLz7ZbbofUn0RyikPZyM9pFXuYW5VFT44eFD7fObllxHr6cHwt75l+vfnVq9GgdeLBZ\/6VHajnAL4hxScOB13U2QvDCulQo0Q27dSxW46IVFJfE6XtLTQqW25EYmwtNDJVpVa\/P\/ieZAqXTlbkBYJXnDNNToSjPh8iJgcoZt7xRVwPvggTpaV4YKimfl2a2rrw64j5mLTAEy1EDJBa\/0K1Pu6tQq8ZBXKlgqdbAznExFapQpn7NPXGWCVrmzvCaOprc9UvhJQRcy3rLG3\/BiRFgnm3XgjRltatM9mBHjhxo0o+MY3ED17FhmLhaaIpra+hEetst3i0FBXjhOn+yZYaSTWQnoJMkCqV6QjQT\/LlgpNhvOFCK0mQKOGB80d\/5B8kfRk81FbD9HMC1VwrrephE5jRDSfSawY0LtPQ3ffjegf\/jChodxFi3DR1q1wfuITAABlsAeBYAAPv+aCw+HQ2hbbLXFnpy1ReP8e0+9pY3AmbRv1DMQ9ZGSp0c+yRaDUGGEIDXXlKavjJRp3puBWmBNhldocQRYBpnKvkwkYqeXnI1LFy42aGwRxnmY7R0g8LFFMMxvviLRgCOJJndJCJ752rTMrBciO3hBKC\/O1dsUQV85b70bGxE20RnirPTpR5zNHjmDozjtxLhR\/o+Rv2ICChgbM8XgQO9mPE82fgfLaXgw6PFhfZF4hmt4c2cS\/jERhbJ\/aTmeyJVLkogkQ318XniDywvEmtEoqVIRVRGglCcq0AKdaupL6SSQvCajnxY3qdJnMkUSZbIKsayRRNTOCLV7gwOO3erDyspKM5rZZ3J1QWuhUSXB9S1dCdqdsWU2FW2PPcydP4szLLwMA5l51lVYUNXayH4PfWYvYyX6tjUGHB8\/Oq8P2i+5OOIgStxO1la6Mt4iYkaG4MZj6SYUUk00Uyu5R5pb6tYIQrZAKFWEFEVpFgrJd4KmQrqQ+JlNZo2ORZnMwVQvWjPSIC+g7+pyJCNRkxEqgPu67vghzo6GMyBtA0n504utGiUsAE3bRGwdnJMfBxrVQXttrOqhBhwfPlW1CS\/R6re3aSjf8QxEdiVD7mRAjXUNHb3gCUQFIiRQnmyiJYoFWEaIVUqGE2SC+zhEDtFK6Uqa8ZCLyTkZ6tZVubS0CaggqHf3jZIRH65z4g9aO8fpS0R0GzMmOxljiduoSRkTgtZWuibrDxkV2eMt12htG7SAk\/Kwnx6JYECujL6M4FsTK6GGsjL488a5s7cbO\/jz4OoMTJiW1mS0xJktaTEaKsVgMd\/6FI2vxdW5CND6nB25ckvW4zTCTdYe5kiCKouDQ0QE83x\/Dtn1B6eQnW1fXOO6j7zlw6LiSEumZjS3Z2kqF8BL1sXzr\/oQWLI07Pz8\/KdnRNQDQ+hD1v830jxOKr9Mim2zREiHue\/Ewjv7Hcwg4LsahvOUAgI3v\/Rwbh3+u+\/vSlj44FpUlbdPYvhkxysqsmZHi9ts8uOWacilkYiTE3ZtXSN36IpKhzHGLqPd1ZyycnQyKomD7H99EZM58lngqhS9kZ4EVRcGzL\/Vh694wi9vr6wxqm+Zltk\/3u\/H5UymTXqbjnozw0h33pn89gtbu0aRkN9nYEhlOCUkwExzbEK8GPehQOyyO6YtSLt2ZfXecZy3fGAzj5MmTGQdhk0Hmthoj3hgMpx03mWpwuPBWgMY9duEiLF0sX0Ma4JkrNO63ogVYc\/lCqW0DfOfhyRI8k+dmGbdUgVDnFWu0mKCR\/Oj3MsC9q39ulEcbmHvczNsybRjApSEN8M6Va8t4iJvjZBWheIEDRUU84065qGoqWFz\/RNLfK6\/tRSRB4sSGDRs2pgJSSdCxqAylLX0oWHPPhO8Jgca1NhHasGFj2kAqCQIq4S2qfwKLHulGzjdeQPG\/RlDa0odFgpVoE6ENGzamC6STIGHu4jLAHa9GXbDmHpsIbdiwMe3ARoJmsInQhg0b0w2WkiBgE6ENGzamFywnQcAmQhs2bEwfTAkJAjYR2rBhY3pgykgQsInQhg0bU48pJUHAJkIbNmxMLaacBAGbCG3YsDF1mBYkCNhEaMOGjanBtCFBwCZCGzZsWI9pRYKATYQ2bNiwFtOOBAGbCG3YsGEdpiUJAjYR2rBhwxpMWxIEbCK0YcMGP5KSYCK1eSthE6ENGzY4oasPTqQnKl2R2ly2ENXqSHQo1bapSOvJ5s8AUImwqHEP8sfL9Zu1PfTo2qzHbEXbojpXaaFTJ3Q\/Xds+X7CuuQsDIQXeag9qKtxStTNmYtv+IQXLt+7XBKBmUtvrW7o0QSZj245jJ0Zx4K1RnbwfobTQOa70lj4JxmIxnDql4LVX+vDS2xPlOWsqXOm1veSTGK0LY2Tvz9TP3\/8K3rj5X\/DiexeZtt3eYy7oLGPcmbYNAAMhJaFkIGmvZjruV46N4rX2NzE4HJPaNgBcs0S+doSiKIhGo4hEItLbBoDB4RgGh2NZtVHido6rEPYDUO\/lhhULcdlFMbjeD8HpzM+4bVUnW982EUC2MGtbxrhp3XKMO1HbMsZd4la5TF0X\/ToJ35xtv3llrPH5U1kN3sbsR+vdS6QLC0WjUZw8eRKLFi1CXl6e1LYBlQTX\/fxt6e3amF3I6X1nZGxn18kJYueAysx3ripCiTt9K0BRIgiHwzj6ngMv9o+atp2p1qzyn3sReqoRh\/KW45Dzak3nWErbjOMmiK61rLaTjVsUnc4UHJZgJBLBO++8A4\/Hwya5+dLbmce1fZ2BcW8l3kZpoROrL52PKz4EXLW0CA5HZi+GRG2LWsDZjNvXGVd7pJDT6kvn4+PlDixcuCijcZMXY2xbdDMzxUBImeCNUtvXLHHiig8hq3Enaru20jVRd1iWWLiZpqyx7WxiayN7f6bFCAEg9uXfYtfpy9DeE8ZASMlYcNs4bmNMMJu2jTC2DQCt9StYxp1N21yY7rrD9b5udPSGNWIi8W4Z416+dT8ATGhbBigmSC8+Wr+yxp0otpYtErXNPW6p4usirJjgRiIUkyWZYrJxcwqoZ4PpTihmmIljBuxxWw3ucU\/rfYKTYSq2z0xHArRhw0bmmNEkCNj7CG3YsJEdZjwJAjYR2rBhI3PMChIEbCK0YcNGZpg1JAjYRGjDho30MatIELCJ0IYNG+lh1pEgYBOhDRs2UsesJEHAJkIbNmykhllLgoBNhDZs2Jgcs5oEAZsIbdiwkRyzngQBmwht2LCRGOcFCQI2EdqwYcMc5w0JAjYR2rBhYyLOKxIEbCK0YcOGHucdCQI2EdqwYSOO85IEAZsIbdiwoeK8JUHAJkIbNmyc5yQITCTC0MN\/DfS+OIUjsmHDhpVgI0EZcoeJQPoZsiAS4aDDg7HH78SZo+3S2idwitlz3Wsb1mOmzhPucXO1n1C6iXRxJxOAEfVzjXq666rm4\/HLSrIaoFFEnNpu9lahtDB7cRqt\/cBqHLviaRwYduE7Q01Yt\/XjcEjQLKH2Se2q2VslVVSHxKua2vqx\/TYPbslcUC5h+\/W+bjTUlUsV1SE8fiCMKy514K7rspsnZqCxcwhMHTquYOP\/3o+GurKs1QeNMAqRy2w\/MBJD8TfjbQOQ1j7NQ1HJrbQwX8p8b+0exfZx+VRS5VP\/79Z0tZOPLZhwHAnV5uhidm9egdJCZ1Kyo4EBcfWsSCSCyy6KYeVlJTpxFLF9o9pcIsKj9kvc6sXWVrq1m5AuEvVBN3blvHfxkSc3oDimygpmIt5kJD5q31vtgbe6SIpOifE53brMhZvKHBPud7Z91Pu6pSrsiVAUBeuau+B0OtmU8NY1dwGQq7SnKAoOHR3A3reBR\/6gLkyZZGhUZQQghRDFcTscjnGRc+jaB5KTYjKhMZr3\/qHIBEnZyYjRP6RgfUuX6TXSuM\/kuXHgrRFBSVEvWZuIHOmlol5b2YQ1qJFge08YTW19uptO2qfJyA6AdnHGgRslIM3eFGYXZCQ8s\/YTPYSmtj74OoM4vOU6HXknIj1j+4qiIND6GMae+h9au6kQoRXER\/2I95HaXzwPUhW5uAkQsIYEAflEKM7tE6fjFhAglwwBuYSYTAYXwKSkSGRSU+Ea98Qmn2fpEKN\/KKKb19RvMrU5UVo2GTmWuJ0T+m6oK4e32oOct96NjJG+qvEfApOTXSLQwM\/kubHrSEh3g80GmC7hiRCJgdqsqXClRHqJxj3\/aBtGfvIF7fuixj145vTlaGrrw2N3VGkEbgXxGa\/RrA+ZsoRWECBgHQkCcokwGZlwkaHYRzJCJIuK5uhk407UB2BOijT\/\/EOKqVWV6nUkIkYjGurKcOsyN+ZGQ2nN7VTIka4rZ2xsbKzw\/j0JG\/NWe9DsrUqpYxFkwq4b9+PNOqc3SqYwTjyz9tMlVnGinHnxSZxs\/gwGHR48O68O2y+6e7xNl+lElE18wOTkZzbubEjQKgIErCVBQB4RTmaZcJOh2I9xHoov\/5oKl+5aM5kjiUhRhIxrJA8uUfKj9e4lGYd61jV3JSRajQTpCxqAf0jBQEiBfyiSsco83fB\/elGfyR0IxfswPqR0wUXe4kT57qM\/w7a3L53wdxzEp06CCBrqylMmv0TjzgRWEiBgPQkCcogwHYvKjAyb2voyXlfJ+jKzqkRLMds5Qh6jGVGl4yKbYV1zl8YNALRQXGmhE7FYDA\/Wzs943L7OoGm7NNYJiRFZsELtvqmtL2naPBsSPJPnxgO7+iZMqqJYEEsvuzyrB26GprY+NLX1w1vtQWmhM2XyM4470\/ttNQECU0OCQPZEmM69NiNDQLWqZFuJxri+iNJCJ566typtt1IEx3pLBdxcknCLzEwAh5tBSDSZAODY0ddx7GgOSq9bnnU\/xkXi6wyOB20zi7dkOgarCXAq0Vq\/Auuau7CuuYudfOMB+KIJceumtn74hxRp5FFa6NRZUyIoabhlTebWJ+d6m0rMaBLkRENdOT7zUfVnMp1H9v4MJ5s\/o375KBDJch+hmM0mUKLIJkBeWEmEALmlReMvvXjsi36WMYbSQqfuGYrhLQBYPA9ANJR1P7MN5\/2xuURQs9Wu8fS9SkYyzxpTFk8kQPpejcfy7b4XF8f5SIAEIh5yjwHVpeSE8XkD6ha05Vv3S3\/m9PI2zmMbetiWYJooWHMPAGgWYaBxbUYbqn2dAd3GU8pkZ7oJPFW094SxvqULDXVlaO8Jn7cESBAtwoa6cqxv6cLuzStYTseUFjox9Oha0y0i9J2MU1A20oNNghlABhE21JVLzRCmAnK\/SwudNgEKICJUs7YuNLX1obaSz0VWLTTaiKx+x2n520gO2x3OEDJcYysJEFDdLtHqUDe\/9lk6hukIlfTUZ0H3yMxt5UQq519t8MAmwSwwk+oRUvyPUFrotHyhT2c0tfXrMqv1vm7bOjtPYJNglpgpRGi0+GoqXNi9ecWs3faQDhrqynF4y3WoqdBb5raVfH7AJkEJmO5E2N4Td++oMpDszd7pwj+koL0nvl1jqq3S0kInmr1VWtUkGhN3ttjG1MMmQUmYzkQ4EFK0DdiHt1xneSzSDB29YXz6p68DUMdX7+ueFpZXbaULh7dch4a6sqSbj23MHtjZYYmQtX1GNtSjd9Nr6wWd4Tx0PE4yNRXuqRrOBNApDztZMfthW4KSMZ0twukE4+Zd2tQ7nWAT4PkBmwQZYBNhahATEWQZ2rBhNWwSZIJNhJODivWqP08vK9DG+QObBBlhE2FyiNbfdIoH2ji\/4FAUnuyXf0hBMKTA5YpIb3twOIbiBTw5Hf+QgnPRKCIROeOee+0dKFAUjPzkCxh0eIDGtVi05feYe1mtlPYJiqIgKnHcVuDKhdCe4zVLnOCai7IxE+81oI57gGlNAnzrknvcjkAgIK2xweEYDh1X0No9ikPHFdxQmoOt83KQl5cnpX1qu7V7FBtXubBptTwXanA4psr6HQzjvpW5uH0lpI0bl9Xh2WXfweOnLkPjUBNWbv04cjbtACquldL84HAMjc+fwm1Lz2AtJI57HI3Pn8LKS5xYVzVfarvRaBSFF5xFXl4eZM5DAs2V7bfJzYxHo1H86tA7aA+GpLcNQJuHjTctxMpL5MVKo9Eo9nSfwCd\/GZS+fgBg+4Ewth8MY13VfKnzJRqN4n+98A7++Msgihc4cMvl86WOPScSiWRVWZo2vfo6g9p2B5KAXFsCXLU0e80LX2cAO7tOYXA4plVb3rBikZS3DrW\/bV9Q6rjN2vdWe+DdfYMm5+l+8LdSdI3v2\/kmBkIK\/u2ORfB4PFKr77b3hPDpn76Opzcuw7VlckkwEongv\/z4VVx44Xzs\/Kz8qsQ7u07ivp09eOrey3Xxx2wRiUTwzjvv4KttIwCAXZuWSWsbUF9q9+18Ex29Yay+dL609iORCI70BfEfAYcmFXrf9fJ0jQeHY9jZdVKrkVi8wIENKxZm3b447hf7R7Vix7LaT1peP5HGaCoqa9mWxFZPOQS0Sss1FS54q4uk6zJwSlf6OoPaBmDSedAVZkVmusbiNVA9wBe\/toKlBDlpP9i6w3GIc3vDT7qlt0+gsmelhU5T9bh0YbVUqFgw2FvtQW2lO6P9qonke1OVIU2mlQwkIUEq+knanOnKS05GgmYDo4ujN4mVur0ypSvFPujBiOOXQYTGgqgcOgy0CLnq61lBgr7OIOp93VKvwXivOYiWQM\/ZTD0uXUyFVGiiNW3sIxlRpaLul4wQyRhJ9CKZQIJmNyUTecnJBr6+pUtTqOK2+ozXxSldaWb9mSEbIjSrCM1BgpxWIDA7xNfpXnMSISDHKpxqqdBk1iERfaZ6yeI1JJMhNbsuHQnSAjaWEMrEIks0cFJVo5tA9e1kWn1EEq31KyyTrpzM+jNDJkSYqCS+bBLktgIB60hQtjWY6F5zE2G2VmE2UqHUd0Ndedb30Mw6TEZU2eglJ5IhFck2Z2xsbCyZiHlNhQt3ripK25dP5McbVe1lW31WSFcaTfdUrT8zpEOEyTRBZJMgtxUIWCu5KZOgkt1rbiIEEluFk8W+spUKJZGoZm+VtLPoZmJjAHQkn83c9nUGdSE8sz5yAbWih5EAZVa6JffXjGT9Q4p0AgTUi\/d1BtFQV6bVzZMnkh7Qim42tfWh3tedcX2+VDdUWymKRG\/Px+7g0ZGdCty5qggdvWH20lhm4k2yQZVuStxOrG\/p0vrydQak9UtSoVRRp6mtXwtXyaz4Q2vSuDZJfCrb5+Ufipi2T32094Tj7nB7T1gq8YnsXfzN\/brfieJCQPaizYmszBK3M23zfbK3Dr21aipc2tslXevPDMkswlQIUKYlaIUVCFgvvi7LSkvlXlthEQJ6q1CVS0gs6p7pHEkk6p5toobQ1NankZ2Z6yp754Ootlhb6YqX0uI8u0kkV+J2StdSICvTGMekzzLrwZGlSaXpaypcUmIkwMQyXIe2erFyiw8ni661VBaTrMDdm\/lJyWrcuaoI9b5utPeE2c8qG3WN\/UOKVK+HUFupeiCiF6TO0Xz28mkdvWEpus0NdeWa4BQA7V5x1XI0Wp+W1BPkfBh0w8jyq610sai4qXG\/fq1PAOOCPAFpfYlEWBwLItC4Fs+VbcLARXdbpgpHanSzsaCBt9qDHQcD7GpyBJEIiYA5Ek0dvSEMhBSdd1Lv69bWQ7ZQdYvjRN7RG9JeluRSyrwmo6HEfZxyxhdVpTch56Jt7wnrRIqAeMZc9sH\/0FV34PlVQdx08BsAgJv7H8cti9oQeuoeuD\/9Hal9GTGbrUCCldYgECfCHQcDbHKe3uoiAJgQc5ed3RfF3EWp0Jled3FWVJHhnszrW9T4DhHf7s0rxgPGclxhER29YTwYWI1DeVdr38VO9iO0sxHHNuQg9NR3ETvZL7VPwmy2Agnqi8tlWSn\/el83u5wnJTGGHl2rJTIIX3ySVzVvphMgMAssQStAMU3uGIsoi9l64c1YGX15wt+EdjYitLMRBWtUy9CxqCyrPtt7wvjik+r+r9luBRLIGqSAfCZbwFKFuE2LUO\/rZu1PjbGVj+\/Di8wKouLErLAEuWGVRodonTx7YZ1aeisBRvb+DP7N5fBvVs8jZ4qOXlXxbcfBwHklLFRT4dLcf9pGwQHaZmKcP8bwCgdk7Fo4H2CT4DQBbUQF4rKYV2\/6\/qT\/LnayHyebP4MT91cBobfT7re9J6zt1C9xO3XbFThhJrlphdi5aG1TEoG7X3HPHW0Ls+U8pw9sEpxGMMpiUrY4ERyLyrT\/YrEY4F6Sdp\/ivqyO3vD4eU7+mCBJbgZGYprkpq9Tfk1BI+gFI163VZrHpYXqfkiS87Td1OkBOyY4TVBa6DTdBlOw5p6E7u6i+ie0DdW0ETYdGC0gjkPziUCl9QeHYwBiAKwrsa9mN8t02VQrs5y2nOf0gm0JTnOIR+oA6BIh2WqWiCRodfxoqiU3G+rKdWp3ZmdLOWET4PSBTYIzAKJbnH\/FGmniTeR+lhY6sz66mAmmWnKztX6FNgYxPmnj\/IJNgjMA89fcrfssS8WO4lJTtS1mOkhuNnurUFrotCQpY2N6wibBGYD8K9bAaSivZSTC0MN\/DfS+mFa7lLGcKtdsOkhu0kvAigIONqYn2EhwcDg2HvSWD863NteYgezGXTBuDYoxQSMRjj1+J84cbc+4D6txzRInihc4pvyUyvkUn5uu83sycI5bOglSjb1rHu7E9oNyg83U9vKt+1k2m\/qHFNy2\/QgePyA\/SE770zI9rkWEV7B2omsc8f4QmxY\/itYL63By68elC7yr21d4tpEUFTjY4oFUUZoDrd2jmsiSbPg6g2z1CFu7R3HtP3Wx7FGktclxJLHx+VMo\/iZP29JIUCQoX2cQ913vwcZVcjVCVBJJXC8tG9DYiwoc0vV1xXqA2Yy7YM09psfknr2wDoFF12hSntlmjUXQJm7OUxWc4NqEXbzAMV6MWP6ipNMlHES4rmo+igoc40WO5Y6dRNma2vqlFEQV0XjTQjxw4xI0tfWj8P49UseeNQkayU+s5CxLF5jaHwgp0qtEi+W9G+rKsGvTMinjFtvnrAeojr8fG1YsxDV\/+9+072URIW0dmaqYXTYgMuHY\/rLyEifuu15d8BxWFVeF6uIFDuzatEzbJymzffFkDFW9lkVWxQsceODGEl2la1lkmFR3OBm4pSvN2udQv6IKMaTVILNCsxUEaNQdnn+0DSM\/+YL2N9noGgO8FZKt0h2WvQXIKt1hgFcbRbausRFiEeJs1i+3VGjalmAyy0+mdSa6vplod0wGuoYSt5OlHqEVXIDS+AAAGc1JREFUmiC+zgAGQopOC0TW9hkA2pnimVxa685VRaznkqn6DldpLk7NEqNWCYd7TMUjZLvIZhoomVqGSUnQP6S+qamirBXkx+n6in3QNbTWr5CeHbSCAMkNNjvrK4sIZ7IrTOB0iQH9ETyuggicRCieZ5btHlP7XC6ysX0zMiQOS\/Zs5jQ2Njaa\/cLXGcT6li7UVrowEFJw1xOvYiCk4PMfW4J\/+OSH8Ylli3BRfuLYWSwWw+joKAoKCuBwmP+dOtAcAMCPXhjQ9fHLe5exkNP6li68OjiKx+6owp2rijIa92R9WEGA9b5u5OQAv7x3GYCJ484rWw7H4jKc7vw1AGB078\/hvGIN5i4uS7mfbz7zJkoLnXjwZp7jdLFYDL7OIBwOh+mzkIX2njDei8TwiWWLpLRnvNe1lW6tLBfXdZBF6+sMZtxHsrldW+lGTYUbP\/idqip3ZXGB1PV3UX78GZNy3XuRGGor3fB1BvGjFwYSPp9U1uRF+Y5xIfciXJTvQFNbP5ra+nFRvgP+IQU\/+F0\/aircptdkagmSjCTAJ11J1hhVEOFwfcVtHdzuL2CdLKaZG2yGbCzC2eAKE7hdYoDfLQb45TyTuceyrFwzF9k\/FJG2ncnMMiQvIJEVqiNBchXNpCtlVtmgPkrcTo005GsDB7X9bdzuL2AdASZzg82QKRHOBleYwO0SA9a4xQA\/EZq5x+RBccTz1BqW\/aipcEnd16keCc2fsNab2von9KGRoBkBEgZC8gkQUCclkazsuB+VMCcCfOyOKunJFbI0rSTAel+3NolSRSZESMJAs8ESBKiSNG+RBKpMw61fYiRCtUCtXOJtqCvX6i6ub+lCTYVLKhESqJI5vaBkb3A324hv3Iyea\/wlpbObvVWaoBCJCmWLRCQLyDtyI257IZLiWMziCRCrdIFTdYPNkA4RziZXmGCFSwxY4xYDeiIkopJNUMQFJW6nRlJffFIeQfmHlIQkJYMIvdUetNav0AlQUdWggZCizQUtykhFPbnOUYq6vaWFznFickvV7iBiEie6+rN8bVR6SO09YfYkCFU5obhpptdhFHgPNK413Uc4m1xhgrfag3pf97j3wacXI7rFHPrXIqyQ8zQel6Rsq4x9i6KeMZV1I47wdQal8kNcgEr9LIb3HMY\/5IK32oP2nhC81UVsE8PXGdDFfbg2Wfs6g1o\/Hb1hNNSVSZsYRohvxHTdYDOkQoSzzRUmkEvMLZrVUFeO9p7weCjGCV9nEEOPrpXeD20EJ8sdUOemTOI4vOU6+DoDOiu6ozcsdb6L87qhrlwjRc7nJHKdpaW0mr3yd6UTyFIC1Mne7K2S5sZP7Efv6qhvLfnXRdsuAGR97lhEMtd4NrrCBKtcYv+QgjtXFWk6w4C87KqI2kqXtsOCILtghJjEEFXzVJU+nvso42WfDmZNPUE6GnV4y3VorV\/B9hZpauvTHr4ojMTx0MhF6OgNo6bClVUVGiOMRPjs978yvhFe7XM2ucIEmhO+zgDWNXexVcbp6A2j3teNmgqXNlc4RKSslvMU1xgVo50NmDUkCKiTnPPBGGUxOTLOZn0B0Lb4yOxPJMJBhwf+IQV79x9GaaETvs4A61YP\/5CCbfvixMBtobX36ImJc7sM6VRboWg3FXKeFGaaLZhVJGgFaipcOllMLlilBEdEGJijTuoDw+o1cQsPqRnUfsskN1ViV11HKyQ2m71VaKgr033HTUy2nGdmsEkwDcQnGn+8gtxecrk5+yxYcw8K1t6jffYPKdhQFmUlebIkBodjGuFzuuB0H\/U7B3hrJDbUleuq11ihqzzVkgkzETYJTkOQu8aV3TbD4JyLtZ+LYkF4fy2vMGsiWC25aZTZtEJcyVvt0YSsrBJ5t5EebBKchqAANGfM0QiREBqHmgDIrVBthqmQ3LQy60iorXSNHwsts7xvG5PDJsFpilTPBnP0e\/PnvqJ95iTCqZDcrK10aa64lTKb6iZq6wnYxuSwSdCGBrJAZRZmTYZbl8WJz8otObS9Q9xfZ+P8hUNReCaCf0jBuWgUkYj84PPgcEyqDoiImTpuRVEQzWLcOz9bhfaeEGg+zL32DhQoilaqP9C4Fou2\/B5zL6uVOma6H9cscYJrLprhqXtVIsykz2zvdSrgmCuKomAgpMDl4hk31\/zmHnfOsWPHMtIYSYbW7lFsPxjG5a6z2HqzB3l5edLaHhyOYdOuIFZe4kTjTQultUttNz5\/ChfNibKMu\/H5Uyhe4JA+bgDY+HSQZdx46f9h4945KIq9g8ahJuRs2gFUXCul6Wg0io1PB5GXl4ftt8nfd\/b4gTACIzHp9zsajeJXh95Be\/AClnG3do+qa0hy29zjbnz+FA4dV9B400KsvERejJfmydAHc6S3DQCOoiJ5lXDpzN+2faewYcVC\/NcrHPB4PFkLFhGa2vqwbZ9a6eY7f1uFIsmqcFv3vonASAz\/+w6P1HEDwC9e6cPJCPD4XXLHDQDtPSEcOq6gZf1C6eP213wOh\/Z3YaPycwCqwLv7wd9mJd5EiEQicDhOwul0QuY8JBQUxLD94Nt4\/K5lUtuNRCJYsCCCQ4fC6H3fqYttysAtF8bQ+HwnHm4fxbYNH5bWbiQSwe0rgRfbRrB59yns2iT3vnznbxfhvp1vYuPTQTx17+XS7kskEsHWm8fw\/f8Yxcang1h96XypY3fIWjBUvBRQN\/bed30RAoEAnE6nFNU2lVzln5qg9h\/Y1YfASAwvPVgtbdwEX2cQ2\/YF0eytwtLFcjWNAWDbviCKFziw+tL5UscNACdOq+7imuuWA20qEYYe\/ms4s1SxI8yZo74QZI6ZsHRxAQDgpbcV6YmXT17pwu+OxbBtXxA3XSmXwJc6gd2bV2B9Sxfuuq5E6tjz8vKwa1MZNvykGxt+0i216MdSp1rZpqmtD5\/+6etS12qJ24ldm8rx0ttqqbxr\/6lLmkKeNN1hOpIkWxnOKIzEQYBWyGLSUSrZoCIL\/\/KpSultA0BHbwilhU7c\/LmvWJIskYn4YX+eYqobVixER2+YrTgCVyFTgLdCNRVk5RBuMkoAyGg\/KxIkMSYiKNmHqqlAakdvmEV20yoClK17K6KprW98ozFPdrW9J6zt4bMqaywTYhED2bhzVRFrJenW+hXs7QO8cp4DIUWq1CYQP7lFla+zbT8jEuS2\/oC4MBKgugYzURaTKkHTiQHZICswk0rTqcCsrNZMI0IqN8UFKpnFdS642VulVaXhALec5+7NKzSrTfY9kmUVpkSC4pvUCuuPyvBToYKZSYDB8WuQq5ssIm4F8tVoBCbu4ZtJRFhamA+Ar3iBt9rDaq0RkXBWhrFK15hD4H0yqzAVL2BSEiSLjyrlclp\/3PE\/6sMqXWCuOCDAbwUC8XigGcnOFCLkjgsC\/NYgd3wQ4Fex44wTAomtwuVb909KvElJkAgJUAVWZFt\/pFdAteQ443\/Un1UEyBkHBPitQEAfDzTDTCFCzrggwG8NAvzxQeoD4Nc1FuOERuW3bGBmFZLeS7KQSEISJHeO4kIlbhIqkUdOFDPbcTDAFv8jgrVaGJ0rDghYYwWmWmZ\/JhAhd1wQ4LcGAf74IGAu5ynz3hnjhP6hiHR1vtpKVV6DNI0BaN6sGUxJkKrwipB981X3Ok6yVHKIQ3\/YKllMK+KAgDVWYDo1\/qY7EXLHBQFrrEEr4oOAngh9nYGkBJIJyEuKq\/K5pIvW7zgY0MrRERKFEyaQoKjbKw6akhQy4B9SJuiXiputZYFI2z+ksBFge088GMsdB6T+uK1AIHk80AzTmQitiAsC1liDxvggl1YKEWF7T5iF3FXjRCVAqmKuWoZywhZmlb2pD+PzmUCCxorGJMAuy7ox0wbmqJ5slMX0Vns0l1smSHiJrDOOOKB4r6ywAoHJ44FmmM5EyB0XBCZag1z9GeOD7T1yyd0\/pOjWCqnmySR3IimjjIMsb9OokicSopHQJ5Cgt7pIR3yyF5uoDWxUa5PlQiaSxZRtoYkVoAdCCps75B9SUHj\/HjS19VliBWYjuzldiZAjLjimKDjz2muIvfmm9h1Zg7TPlYMIVZF1l0ZOskWqSERMlAwFMMF7y7aPhrpyDD26VtNFASA9Pmjsi5TyREwgQVUVntfKEKX7uKQqrZDFNL7xucSJyDVt74kTLgcoCJ6t5sd0JEKKC\/o6g1LI0PF\/\/y\/Cy5fjVF0dTq5di\/e3bxfum0uzmrjmRFNbv85okE0ctZUujaAIZsaFDJDFJpIhF8xEqOY0NjY2cnQWi8UwOjqKgoICOBzxqim1lW58\/mMlWHaJ\/EICgPqg7nriVQDxQPInli1K+d8nGrdZP1988nXt80X5DjY9kKa2frw6OIqBkIIri+fj3189hSuLC3QPM9VxJ8N7kZgWl8nJUa8JyMloYuaVLYdjcRlOd\/4aADC69+dwXrEGcxeXAVDd7Uf+MIB3RxQ4HA7k5OTg1cFRlnmhEruahXwvEsOPXngb3uqi8etLH6P\/5\/\/g3KOPAufOad9F9+3D8EgEn3r5QuTkAK8OjgJQ72E68y8V1Fa6UVPhxo9eeFv77tXB0UnnXiZzpLbSDW91EY4cV+efqoHtZiEr4gbjEVAZczsZZmVlaZWMeE6bEMQ3PJEtV\/l00fKj+CantU7X1tTWn1UyIZlFSNKXouQmp84IWU7ZWtFng0FEtm41\/Z37lz\/G8yvfn3DCigO0507UaeHUNqb9dzUV\/J6i1Zh1JBhPv\/PqOew4qMon1lS4WMmW9jgSuOU3xX4plpINEhGhmeQmF7zVHpQWOifcy0wQ+dWvdJ\/nePRx5tJfbZ+QleS6PiInIkLO7TmASrwyS29NF8w6ErQKFGvknhTiArJKfpMgq69ERGil5Kasa1Gee073uWDLFt3nM3\/+M74ceVlnoXEL2dPZXM6tWbMZNglmCCusTSC+t62mwsV6DM8I0jyWBTMiXKm8rH3mltwkazAbxN58E2eOHIl\/MWcOnHV1uPALX9D9nfKb3+gsNNlbWMwg+zTX+QSbBKc5SgvzNbfHSnBswzES4VVvP6P9bMUCzraP2Ouv6z7PratDTn4+5n3607rvld\/+Fmf9frTWrxiP31qnpGcjfdgkOM3hrfawHvUzA6drKhLhuvfbWPpIBNrMnCnOHD2q++y44gr1\/x\/+MPJuuEH3O6VNvbZmb5Xtpk5zsJHg4HAMg8MxlrY5A+lcYwasFfvOBBTn5N6MLRJhUSyIolgQK6OHWfskqG5jZvvRYq+9pvucWxmXNHD+zd\/ofhf59a8zGyAmJsNkYqbOb85xs5Cgf0jBbduPoPH5Uyxt1\/u6Wcr9+IcUTS2Lo22ucQPAhp90S7nfZqeE1jV3Sa9cUrDmHrg3\/RjFZ4MoPhtk2VBNhTNE1Fa6MnOLz53DBy+9pPvqvsPx5WMkwTOHD+ODQ4fS7wfQihZwYPvBMDb8hKftprY+tvm9\/WAY1\/4TTz1F6SRIBQVisZh0bVOxHBZHjMzXGUDfyVEWXWA6gsRVJ7GjNyxdj5VgrMYhC\/m1\/w1YGtcwlk2EMstAKW1tOBeKJzhGFxXh1+86Nesnd8ECzPN6df8mum9fRn3VVLi143CysXGVetyOg6woccfR9sZVLhQVOFgKy0olwaa2Pqxv6UJDXRleerBaZtPs9QCpgOy\/fKoSxZJ1gcVK0xyxtqa2PhQvcGBdlfzTFtkeoUsFjkVl2s8yiZASEjLcNOXf\/1332bnurwHo9+bl3XST7m+iv\/1tRn3VVrrgrfawWIPFCxx46t7LWc7oAnyFWYsXOLBr0zJ4qz3Sy\/RLIcGZLotJtQ25MnlU+YXLCvR1qoLUHLAijulYVMZy1jheQis7y+HciROI7Nql++5sTQ1uXaYvypB3ww3IEfSTz3R348zhzGKdZFVxEGFtpVur5TfT5DybvVVo9lahqa1f2r2RpjusEqD8vUpWyGJ+8cluto3IRFJchVZpgXNlINOtK5gpuIouqIUnstund\/rJJ3WfHatWYewjH9HuORFhzty5yL\/1Vt3fZuoSA+qC5yqg2lBXrtUl5HjRcRIhFWCWVZo\/KxI06oJwlKqyQhcYAFsdQNIb4SKpHQcD4+c5+XWHucFBhNlsiQGAsZERjP7wh7rvLvjbvwVAhQxc2hFKAMhbs0b3t8YTJumAu1o1beieiXKedHYawNToDgPxBAiAGSyLyasHQskQbl3gO1cVsbQPIOO6gpmCgwizSTCc9vkwNjKifZ5TUoK822\/XPlP9QLKm8m64AciNL6szR44g9sYbGfffUFfOliQB4rolXFldbjlP0hLJJmGSEQmKCRBOC42TAMmFf+wOubrJBO5kCBCPNXJZmVYkRcwgkwizSY6MjYxgtKVF992F\/\/2\/6z7TvSdrLSc\/H\/nr1un+5oM\/\/SntvgmcSRIgXgGJK1ECWKNrnE3CJCUSJP2P2aILrE+E8BIU13EwijVm6+5N1sdUQRYRZpMcef+JJ3DulLD3cs4cDH\/3uwhddhmca9YgdNllCFx6KY782z34xtfrELj0UgQuvRSR1lZdO8pvfpN23yI4kyQA7Z3kS5QA\/HKeZgmTpra+lK5nUhIkUiLxdY4ECA3WKl1gzkQI9cGZDAHEhAinK2xNUiQRZBFhJsmRs8ePY+QHPzB8edb0v9xzZzFn7Fz8O6HYKgBE9+\/HueHhtMctgjNJAvAnSgB+OU+zhEkq15OUBMXEAVWVlZ0AUa3LflZZTLoJ3IkQsQ9ONxUQEyJTJ75uBWQQYSbW8vs\/+5n+i7y8tNsQEd27N6t\/b6XAu6jSKJsQzeQ8ZfZRW+nSYvxEsJNZ0ElJUBRF8g8pKHE7pSu2iQMcCCksSQQ6rmaFMDp3MgSwJiECWJ8USQQZRJiOxXGmqwvvGzLCF959N+YUF6fVp4hsXWKAP0kC6BMl9b5uFhdclPMsLXRK7UPcsSJq\/yR7eSQkQYqbiRgIKVItKNLQBTCuXSDfHBf74HJRSaLQ1xlkT4YA\/AkRYOqSIomQDRGmmxwZeeQR3ecLrrkGC779bSw+eBBFfj\/cb7wBZd8+uN94A0V+v\/bfsg2\/wPd+0IYivx+Lfv97XRvKb36Ds35\/Sv0nvo54koQ0h2VbamKihLw\/mS44KScCKp\/QC11WHzR+4xpPFu80JUGjOLqoDidr4ZkJsKtna+UqTtEboKNXde2a2vqkuxT01uFOhlDslDshAkzPijeZEmE6yZHTv\/jFBNd1\/pe+FP+Qm5vwv9tXFWHHSyfgD3+AnaNu5F1\/va4d5Xe\/m7T\/yUBGCHlpsqtW+zqD+OKT3TqdZl9nYJJ\/lTqIpIgACTLlPGkPoZEME\/VhSoK0qGnAMsmPYIUsJr1lCCRSJJukaLOsf0jRRN5lkwjFTmlCcm2O9g8p49bz1CZFEiFTIqTkCCXgzHDW78d73\/627rsLP\/MZ5N1446Tt+4cU7ZmQG3n6hpt1fxN55hmzf5oy2nvCKLx\/D7zVHs0lll21mmKP4rqRrWtMJMUt50n9kCBVokSMKQlSluXwlutYFgEtaEANWnMptYk3lYiW41ifOGGa2vpZ9FPjb+UgSgudpmWiZMDXGdBtPCXXSzbae8J4YFf8+dT7ulOOdaVDhP4hBeuauzTLeX1LV0LLZvihh4BYvG5d7oc+hPlf\/nJKY\/J1BtDU1oeaCpemaOf\/y4\/p\/ubM4cP4oKMjpfbMQO6weJ844oO03UQEp95wXCiqn8UDob2EiYy5hDFBTguA4lkkVMS1WZkmCKckpvGhce2fFKUiqU+OfkiknMIHXEF4o+SmrzOYViY6VSKkl5SYUKBrFDHyyCNQDFVfCr75TeQuSk0zuKGuXOuLns9bsTxcuHGj7u\/OCadPMoFZpWqOZ0QVzWltyrYGCaKcJ7f4eqK2p6y8PrdQkVhYgFMSU7QqOOUw\/UMR3Weuky4iKFnF8UKUIbmZjAhjJ\/sRO9mP2kqXLr5lhsgzz2D0n\/9Z992822\/HPOF4XCow7jrwD0Uw\/8tfhnP8BMm822+H8+MfT6tNMxiJkEvIqbTQqbPUOFXzMi52KwFsJBgMBvGLX\/wCwSBfOj8ZyKVPN5ud7rhpYnDrAYsuqVn2met+c16TDMlNMyIcbFwL\/+Zy+DeX49iGHNzU+Q3dvzFanKefeEL3ee6yZVjQ2Jiwz0T3mk5eEPxDCnJdLrh\/+EMUvf02LnrkEWDOnDSv0BwiEaZqCWY6R1rrV0ypVgo3l7CS4M9\/\/vMpI0EgM5c+nXHH3VJrBNGBeKbeCFn3WyQI7sSImOHOZlO2kQgVg1u87v22tDRMLvre95BTUJDw98nuNZ28APgz7ERMqXoE2cyRqRSL4uYSW20uC5C7YI3+cFiLbVoFbsElMcOd7T0sWHMPnFesSfj7W5Io283\/2tcwp6QEcy6+GIW\/+AXm\/uVfZjUWeklxi65TX1arEc42OF588UWWho8fPw4AOHDgAEv7XJiu4\/77lVG097yDwTdyMGjye1njzp2n6qvknj4Fx6nX8aJ8rSwNFxw\/DqAQAHDgwItwnMrc6vTkxXAuyVaZde+3YfuCuxFweBB48zBePCVYT3PnAmJMcJI1kcq9\/vuVUfiHFHCtr0wwXef2ZOAed055efkYS8s2ZiyUy9cj9\/S7uMCf+XaOVDH8V00AgAW\/a8iqnasLFDzykeSbeg\/lXY0vKZ\/CvD\/\/NKu+bMwu5Ozfv98mQRtTinPzFiL3dPYm5+JHJncLTzwg9+y7jZmPnLGxMZsEbcwKDDaunZAUEeG8Yg2KG\/dYNyAbMwJ2YsTGrMHi+icS\/s6xqCzp722cv7BJ0MasgWNRGUpb+lCw5p4J3xd\/d49O39iGDcL\/BztX2yOMuopbAAAAAElFTkSuQmCC","width":225}
%---
%[control:button:3682]
%   data: {"label":"Show a 2-D plot of dx, dy, and ds","run":"Section"}
%---
%[control:button:3351]
%   data: {"label":"Animate ds along C","run":"Section"}
%---
%[control:button:6e11]
%   data: {"label":"Show Curves","run":"Section"}
%---
%[text:image:20da]
%   data: {"align":"middle","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:0fbf]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:dropdown:0c54]
%   data: {"defaultValue":"\"radially outward\"","itemLabels":["x","negative y","radially outward"],"items":["\"x\"","\"negative y\"","\"radially outward\""],"label":"Vector field: ","run":"Nothing"}
%---
%[control:dropdown:03ec]
%   data: {"defaultValue":"\"??\"","itemLabels":["??","horizontal line","vertical line","diagonal line"],"items":["\"??\"","\"horizontal line\"","\"vertical line\"","\"diagonal line\""],"label":"A curve:  ","run":"Nothing"}
%---
%[control:button:0c3a]
%   data: {"label":"Create example problem","run":"Section"}
%---
%[text:image:0a5d]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:8ba7]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:dropdown:76dc]
%   data: {"defaultValue":"\"radially outward\"","itemLabels":["x","negative y","radially outward","concentric circles","eddies"],"items":["\"x\"","\"negative y\"","\"radially outward\"","\"concentric circles\"","\"eddies\""],"label":"Vector field: ","run":"Nothing"}
%---
%[control:dropdown:7429]
%   data: {"defaultValue":"\"??\"","itemLabels":["??","circle","positive circular arc","negative circular arc","clockwise rectangle","counterclockwise rectangle","sinusoid"],"items":["\"??\"","\"circle\"","\"positive circular arc\"","\"negative circular arc\"","\"clockwise rectangle\"","\"counterclockwise rectangle\"","\"sinusoid\""],"label":"A curve:  ","run":"Nothing"}
%---
%[control:button:9b4f]
%   data: {"label":"Create problem","run":"Section"}
%---
%[control:dropdown:5a25]
%   data: {"defaultValue":"\"??\"","itemLabels":["??","positive","negative","zero","unclear"],"items":["\"??\"","\"positive\"","\"negative\"","\"zero\"","\"unclear\""],"label":"The value of this line integral is ","run":"Section"}
%---
%[control:button:11ae]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[text:image:0175]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:7d9f]
%   data: {"label":"Show ds along a piecewise path","run":"Section"}
%---
%[text:image:4d84]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:6770]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:1380]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[text:image:4bec]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:1cb2]
%   data: {"label":"Check Exercise 2","run":"Section"}
%---
%[control:checkbox:4662]
%   data: {"defaultValue":false,"label":"a) ","run":"Nothing"}
%---
%[control:checkbox:4923]
%   data: {"defaultValue":false,"label":"b) ","run":"Nothing"}
%---
%[control:checkbox:4d21]
%   data: {"defaultValue":false,"label":"c) ","run":"Nothing"}
%---
%[control:checkbox:767e]
%   data: {"defaultValue":false,"label":"d) ","run":"Nothing"}
%---
%[control:checkbox:2ace]
%   data: {"defaultValue":false,"label":"e) ","run":"Nothing"}
%---
%[text:image:44b6]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:dropdown:5cd0]
%   data: {"defaultValue":"\"radially outward\"","itemLabels":["x","negative y","radially outward"],"items":["\"x\"","\"negative y\"","\"radially outward\""],"label":"Vector field: ","run":"Nothing"}
%---
%[control:dropdown:1249]
%   data: {"defaultValue":"\"horizontal line\"","itemLabels":["horizontal line","vertical line","diagonal line"],"items":["\"horizontal line\"","\"vertical line\"","\"diagonal line\""],"label":"Let C be a:  ","run":"Nothing"}
%---
%[control:button:9b6e]
%   data: {"label":"Create a problem","run":"Section"}
%---
%[control:button:5133]
%   data: {"label":"Show solution","run":"Section"}
%---
%[text:image:5276]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:1657]
%   data: {"defaultValue":"-999","label":"Solution to a) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:23ed]
%   data: {"label":"Check","run":"Section"}
%---
%[control:editfield:46d1]
%   data: {"defaultValue":"-999","label":"Solution to b) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:9805]
%   data: {"label":"Check","run":"Section"}
%---
%[control:button:4c3e]
%   data: {"label":"Plot C on the vector field","run":"Section"}
%---
%[control:editfield:55bf]
%   data: {"defaultValue":"-999","label":"Solution to d) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:26d4]
%   data: {"label":"Check","run":"Section"}
%---
%[control:button:928c]
%   data: {"label":"Plot C on the vector field","run":"Section"}
%---
%[control:editfield:9282]
%   data: {"defaultValue":"-999","label":"Solution to e) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:56c4]
%   data: {"label":"Check","run":"Section"}
%---
%[text:image:124c]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:9abe]
%   data: {"label":"Generate and Display a Star","run":"Section"}
%---
%[text:image:46de]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:939f]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:762a]
%   data: {"defaultValue":0,"label":"The area is: ","run":"Nothing","valueType":"Double"}
%---
%[control:button:37f5]
%   data: {"label":"Check","run":"Section"}
%---
%[text:image:8c08]
%   data: {"align":"bottom","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAABMCAYAAAAoVToVAAAEVElEQVR42u2c4ZG0IAyGrwRLoARLoIQtwQ7WEizBEiyBEiiBEiiBDjydifM5jiCQBPU+fuTX3e7iIyRvEuBnnuefamlWIVRoFVqFVqEx2\/f7FYtJMFGh\/QPTLPZZbFhML2YXmy\/Mwv8O8Nnmz0ODGdQvZiIAxZqB7xR\/ChrMCk0Iymfrb3xeDQ1ghZadW0zBclv9Vxv4Lrlbzgo+G1rGn1dBWx8+MLPWBxpDgBJ\/Zwy8GE3xO+zQYCb4HkAyzuou8KKGR0IDJ29KwzoZRx8IGOIx0MDfuJJ+xSNhxotA4SheINWyOA5OldRQMAaXEGW726B5gHVMUAaP2Ux50hWH5gG22kQchQ2jruuKQQMfFhrMQATMFRDEkh0aREkX4XDFC4BljTXngWKXy4CIgvZELnCCM2zQAsL1zARC721OvgeIssCMG8ihwZKZOWcZwodSWUsNTQd8wlHUNi+FpsmgQXXBm5ocwHXEKl+CWJ4L2YcKmvUAaw6+zuXMsl29TRequwWrw2hogaUhDjPC5fgyT7S82yQWmm9pjMfZQlxKutNUNjTwV+hok\/n97qLAODMLYJELrb\/44hEJTQcKlmK3fI+JuYbcd2SE1udCMxQhOuH7XWiwAEpcRHT2LOHKQc\/M0JodOBWbRUTmvxTWpEL7cEPbgWszxK69S7Nho9pI2F9Yl94E\/ipKvsD\/F89Hc6TGpe8h6iBtArq9Ua6oVGi+IKCwXZ0CFVnWYBB6MJZW3EPFrNcw0CSR75oKPrCjSPSzoRE6ezbf42uc7Pa5yZyXdjc0TvU+eAKKOZE3rtTyFATQOEs+OtBSbBN86nT8OwYaRUtOcVdcPQ0ZEeEm1C49k1TQLAG0vgC04TBrmoiAZEL1Q5TkeHggmMFfbT6rS2gSydDOAYy4NS+QHGpz9gnuYrzQkQaTRlHuz+AMCAbbCTs8t8Im7IZi2ycsIcUsalvE+CwmYZcXIV4QJOsWbNoKjFCSclxV10S\/K6mLkCSVDoYNMBPyReYXIRP8Dxc4WRLYiT\/TXI0V8n0bEU3qrLZbpK8laawI7sES5qsDsfgWHM1isj4BUe1tIJzVimtbwn6XkGCCZkpAOwkAuG0JCQGB9DRcYtqF3a5qU1YOVyT7EDVdWHWZxwVIEmgZ6Y8m0mqopm5G05luU1\/GctEFJYch9JmCFFpiNNMFBK7G+NATOUO\/UTlxmWrCCHp2fHsi9pdJ481Vzo4znQn8bodN206AJW955Uio3feB10IEgCWXkTgkQf8SYGUPlF0MZHwgsPERRxcvDqiaJyxRzxFx973zkOyFj3OcZaNIeeQoS+EcB\/8bjxyxHKeNI8roZ7qO5PhRyXKOhQdqGOWIfdUVEye+JHQAbcJesLS74GnibADdcW2OjMggttZgf3b91+FasAEgmYgNMWx3gZTyM6VO0qkSF6fccWdaTwxQbSeQ\/4ub+nZLTsUWAva3YNXrDeudkBVatQoNb78ox6WFMDJfcAAAAABJRU5ErkJggg==","width":25}
%---
