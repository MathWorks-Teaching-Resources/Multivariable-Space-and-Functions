%[text] # Coordinate Systems
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] A coordinate system imposes a geometric structure on a space, allowing points to be identified by a set of numbers, called coordinates. The choice of a coordinate system impacts what shapes are easy to locate, describe, or track in that space. 
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:2b20) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:155b) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:9ce0)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
%[text] The ![Try this icon](text:image:732a)  and  ![Exercise icon](text:image:2799) icons refer to two different types of interactive activities that you will find in this script. The ![Try this icon](text:image:9808)  usually indicates an interaction where you will explore the visualization of some concept introduced in this script. The ![Exercise icon](text:image:82c9) interactions are designed to challenge your understanding of those concepts and may be used for grading and completion checks by your professor.
%[text] ## History of Coordinate Systems
%[text] The earliest origins of coordinate systems involve locating points on the earth or in the sky as part of what we now call geography, astronomy, or cartography. This led to a coordinate system of latitude and longitude lines on the earth and many engineering challenges to build accurate clocks and other geolocation systems. 
%[text] The concept of coordinate systems, which connects algebraic and geometric ideas in an abstract space, is credited to René Descartes in the early 1600s; however, others also explored these concepts. The first abstract coordinate system is the Cartesian coordinate system, which has mutually perpendicular straight axes that intersect at a single point, which is called the origin.
%[text] ## Standard Coordinate Systems
%[text] ## Two Dimensions
%[text] ### Cartesian Coordinates
%[text] In two dimensions, the Cartesian coordinate axes are usually called the $x${"altText":"x"}-axis and the $y${"altText":"y"}-axis. In three dimensions, we add a $z${"altText":"z"}-axis. Each point in space is represented by an ordered pair $(x,y)${"altText":"(x,y)"} in 2D or triple $(x,y,z)${"altText":"(x,y,z)"} in 3D of values corresponding to the distance from the origin one must travel along the corresponding direction from the origin, $(0,0)${"altText":"(0,0)"}, to reach the point.
%[text] ![](text:image:340b) **Try**. Investigate the representation of a point in 2D Cartesian coordinates.
x = 2;  y =  -4; %[control:editfield:8c93]{"position":[5,6]} %[control:editfield:2db2]{"position":[13,16]} %[text:anchor:M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_M_5b5b]
Animate = true;     %[control:dropdown:9d3a]{"position":[11,15]} %[control:button:6c30]{"position":[19,20]}

Plot2DPoint([x y],ShowCoordinates=Animate)
%%
%[text] %[text:anchor:TMP_92e4] ![](text:image:09cd) **Exercise 1.** Use the button to generate and display a random point. Then, identify the point shown in standard Cartesian coordinates `(x,y)`. 
  %[control:button:8da1]{"position":[1,2]}
pt = randi([-6 6],[1 2]);
Plot2DPoint(pt,ShowCoordinates=false,ShowOrigin=false,AddTitle=false)
title("What are the coordinates of the point?")
%%
mySoln = "";    %[control:editfield:1737]{"position":[10,12]} %[control:button:14bb]{"position":[15,16]}
if mySoln == ""
    disp("Please enter a point.")
else
    ParseAndGiveFeedback(mySoln,pt)
end
%%
%[text] ### Polar Coordinates
%[text] The most natural coordinates to describe 2D space are sometimes based on circles. This is called a **polar coordinate** **system**, and the coordinates are $(r,\\theta)${"altText":"(r,\theta)"}, where $r${"altText":"r"} is the distance from the origin and $\\theta${"altText":"\theta"} is the azimuthal angle measured counterclockwise from the $+x${"altText":"+x"}-axis. 
%[text] Polar coordinates make it easy to represent figures with angular components, such as a fan. The first line plots $r = \\frac{0.15\\theta}{2\\pi}${"altText":"r = \frac{0.15\theta}{2\pi}"}, and the others are evenly-spaced angular shifts of the first spoke. Think about what shape you expect and then plot the function.
theta = linspace(0,2*pi,50);
r = linspace(0,0.3,50);
NumSpokes = 6;  %[control:dropdown:8116]{"position":[13,14]} %[control:button:1694]{"position":[15,16]}
SpokeShift = linspace(0,2*pi,NumSpokes+1);
thetaWheel = theta + SpokeShift(1:end-1)';
polarplot(thetaWheel,r)
%%
%[text] #### ![](text:image:43d3) **Application: Orienteering**
%[text] Orienteering is an outdoor adventure sport that combines running with navigation. Participants use a map and compass to navigate through diverse and often unfamiliar terrain, aiming to visit a series of checkpoints, known as controls, in the correct order and as quickly as possible. The challenge lies in choosing the most efficient route between controls while accurately navigating the landscape.
%[text] Polar coordinates are relevant in orienteering when using a compass to determine direction. In polar coordinates, a position is described by a distance from a reference point and an angle from a reference direction. Orienteers use the compass to measure the angle or bearing from their current location to the next control point. The bearing is typically measured in degrees from magnetic north, corresponding to the angle in polar coordinates. By combining this directional information with distance estimates from the map, orienteers can plot a course and make precise navigational decisions to reach their checkpoints efficiently.
%%
%[text] ## Three Dimensions
%[text] ### Cartesian Coordinates
%[text] In three dimensions, we add a $z${"altText":"z"}-axis to the $x${"altText":"x"}-axis and $y${"altText":"y"}-axis of 2D Cartesian coordinates. Each point in space is represented by an ordered triple $(x,y,z)${"altText":"(x,y,z)"} of values corresponding to the distance from the origin, $(0,0,0)${"altText":"(0,0,0)"}. One must travel the given distance along the corresponding direction from the origin to reach the point.
%[text] ![](text:image:222f) **Try**. Explore these plots of surfaces in three-dimensional space. 
[x,y,z,label] =DefineCubePoints; %[control:dropdown:6a6b]{"position":[1,32]} %[text:anchor:M_M_M_M_M_M_M_8559]

%%
function label = DefineDefault
label = "default";
end

function [x,y,z,label] = DefineSpherePoints(radius)
arguments
    radius (1,1) double = 1
end

% Define the sphere parameters
[r,n] = deal(radius,50); % radius and number of points

% Create a grid of points on the sphere
[phi,theta] = meshgrid(linspace(0,2*pi,n),linspace(0,pi,n));
x = r * sin(theta) .* cos(phi);
y = r * sin(theta) .* sin(phi);
z = r * cos(theta);
label = "Sphere";
end

function [x,y,z,label] = DefineCubePoints
sidelength = 0.8;
n = 50;
EdgePoints = linspace(0,sidelength,n);
[face1,face2] = meshgrid(EdgePoints,EdgePoints);
spacer = nan([1,n]);
x = [face1;spacer;face1;spacer;face2;spacer;face2;spacer;zeros(n);spacer;sidelength*ones(n)]; % bottom, top, left, right, front, back
y = [face2;spacer;face2;spacer;zeros(n);spacer;sidelength*ones(n);spacer;face1;spacer;face1];
z = [zeros(n);spacer;sidelength*ones(n);spacer;face1;spacer;face1;spacer;face2;spacer;face2];
label = "Cube";
end

function [x,y,z,label] = DefineRibbonPoints
width = 0.3;
n = 50;
rVals = linspace(width,2*width,n);
thetaVals = linspace(0,4*pi,n);
[r,theta] = meshgrid(rVals,thetaVals);
zVals = linspace(-0.3,0.6,n);
x = r.*cos(theta);
y = r.*sin(theta);
z = ones(size(x)).*zVals';
label = "Ribbon";
end

% Plot the selected surface
OpenInWindow = false; % open in popup window %[control:checkbox:7d90]{"position":[16,21]}

IsDefault = label=="default";

if ~IsDefault
    if OpenInWindow
        OpenPopup
    end

    s = surf(x,y,z,FaceAlpha=0.5,EdgeColor="none");
    axis equal;
    if label == "Cube"
        % Scale the axis limits
        s.Parent.XLim = s.Parent.XLim*1.1;
        s.Parent.YLim = s.Parent.YLim*1.1;
        s.Parent.ZLim = s.Parent.ZLim*1.1;
    end
    xlabel("x-axis");
    ylabel("y-axis");
    zlabel("z-axis");
    title(label + " in Cartesian Coordinates");
    if OpenInWindow
        subtitle("Use the 'Return to script' button when you are done")
    end
    grid on;
else
    clear IsDefault
    disp("This is the default value. Please make a selection to continue.")
end
%%
%[text] ![](text:image:9c9e) **Reflect.** How would you describe these surfaces in words? Are you thinking about everyday objects or algebraic or geometric terms?  
%[text] %[text:anchor:TMP_5073] ![](text:image:97b3) **Exercise 2.** Which of the following algebraic formulas describes the surface you [selected](internal:M_M_M_M_M_M_M_8559)?
%[text] a) $\\{(x,y,z)\~|\~0\\leq x,y \\leq 0.8, \\text{ and } z=0 \~\\text{ or }\~ z=0.8\\}${"altText":"{(x,y,z)\~|\~0\leq x,y \leq 0.8, \text{ and } z=0 \~\text{ or }\~ z=0.8}"} 
%[text]      and $\\left\\{(x,y,z)\~|\~0\\leq x,z \\leq 0.8 \\text{ and } y=0 \~\\text{ or }\~ y=0.8\\right\\}${"altText":"\left{(x,y,z)\~|\~0\leq x,z \leq 0.8 \text{ and } y=0 \~\text{ or }\~ y=0.8\right}"} 
%[text]      and $\\{(x,y,z)\~|\~0\\leq y,z \\leq 0.8, \\text{ and } x=0 \~\\text{ or }\~ x=0.8\\}${"altText":"{(x,y,z)\~|\~0\leq y,z \leq 0.8, \text{ and } x=0 \~\text{ or }\~ x=0.8}"}
%[text] b) $\\left\\{(x,y,z)\~|\~x^2+y^2+z^2 = 1\\right\\}${"altText":"\left{(x,y,z)\~|\~x^2+y^2+z^2 = 1\right}"}
%[text] c) $\\left\\{(x,y,z)\~|\~0.3 \\leq \\sqrt{x^2+y^2} \\leq 0.6 \~\\text{ and }\~ 0 \\leq \\arctan\\left(\\frac{y}{x}\\right) \\leq 4\\pi \~\\text{ and } -0.3 \\leq z \\leq 0.6\\right\\}${"altText":"\left{(x,y,z)\~|\~0.3 \leq \sqrt{x^2+y^2} \leq 0.6 \~\text{ and }\~ 0 \leq \arctan\left(\frac{y}{x}\right) \leq 4\pi \~\text{ and } -0.3 \leq z \leq 0.6\right}"}
choice = "??"; %[control:dropdown:3504]{"position":[10,14]}
if exist("label","var") && label ~= "default"
    CheckExercise2(choice,label)
else
    warning("You must select a surface before completing this Exercise.")
end
%%
%[text] ### Spherical Coordinates
%[text] A spherical coordinate system defines a point in three-dimensional space with three values: the radial distance from a central point, the polar angle  (also called the inclination) from a reference direction, and the azimuthal angle in a reference plane. While academic disciplines use different conventions for spherical coordinates, they mostly agree that one coordinate tracks the distance from the origin. We'll call this distance $\\rho${"altText":"\rho"} (`rho)`. Therefore, we can plot a sphere of radius $3${"altText":"3"} in spherical coordinates by noting that it is the set of all points in spherical coordinates where $\\rho = 3${"altText":"\rho = 3"}. The other two coordinates are angles generally denoted as $\\theta${"altText":"\theta"} (`theta`) and $\\phi${"altText":"\phi"} (`phi`). In mathematics, $\\theta${"altText":"\theta"} is the azimuthal angle in the $xy${"altText":"xy"}-plane measured counterclockwise from the $+x${"altText":"+x"}-axis, and $\\phi${"altText":"\phi"} is the polar angle measured from the $+z${"altText":"+z"}-axis. This means that $0\\leq \\rho \< \\infty${"altText":"0\leq \rho \< \infty"}, $0\\leq \\theta \<2\\pi${"altText":"0\leq \theta \<2\pi"}, and $0\\leq \\phi \\leq \\pi${"altText":"0\leq \phi \leq \pi"}, and the points are written as $(\\rho,\\theta,\\phi)${"altText":"(\rho,\theta,\phi)"}. 
%[text] This expression of spherical coordinates is one way of smoothly extending the idea of polar coordinates into three dimensions. Note that for values in the $xy${"altText":"xy"}-plane, the first two components in spherical coordinates are exactly the same as the representation in polar coordinates.
% Plot a point in spherical coordinates

% Define the arrow parameters
rho = 1; % length of the arrow %[control:editfield:2206]{"position":[7,8]}
theta_arrow = pi/4; % angle from the positive x-axis in the x-y plane %[control:editfield:1281]{"position":[15,19]}
phi_arrow = pi/4; % angle from the positive z-axis %[control:editfield:6a34]{"position":[13,17]}
ShowComponents = false; OpenInWindow = false; % open in popup window %[control:checkbox:888d]{"position":[18,23]} %[control:checkbox:95be]{"position":[40,45]}
  %[control:button:4674]{"position":[1,2]}
ValidInputs = true;

if ShowComponents && rho==0
    warning("This plot collapses to the origin when rho=0.")
end

% Check spherical sanity
if rho < 0
    warning("This is an improper value for rho. Remember that rho is a distance, rho >= 0.")
    ValidInputs = false;
end
if 0 > theta_arrow || 2*pi <= theta_arrow
    warning("This is an improper value for theta. Remember that 0 <= theta < 2*pi.")
    ValidInputs = false;
end
if 0 > phi_arrow || phi_arrow > pi
    warning("This is an improper value for phi. Remember that 0 <= phi <= pi.")
    ValidInputs = false;
end


if OpenInWindow
    OpenPopup
end

if ValidInputs
    % Calculate the arrow endpoint in Cartesian coordinates
    x_arrow = rho * sin(phi_arrow) * cos(theta_arrow);
    y_arrow = rho * sin(phi_arrow) * sin(theta_arrow);
    z_arrow = rho * cos(phi_arrow);

    q = scatter3(x_arrow,y_arrow,z_arrow,80,"filled",SeriesIndex=4);
    xlabel("x-axis")
    ylabel("y-axis")
    zlabel("z-axis")

    if rho~=0
        q.Parent.XLim = [-rho rho];
        q.Parent.YLim = [-rho rho];
        q.Parent.ZLim = [-rho rho];
        all_max = 1.1*rho;
    else
        LimPt = 0.1;
        all_max = 1.1*LimPt;
        % q.Parent.XLim = [-LimPt LimPt];
        % q.Parent.YLim = [-LimPt LimPt];
        % q.Parent.ZLim = [-LimPt LimPt];
    end

    if ShowComponents
        hold on
        % Plot the arrow from the origin to the point
        quiver3(0,0,0,x_arrow,y_arrow,z_arrow,"off",LineWidth=3,MaxHeadSize=0.2,SeriesIndex=3);
        quiver3(0,0,0,all_max,0,0,LineWidth=2,MaxHeadSize=0,SeriesIndex=2);
        text(0.95*all_max,0,0,'+x',FontSize=12,HorizontalAlignment="center",SeriesIndex=2)
        quiver3(0,0,0,0,0,all_max,LineWidth=2,MaxHeadSize=0,SeriesIndex=1);
        text(0,0,0.95*all_max,'+z',FontSize=12,HorizontalAlignment="center",SeriesIndex=1)
        quiver3(0,0,0,x_arrow,y_arrow,0,"off",LineWidth=2,MaxHeadSize=0,SeriesIndex="none",LineStyle=":")
        thetaAnglePoints = linspace(0,theta_arrow,50);
        phiAnglePoints = linspace(0,phi_arrow,50);
        plot3(0.1*all_max*cos(thetaAnglePoints),0.1*all_max*sin(thetaAnglePoints),zeros(size(thetaAnglePoints)),SeriesIndex="none");
        plot3(0.3*rho*cos(theta_arrow).*sin(phiAnglePoints),0.3*rho*sin(theta_arrow).*sin(phiAnglePoints),0.3*rho*cos(phiAnglePoints),SeriesIndex=4)
        % Add xy-plane
        [xPlanePts,yPlanePts]  = meshgrid([-rho rho],[-rho rho]);
        s=surf(xPlanePts,yPlanePts,zeros(2),FaceAlpha=0.2);
        % Add rho-sphere
        [xSph,ySph,zSph,~] = DefineSpherePoints(rho);
        surf(xSph,ySph,zSph,FaceAlpha=0.2,EdgeColor="none")
        hold off

        % Add labels for the arrow
        text(1.05*x_arrow,1.05*y_arrow,1.05*z_arrow,sprintf('\\rho = %.2f',rho), ...
            FontSize=12,HorizontalAlignment="left",SeriesIndex=3);
        text(0.3*rho*sin(phi_arrow/2)*cos(theta_arrow),0.3*rho*sin(phi_arrow/2)*sin(theta_arrow),0.3*rho*cos(phi_arrow/2),sprintf('\\phi = %.2f',phi_arrow),...
            FontSize=12,HorizontalAlignment="right",SeriesIndex=4);
        text(0.15*all_max*cos(theta_arrow/2),0.15*all_max*sin(theta_arrow/2),0,sprintf('\\theta = %.2f',theta_arrow),...
            FontSize=12,HorizontalAlignment="left",SeriesIndex="none");
        axis square
        box off
    end

end
%[text] ![MATLAB icon](text:image:8adb) **Pro-tip**. Click the figure and use the Rotate 3D (![Rotate 3D toolbar icon](text:image:7805)) tool to move the plot around to see the different components. 
%[text] ![Warning symbol](text:image:886a) **Practical Note:** In fact, while $\\rho \< 0${"altText":"\rho \< 0"} does not make sense, it can be appropriate to describe space in spherical coordinates using any real values as angles $\\theta${"altText":"\theta"} and $\\phi${"altText":"\phi"}. That said, describing any point using the limited range presented above is always possible. For instance, the point $\\left(1,\\frac{10\\pi}{3},\\frac{\\pi}{3}\\right)${"altText":"\left(1,\frac{10\pi}{3},\frac{\pi}{3}\right)"} is the same point as $\\left(1,\\frac{4\\pi}{3},\\frac{\\pi}{3}\\right)${"altText":"\left(1,\frac{4\pi}{3},\frac{\pi}{3}\right)"}. Or $\\left(2,\\frac{\\pi}{3},\\frac{3\\pi}{2}\\right)${"altText":"\left(2,\frac{\pi}{3},\frac{3\pi}{2}\right)"} is the same point as $\\left(2,\\frac{4\\pi}{3},\\frac{\\pi}{2}\\right)${"altText":"\left(2,\frac{4\pi}{3},\frac{\pi}{2}\right)"}.
%%
%[text] ![Warning symbol](text:image:554e) **Cautionary Note:** The physics conventions for spherical coordinates are $(r,\\theta,\\phi)${"altText":"(r,\theta,\phi)"}, where $r${"altText":"r"} is the distance from the origin, $\\theta${"altText":"\theta"} is the polar angle from the positive $z${"altText":"z"}-axis to the radial line, and $\\phi${"altText":"\phi"} is the angle of rotation around the $z${"altText":"z"}-axis measured from the positive $x${"altText":"x"}-axis. A third convention in navigation and engineering uses radial distance, azimuthal angle, and elevation measured in a range of $\\left\[\\frac{-\\pi}{2},\\frac{\\pi}{2}\\right\]${"altText":"\left\[\frac{-\pi}{2},\frac{\pi}{2}\right\]"} with respect to the $xy${"altText":"xy"}-plane. The navigation convention will frequently measure the angles in degrees with the azimuthal angle, or longitude, between -180$^{\\circ}${"altText":"degrees"} and 180$^{\\circ}${"altText":"degrees"} and the elevation angle, or latitude, between -90$^{\\circ}${"altText":"degrees"} and 90$^{\\circ}${"altText":"degrees"}. 
%[text:table]
%[text] | <p align="center">Math Conventions</p> | <p align="center">Physics Conventions</p> | <p align="center">Navigation Conventions</p> |
%[text] | --- | --- | --- |
%[text] | <p align="center">![The math conventions where phi is measured from the +z-axis to the vector (rho,theta,phi) in the same plane (colored blue) and theta is measured from the +x-axis to the projection of the (rho,theta,phi) vector in the xy-plane.](text:image:5ccc)</p> | <p align="center">![The physics conventions switch theta and phi from the math conventions, so theta is measured from the +z-axis to the vector (rho,theta,phi) in the same plane (colored blue) and phi is measured from the +x-axis to the projection of the (rho,theta,phi) vector in the xy-plane.](text:image:9f60)</p> | <p align="center">![The navigation conventions where elevation is measured from the xy-plane to the vector (rho,theta,phi) in the Z-point plane (colored blue) and the azimuth is measured from the +x-axis to the projection of the (azimuth,elevation,r) vector in the xy-plane.](text:image:19ab)</p> |
%[text:table]
%[text] 
%[text] **In any situation where you encounter spherical coordinates, first make sure you know what convention the author is using.**
%[text] #### ![](text:image:8eec)**Application: Tracking Satellites**
%[text] Spherical coordinates are essential in planning and describing the motion of satellites around the Earth because they provide a natural way to represent positions in a three-dimensional space centered on the Earth. This system is advantageous because it aligns well with the Earth's curvature and rotational symmetry, allowing for straightforward calculations of orbital paths, velocities, and positions relative to the Earth's surface. By using spherical coordinates, engineers and scientists can efficiently model satellite orbits, determine their coverage areas, and plan maneuvers with respect to the Earth's geometry. One such application is described in a [satellite tracking documentation example](https://www.mathworks.com/help/fusion/ug/detect-and-track-a-LEO-satellite-constellation-with-ground-radars.html). 
%%
%[text] ### Cylindrical Coordinates
%[text] Cylindrical coordinates extend polar coordinates into three dimensions by including a height value measured above or below the polar coordinate plane: $(r,\\theta,z)${"altText":"(r,\theta,z)"}. This lets us plot elegantly curvy shapes and surfaces, and volumes with rotational symmetry. Consider the following:
%[text]{"align":"center"} $r(z) = \\text{max}\\left(0.02,a+b\\sin\\left(\\frac{\\pi z}{h}\\right)-\\cos\\left(\\frac{6\\pi z}{h}\\right)\\right)${"altText":"r(z) = \text{max}\left(0.02,a+b\sin\left(\frac{\pi z}{h}\right)-\cos\left(\frac{6\pi z}{h}\right)\right)"}
%[text]{"align":"center"} $r(\\theta) = a-b\\cos\\left(h\\theta\\right)${"altText":"r(\theta) = a-b\cos\left(h\theta\right)"} 
%[text]{"align":"center"} $r(\\theta,z) = z\\left(\\cos\\left(\\frac{\\theta}{h}\\right)\\right)^2-a\\sin\\left(\\frac{b\\theta}{h}\\right)${"altText":"r(\theta,z) = z\left(\cos\left(\frac{\theta}{h}\right)\right)^2-a\sin\left(\frac{b\theta}{h}\right)"} 
%[text] ![](text:image:37db) **Try**. Play around with different values of $a${"altText":"a"}, $b${"altText":"b"}, $h${"altText":"h"} and the maximum and minimum values of $z${"altText":"z"}. How different do the shapes look?
z = linspace(0,2,100); % Create a vector for z from 0 to 3 %[control:dropdown:7098]{"position":[14,15]} %[control:dropdown:5393]{"position":[16,17]}
theta = linspace(0,2*pi,100); % Create a vector for theta from 0 to 2*pi
[Z,Theta] = meshgrid(z,theta); % Create a meshgrid for z and theta
a = 1; b = 3; h = 10; %[control:editfield:5058]{"position":[5,6]} %[control:editfield:41ba]{"position":[12,13]} %[control:editfield:9b26]{"position":[19,21]}
R = max(0.02,a+b*sin(pi*Z/h)-(cos(6*pi*Z/h)).^2); OpenInWindow = false; % open in popup window %[control:dropdown:722b]{"position":[5,49]} %[control:checkbox:4295]{"position":[66,71]}
  %[control:button:6d16]{"position":[1,2]}
X = R.*cos(Theta);
Y = R.*sin(Theta);
if OpenInWindow
    OpenPopup
end
surf(X,Y,Z,LineWidth=0.1,EdgeAlpha=0.4); % Plot the surface
xlabel("x-axis"); % Label x-axis
ylabel("y-axis"); % Label y-axis
zlabel("z-axis"); % Label z-axis
%%
%[text] #### ![](text:image:55fc) **Application: Radar Tracking Systems**
%[text] Consider the problem of [tracking an aircraft](https://www.mathworks.com/help/fusion/ug/simulate-and-track-en-route-air-traffic-with-earth-centered-scenarios.html) along its flight path. A radar station can determine the azimuthal angle to the aircraft and how far away it is. The plane's GPS can broadcast its measured location, and all of this data can be combined into a cylindrical coordinate system with the origin at the radar station to be able to plot the location of the plane on a map with polar coordinates, but also to track the altitude, especially as the plane comes in to land. 
%%
%[text] #### ![](text:image:6173) **Application: Rotationally Symmetric and Extruded Solids**
%[text] When designing objects for manufacturing, it is common to create a computer-aided design (or CAD) model of the object. A standard approach to building a CAD model is to combine simpler shapes to build the representation. But what shapes count as simple? That depends on the coordinate system being used! 
%[text] Cylindrical coordinates can be used to create various useful shapes through rotational symmetry and extrusion. A cog, for instance, 
  %[control:button:3763]{"position":[1,2]}
z = [0 0.5];
theta = linspace(0,2*pi,640); % Create a vector for theta from 0 to 2*pi
% [Z,Theta] = meshgrid(z,theta); % Create a meshgrid for z and theta

R = 3;
A = 0.3;
r = R + A*sign(cos(8*theta));
polarplot(theta,r,SeriesIndex=2,LineWidth=2)
hold on
polarplot(theta,0.5*ones(size(theta)),SeriesIndex=3,LineWidth=2)
radiusregion(0,0.5,SeriesIndex="none",FaceAlpha=1)
radiusregion(0.5,R-A,SeriesIndex=1,FaceAlpha=1)
OnPts = -pi/16:pi/4:2*pi;
OffPts = OnPts+ pi/8;
RadiusVec = ones(size(OnPts));
polarregion([OnPts;OffPts],[(R-A)*RadiusVec;(R+A)*RadiusVec],SeriesIndex=1,FaceAlpha=1)
hold off
legend(["$r = 3+0.3\text{sign}(\cos(8\theta))$" "r=0.5"],Interpreter="latex")
%%
%[text] can be extruded up to the relevant height by simply including a range of acceptable $z${"altText":"z"}-values.
%[text] Alternatively, one can start with a 2D cross-section. 
  %[control:button:1585]{"position":[1,2]}
function [zPath,rPath] = DefineCrossSection
z = 0:0.04:5;
r = 1+sin(z*pi/10);                % Main outer curve
r(1:5) = 1.3-2*(z(1:5)).^2;        % Add foot
r(end-7:end) = 2.2-z(1:8).^2;      % Add lip
rInner = 1.9*(fliplr(z)/5).^(1/3); % Inner curve

rPath = [r rInner r(1)];
zPath = [z fliplr(z) 0];
end
[zPath,rPath] = DefineCrossSection;
plot(rPath,zPath)
title("Cross-sectional slice")
%%
%[text] Rotating this cross-section around the $z${"altText":"z"}-axis, we can build a 3D object.
OpenInWindow = false; % open in popup window %[control:checkbox:6beb]{"position":[16,21]}
  %[control:button:2376]{"position":[1,2]}
if OpenInWindow
    OpenPopup
else
    fig = figure;
end
theta = linspace(0,2*pi,50);
if ~exist("zPath","var") || ~exist("rPath","var")
    [zPath,rPath] = DefineCrossSection;
end
[Z,Theta] = meshgrid(zPath,theta); % Create a meshgrid for z and theta
[R,~] = meshgrid(rPath,theta);
surf(R.*cos(Theta),R.*sin(Theta),Z)
title("Solid of Rotation")
view([235.83 5.56])
%[text] You can explore these ideas in the [Multibody Simulation Onramp](https://matlabacademy.mathworks.com/details/multibody-simulation-onramp/ormb).
%%
%[text] #### ![](text:image:49a1)**Application: Modeling Microphones**
%[text] Spherical coordinates are used in microphone arrays to focus on sounds from specific directions. This helps microphones capture sound more precisely by placing them on a sphere. The system can enhance desired sounds and reduce noise by analyzing sound differences at each microphone.
%[text]{"align":"center"} ![Sketch of a shotgun microphone](text:image:4db8)
%[text] Spherical harmonics are mathematical tools used to design microphones for  3D audio capture and noise-canceling systems by improving sound quality and directionality. Polar coordinates are helpful for cylindrical microphones like cardioid and shotgun types. Cardioid microphones pick up sound mainly from the front, reducing background noise. Shotgun microphones are even more focused, capturing sound from a specific area and minimizing ambient noise, making them ideal for film and TV production. You can see visualizations of [microphone response patterns](https://www.mathworks.com/help/phased/ug/introduction-to-hybrid-beamforming.html) in three dimensions in a discussion of hybrid beamforming or sliced 2D versions in an [introduction to beamforming](https://www.mathworks.com/help/phased/ug/introduction-to-differential-beamforming.html) to get an idea of how these coordinate systems help design microphones that effectively control sound direction and quality.
%[text] ## Identifying Appropriate Coordinate Systems
%[text] In applying the concepts of coordinate systems, one of the challenges is deciding which coordinate system to use for what types of work. The geometric object is always the same, but the algebraic representation can look quite different in different coordinate systems and be more or less amenable to different types of computations. For the moment, let's consider some typical forms that are well-described by each coordinate system.
%[text] ![](text:image:0a05) **Exercise 3.** For each of the following problems, click the "Show shape" button to plot a shape, then choose the most straightforward coordinate system for plotting the shape depicted.
%[text] a)
  %[control:button:6335]{"position":[1,2]}
% Plot a cardioid
Exercise3aShape = true;
theta = linspace(0,2*pi,200);
r = 0.3+cos(theta);
p = polarplot(theta,r,LineWidth=2);
grid off
axis off
%%
aSoln = "default"; %[control:dropdown:56f2]{"position":[9,18]}
if exist("Exercise3aShape","var")
    CheckExercise3(aSoln,"a")
else
    disp("You must plot the shape before you can answer.")
end
%%
%[text] b)
  %[control:button:506c]{"position":[1,2]}
% Plot a cylinder of radius 1 and height 2
Exercise3bShape = true;
theta = linspace(0,2*pi,200);
r = 1;
z = linspace(-1,1,15);
[Z,Theta] = meshgrid(z,theta);
X = r*cos(Theta);
Y = r*sin(Theta);
s = surf(X,Y,Z,CData=zeros(size(Z)),EdgeColor="none");
hold on
fill3(X,Y,ones(size(Z)),0)
fill3(X,Y,-1*ones(size(Z)),0)
hold off
grid off
axis equal off
%%
bSoln = "default"; %[control:dropdown:215b]{"position":[9,18]}
if exist("Exercise3bShape","var")
    CheckExercise3(bSoln,"b")
else
    disp("You must plot the shape before you can answer.")
end
%%
%[text] c)
  %[control:button:0e4e]{"position":[1,2]}
% Plot the plane 2*x - 3*y = z
Exercise3cShape = true;
[x,y] = meshgrid(-2:0.1:2,-2:0.1:2); % Create a grid for x and y
z = 2*x - 3*y; % Calculate z based on the plane equation
surf(x,y,z,EdgeColor="none"); % Plot the surface
grid off
axis off
%%
cSoln = "default"; %[control:dropdown:30ec]{"position":[9,18]}
if exist("Exercise3cShape","var")
    CheckExercise3(cSoln,"c")
else
    disp("You must plot the shape before you can answer.")
end
%%
%[text] d) 
  %[control:button:211c]{"position":[1,2]}
% Plot an ellipsoid with major radius 4 and minor radius 1
Exercise3dShape = true;
a = 4; % Major radius
b = 1; % Minor radius
[theta,phi] = meshgrid(linspace(0,2*pi,100),linspace(0,pi,100)); % Create a meshgrid for spherical coordinates

% Parametric equations for the ellipsoid
X = a * sin(phi) .* cos(theta);
Y = a * sin(phi) .* sin(theta);
Z = b * cos(phi);

% Plot the ellipsoid
figure;
surf(X,Y,Z,EdgeAlpha=0.4); % Plot the surface of the ellipsoid
grid off; % Turn on the grid
axis equal off; % Set equal scaling for all axes
%%
dSoln = "default"; %[control:dropdown:2c5f]{"position":[9,18]}
if exist("Exercise3dShape","var")
    CheckExercise3(dSoln,"d")
else
    disp("You must plot the shape before you can answer.")
end
%%
%[text] ## Conversion Between Coordinate Systems
%[text] Recall the relationships within a right triangle:
%[text]{"align":"center"} ![A right triangle with legs y and x and hypotenuse r. The angle opposite y is labeled theta.](text:image:4074)
%[text]{"align":"center"} $\\frac{y}{x} = \\tan\\left(\\theta\\right)\~\~\\Rightarrow\~\~\\arctan\\left(\\frac{y}{x}\\right) = \\theta${"altText":"\frac{y}{x} = \tan\left(\theta\right)\~\~\Rightarrow\~\~\arctan\left(\frac{y}{x}\right) = \theta"}
%[text] and
%[text]{"align":"center"} $\\sqrt{x^2+y^2} = r${"altText":"\sqrt{x^2+y^2} = r"}.
%[text] Extending this relationship beyond the first quadrant we can handle values from $-\\frac{\\pi}{2}${"altText":"-\frac{\pi}{2}"} up to $\\frac{\\pi}{2}${"altText":"\frac{\pi}{2}"} for $\\theta${"altText":"\theta"}. Beyond that, we can use the periodicity of the tangent function to extend to the entire plane.
%[text] 
%[text]{"align":"center"}  ![A square divided into four quadrants, counterclockwise from the top right they are labeled I, II, III, and IV.  Quadrant I has 0 \< arctan(y/x) \< pi/2. Quadrant II has -pi/2 \< arctan(y/x) \< 0. Quadrant III has 0 \< arctan(y/x)\<pi/2. Quadrant IV has -pi/2\<arctan(y/x) \< 0.](text:image:0a3f)
%[text] These values mean we must shift our computed $\\theta${"altText":"\theta"} values by various multiples of $\\pi${"altText":"\pi"} to shift the computed arctangent into the proper quadrant.
%[text]{"align":"center"} In the [table below](internal:M_70c3), $k = \\begin{cases} 0 & x\\geq 0,\~y\\geq 0 \\\\ 1 & x\< 0 \\\\ 2 & x \>0, \~ y \< 0 \\end{cases}${"altText":"k = \begin{cases} 0 & x\geq 0,\~y\geq 0  1 & x\< 0  2 & x \>0, \~ y \< 0 \end{cases}"}. 
%[text] This shift can also be described by quadrant. No shift is required in the first quadrant, but to keep the values of $\\theta \\in \[0,2\\pi)${"altText":"\theta \in \[0,2\pi)"}, we have to shift by $\\pi${"altText":"\pi"} in quadrants II and III and by $2\\pi${"altText":"2\pi"} in quadrant IV. Similar considerations with $\\phi${"altText":"\phi"} show that a shift of the arctangent is also needed to agree with the conventions agreed to above, shifting the range from $\\left\[\\frac{-\\pi}{2}, \\frac{\\pi}{2}\\right\]${"altText":"\left\[\frac{-\pi}{2}, \frac{\pi}{2}\right\]"} to $\[0,\\pi\]${"altText":"\[0,\pi\]"} and changing the direction to measure downwards from the $+z${"altText":"+z"}-axis in the math and physics conventions rather than elevation above/below the $xy${"altText":"xy"}-plane.  
%[text:table] %[text:anchor:M_70c3]
%[text] | <p align="right">To</p><p align="right">From   ↗   </p> | <p align="center">Cartesian</p><p align="center">$(x,y,z)${"altText":"(x,y,z)"}</p> | <p align="center">Polar</p><p align="center">$(r,\\theta)${"altText":"(r,\theta)"}</p> | <p align="center">Cylindrical</p><p align="center">$(r,\\theta,z)${"altText":"(r,\theta,z)"}</p> | <p align="center">Spherical (math)</p><p align="center">$(\\rho,\\theta,\\phi)${"altText":"(\rho,\theta,\phi)"}</p> | <p align="center">Spherical (navigation)</p><p align="center">$(\\text{azimuth},\\text{elevation},r)${"altText":"(\text{azimuth},\text{elevation},r)"}</p> | <p align="center">Spherical (physics)</p><p align="center">$(\\rho,\\theta,\\phi)${"altText":"(\rho,\theta,\phi)"}</p> |
%[text] | --- | --- | --- | --- | --- | --- | --- |
%[text] | <p></p><p align="center">Cartesian</p><p align="center">$(x,y,z)${"altText":"(x,y,z)"}</p> | <p align="center"></p><p align="center">No need</p> | <p align="center">$r = \\sqrt{x^2+y^2}${"altText":"r = \sqrt{x^2+y^2}"} </p><p align="center">$\\theta = \\arctan\\left(\\frac{y}{x}\\right)+k\\pi${"altText":"\theta = \arctan\left(\frac{y}{x}\right)+k\pi"}</p> | <p align="center">$r = \\sqrt{x^2+y^2}${"altText":"r = \sqrt{x^2+y^2}"} </p><p align="center">$\\theta = \\arctan\\left(\\frac{y}{x}\\right) + k\\pi${"altText":"\theta = \arctan\left(\frac{y}{x}\right) + k\pi"}</p><p align="center">$z=z${"altText":"z=z"} </p> | <p align="center">$\\rho = \\sqrt{x^2+y^2+z^2}${"altText":"\rho = \sqrt{x^2+y^2+z^2}"} </p><p align="center">$\\theta = \\arctan\\left(\\frac{y}{x}\\right) + k\\pi${"altText":"\theta = \arctan\left(\frac{y}{x}\right) + k\pi"} </p><p align="center">$\\phi = \\frac{\\pi}{2}-\\arctan\\left(\\frac{z}{\\sqrt{x^2+y^2}}\\right)${"altText":"\phi = \frac{\pi}{2}-\arctan\left(\frac{z}{\sqrt{x^2+y^2}}\right)"}</p> | <p align="center">$r = \\sqrt{x^2+y^2+z^2}${"altText":"r = \sqrt{x^2+y^2+z^2}"} </p><p align="center">$\\text{azimuth} = \\arctan\\left(\\frac{y}{x}\\right)${"altText":"\text{azimuth} = \arctan\left(\frac{y}{x}\right)"} </p><p align="center">$\\text{elevation} = \\arctan\\left(\\frac{z}{\\sqrt{x^2+y^2}}\\right)${"altText":"\text{elevation} = \arctan\left(\frac{z}{\sqrt{x^2+y^2}}\right)"}</p> | <p align="center">$\\rho = \\sqrt{x^2+y^2+z^2}${"altText":"\rho = \sqrt{x^2+y^2+z^2}"} </p><p align="center">$\\phi = \\arctan\\left(\\frac{y}{x}\\right) + k\\pi${"altText":"\phi = \arctan\left(\frac{y}{x}\right) + k\pi"} </p><p align="center">$\\theta = \\frac{\\pi}{2}-\\arctan\\left(\\frac{z}{\\sqrt{x^2+y^2}}\\right)${"altText":"\theta = \frac{\pi}{2}-\arctan\left(\frac{z}{\sqrt{x^2+y^2}}\right)"}</p> |
%[text] | <p align="center">Polar</p><p align="center">$(r,\\theta)${"altText":"(r,\theta)"}</p> | <p align="center">$x = r\\cos\\left(\\theta\\right)${"altText":"x = r\cos\left(\theta\right)"}</p><p align="center">$y=r\\sin(\\theta)${"altText":"y=r\sin(\theta)"} </p> | <p align="center"></p><p align="center">No need</p> | <p align="center">$r = \\rho \\sin(\\phi)${"altText":"r = \rho \sin(\phi)"}</p><p align="center">$\\theta = \\theta${"altText":"\theta = \theta"} </p><p align="center">$z=0${"altText":"z=0"} </p> | <p align="center">$\\rho = r${"altText":"\rho = r"}</p><p align="center">$\\theta = \\theta${"altText":"\theta = \theta"}</p><p align="center">$\\phi = \\frac{\\pi}{2}${"altText":"\phi = \frac{\pi}{2}"}</p> | <p align="center">$r = r${"altText":"r = r"}</p><p align="center">$\\text{azimuth} = \\theta${"altText":"\text{azimuth} = \theta"}</p><p align="center">$\\text{elevation} = 0${"altText":"\text{elevation} = 0"}</p> | <p align="center">$\\rho = r${"altText":"\rho = r"}</p><p align="center">$\\phi = \\theta${"altText":"\phi = \theta"}</p><p align="center">$\\theta = \\frac{\\pi}{2}${"altText":"\theta = \frac{\pi}{2}"}</p> |
%[text] | <p align="center"></p><p align="center">Cylindrical</p><p align="center">$(r,\\theta,z)${"altText":"(r,\theta,z)"}</p> | <p align="center">$x = r\\cos\\left(\\theta\\right)${"altText":"x = r\cos\left(\theta\right)"}</p><p align="center">$y=r\\sin(\\theta)${"altText":"y=r\sin(\theta)"} </p><p align="center">$z=z${"altText":"z=z"} </p> | <p align="center">Dimension mismatch</p><p align="center">3D → 2D</p><p align="center">Projection: $(r,\\theta)${"altText":"(r,\theta)"}</p> | <p align="center"></p><p align="center">No need</p> | <p align="center">$\\rho = \\sqrt{r^2+z^2}${"altText":"\rho = \sqrt{r^2+z^2}"} </p><p align="center">$\\theta = \\theta${"altText":"\theta = \theta"} </p><p align="center">$\\phi = \\frac{\\pi}{2}-\\arctan\\left(\\frac{z}{r}\\right)${"altText":"\phi = \frac{\pi}{2}-\arctan\left(\frac{z}{r}\right)"}</p> | <p align="center">$r = \\sqrt{r^2+z^2}${"altText":"r = \sqrt{r^2+z^2}"} </p><p align="center">$\\text{azimuth} = \\theta${"altText":"\text{azimuth} = \theta"} </p><p align="center">$\\text{elevation} = \\arctan\\left(\\frac{z}{r}\\right)${"altText":"\text{elevation} = \arctan\left(\frac{z}{r}\right)"}</p> | <p align="center">$\\rho = \\sqrt{r^2+z^2}${"altText":"\rho = \sqrt{r^2+z^2}"} </p><p align="center">$\\phi = \\theta${"altText":"\phi = \theta"} </p><p align="center">$\\theta = \\frac{\\pi}{2}-\\arctan\\left(\\frac{z}{r}\\right)${"altText":"\theta = \frac{\pi}{2}-\arctan\left(\frac{z}{r}\right)"}</p> |
%[text] | <p align="center">Spherical</p><p align="center">$(\\rho,\\theta,\\phi)${"altText":"(\rho,\theta,\phi)"}</p><p align="center">(math)</p> | <p align="center">$x = \\rho\\sin(\\phi)\\cos(\\theta)${"altText":"x = \rho\sin(\phi)\cos(\theta)"}</p><p align="center">$y=\\rho\\sin(\\phi)\\sin(\\theta)${"altText":"y=\rho\sin(\phi)\sin(\theta)"}</p><p align="center">$z=\\rho\\cos(\\phi)${"altText":"z=\rho\cos(\phi)"} </p> | <p align="center">Dimension mismatch</p><p align="center">3D → 2D</p><p align="center">Projection: $(\\rho\\sin(\\phi),\\theta)${"altText":"(\rho\sin(\phi),\theta)"}</p> | <p align="center">$r = \\rho \\sin(\\phi)${"altText":"r = \rho \sin(\phi)"} </p><p align="center">$\\theta = \\theta${"altText":"\theta = \theta"} </p><p align="center">$z = \\rho\\cos(\\phi)${"altText":"z = \rho\cos(\phi)"}</p> | <p align="center"></p><p align="center">No need</p> | <p align="center">$r = \\rho${"altText":"r = \rho"}</p><p align="center">$\\text{azimuth} = \\theta${"altText":"\text{azimuth} = \theta"}</p><p align="center">$\\text{elevation} = \\frac{\\pi}{2}-\\phi${"altText":"\text{elevation} = \frac{\pi}{2}-\phi"}</p> | <p align="center">$\\rho = \\rho${"altText":"\rho = \rho"}</p><p align="center">$\\theta = \\phi${"altText":"\theta = \phi"}</p><p align="center">$\\phi = \\theta${"altText":"\phi = \theta"}</p> |
%[text] | <p align="center">Spherical</p><p align="center">$(\\text{azimuth},\\text{elevation},r)${"altText":"(\text{azimuth},\text{elevation},r)"}</p><p align="center">(navigation)</p> | <p align="center">$x = r\\cos(\\text{elevation})\\cos(\\text{azimuth})${"altText":"x = r\cos(\text{elevation})\cos(\text{azimuth})"}</p><p align="center">$y=r\\cos(\\text{elevation})\\sin(\\text{azimuth})${"altText":"y=r\cos(\text{elevation})\sin(\text{azimuth})"}</p><p align="center">$z=r\\sin(\\text{elevation})${"altText":"z=r\sin(\text{elevation})"} </p> | <p align="center">Dimension mismatch</p><p align="center">3D → 2D</p><p align="center">Projection: $(r\\cos(\\text{elevation}),\\text{azimuth})${"altText":"(r\cos(\text{elevation}),\text{azimuth})"}</p> | <p align="center">$r = r \\cos(\\text{elevation})${"altText":"r = r \cos(\text{elevation})"}</p><p align="center">$\\theta = \\text{azimuth}${"altText":"\theta = \text{azimuth}"} </p><p align="center">$z = r\\sin(\\text{elevation})${"altText":"z = r\sin(\text{elevation})"}</p> | <p align="center">$\\rho = r${"altText":"\rho = r"}</p><p align="center">$\\theta = \\text{azimuth}${"altText":"\theta = \text{azimuth}"}</p><p align="center">$\\phi=\\frac{\\pi}{2}-\\text{elevation}${"altText":"\phi=\frac{\pi}{2}-\text{elevation}"}</p> | <p align="center"></p><p align="center">No need</p> | <p align="center">$\\rho = r${"altText":"\rho = r"}</p><p align="center">$\\phi = \\text{azimuth}${"altText":"\phi = \text{azimuth}"}</p><p align="center">$\\theta=\\frac{\\pi}{2}-\\text{elevation}${"altText":"\theta=\frac{\pi}{2}-\text{elevation}"}</p> |
%[text] | <p align="center">Spherical</p><p align="center">$(\\rho,\\theta,\\phi)${"altText":"(\rho,\theta,\phi)"}</p><p align="center">(physics)</p> | <p align="center">$x = \\rho\\sin(\\theta)\\cos(\\phi)${"altText":"x = \rho\sin(\theta)\cos(\phi)"}</p><p align="center">$y=\\rho\\sin(\\theta)\\sin(\\phi)${"altText":"y=\rho\sin(\theta)\sin(\phi)"}</p><p align="center">$z=\\rho\\cos(\\theta)${"altText":"z=\rho\cos(\theta)"} </p> | <p align="center">Dimension mismatch</p><p align="center">3D → 2D</p><p align="center">Projection: $(\\rho\\sin(\\theta),\\phi)${"altText":"(\rho\sin(\theta),\phi)"}</p> | <p align="center">$r = \\rho \\sin(\\theta)${"altText":"r = \rho \sin(\theta)"} </p><p align="center">$\\theta = \\phi${"altText":"\theta = \phi"} </p><p align="center">$z = \\rho\\cos(\\theta)${"altText":"z = \rho\cos(\theta)"}</p> | <p align="center">$\\rho = \\rho${"altText":"\rho = \rho"}</p><p align="center">$\\theta = \\phi${"altText":"\theta = \phi"}</p><p align="center">$\\phi = \\theta${"altText":"\phi = \theta"}</p> | <p align="center">$r = \\rho${"altText":"r = \rho"}</p><p align="center">$\\text{azimuth} = \\phi${"altText":"\text{azimuth} = \phi"}</p><p align="center">$\\text{elevation} = \\frac{\\pi}{2}-\\theta${"altText":"\text{elevation} = \frac{\pi}{2}-\theta"}</p> | <p align="center"></p><p align="center">No need</p> |
%[text:table]
%%
%[text] %[text:anchor:TMP_3db8] ![](text:image:5ea2) **Exercise 4.**  Choose a convention and generate a problem. 
Convention = "math"; %[control:dropdown:8b16]{"position":[14,20]}
  %[control:button:477e]{"position":[1,2]}
[startPt,startCoords,endCoords] = CreateExercise4(6,Convention);
%%
%[text]  You can use numbers, `pi`, `sqrt()`, and the trigonometric functions `sin()`, cos(), `atan()`, `sind()`, `cosd()`, and `atand()` in expressing your solution.
%[text] ![Warning symbol](text:image:49b9) **Practical Note:** The checking code on this exercise is looking for a precise answer. If you round your solution too much, your answer will not be accepted. 
%[text] ![MATLAB icon](text:image:8b63) **Pro-tip**. The functions `sin()`, cos(), and `atan()` compute with angles in radians while  `sind()`, `cosd()`, and `atand()` compute with angles in degrees.
solnPt = "(x,y,z)";  %[control:editfield:6706]{"position":[10,19]} %[control:button:637c]{"position":[20,21]}

if exist("startCoords","var") && exist("endCoords","var")
    numPt = PullOutPoint(solnPt,endCoords,Convention);
    out = CheckExercise4(numPt,startPt,startCoords,endCoords,Convention);
else
    warning("You must generate a problem before solving it.")
end
%%
%[text] ## Further Exploration: Plotting on a Spherical Surface
%[text] There are many other ways to represent space. Following the historical roots of identifying geographic locations, you can explore [geographic plots](https://www.mathworks.com/help/matlab/geographic-plots.html) where the coordinates are latitude (the number of degrees north or south of the equator) and longitude (the number of degrees east or west of the prime meridian). This connects to all sorts of interesting geometric questions because the curvature of the Earth means that your basic intuition about what it means to be a straight line, for instance, may need to be rethought.
%[text] ![MATLAB icon](text:image:99f3) **Pro-tip**. MATLAB® offers different ways to visualize geographic data, from the standard visualization options available in MATLAB to more specialized options in the Mapping Toolbox™. The following example requires the Mapping Toolbox.
figure
load coastlines coastlat coastlon
latlim = [-85 85];
lonlim = [-180 180];
abm = worldmap(latlim,lonlim);
geoshow(coastlat,coastlon)
%[text] Identify a location, perhaps a city, by its latitude and longitude locations:
city1lat = 42.28; city1lon = -71.35; %[control:editfield:8745]{"position":[12,17]} %[control:editfield:5b6d]{"position":[30,36]}
% city1lat = 42.28; city1lon = -71.35; % Natick, MA, US
%[text] And a second one:
city2lat = 48.86; city2lon = 2.35; %[control:editfield:4b73]{"position":[12,17]} %[control:editfield:9dfa]{"position":[30,34]}
% city2lat = 48.86; city2lon = 2.35; % Paris
% city2lat = -68; city2lon = 91; % On Antarctica
% city2lat = -77.07; city2lon = 167.31;  % McMurdo Station
  %[control:button:58e8]{"position":[1,2]}
scatterm(abm,[city1lat city2lat],[city1lon city2lon],50,"filled","pentagram",SeriesIndex=2)
% scatterm(city2lat,city2lon,50,"filled","pentagram",SeriesIndex=2)
%%
%[text] ### Great Circles and Rhumb Lines
%[text] One of the complexities of drawing flat maps of curved surfaces is that the [shortest distance](https://www.mathworks.com/help/map/rhumb-lines.html) will not appear as a straight line. These "shortest distance" lines are called geodesics. On a sphere, they are also called great circles. A rhumb line on a sphere has a constant slope. How do the great circle and rhumb line paths between your points compare?
  %[control:button:130c]{"position":[1,2]}
figure
[latgc,longc] = track2(city1lat,city1lon,city2lat,city2lon);
[latrh,lonrh] = track2("rh",city1lat,city1lon,city2lat,city2lon);
gcDist = round(deg2km(distance(city1lat,city1lon,city2lat,city2lon)),1);
rhDist = round(deg2km(distance("rh",city1lat,city1lon,city2lat,city2lon)),1);

if city2lon-city1lon > 0 && lonrh(2)-lonrh(1) < 0
    idxgc = find(diff(longc)>320);
    idxrh = find(diff(lonrh)>320);
    % Handle the case where the longitude wraps around
    if ~isempty(idxgc)
        latgc = [latgc(1:idxgc); latgc(idxgc:end)];
        longc = [longc(1:idxgc); nan; longc(idxgc+1:end)];
    end
    if ~isempty(idxrh)
        latrh = [latrh(1:idxrh); latrh(idxrh:end)];
        lonrh = [lonrh(1:idxrh); nan; lonrh(idxrh+1:end)];
    end
end
mapChoice = "satellite"; %[control:dropdown:16ad]{"position":[13,24]}
geobasemap(mapChoice);
p = geoplot(latgc,longc,SeriesIndex=1,LineWidth=2);

hold on
geoplot(latrh,lonrh,SeriesIndex=2,LineWidth=2)
geoscatter(city1lat,city1lon,"pentagram","filled",SeriesIndex=3,MarkerEdgeColor="flat")
geoscatter(city2lat,city2lon,"pentagram","filled",SeriesIndex=3,MarkerEdgeColor="flat")
if (city2lat-city1lat)*(city2lon-city1lon) > 0
    dirString = "left";
else
    dirString = "right";
end

if mapChoice == "grayterrain" || mapChoice == "satellite"
    txtColor = "white";
else
    txtColor = "black";
end

text(latgc(33),longc(33),string(gcDist) + " km",HorizontalAlignment=dirString,Color=txtColor)
text(latrh(67),lonrh(67),string(rhDist) + " km",HorizontalAlignment=dirString,Color=txtColor)
hold off
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] [⇦ Return to the main menu](file:../MainMenu.m)
%%
%[text] ## Local Helper Functions
%[text] If you want to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:367f) at the top right of the Live Editor pane.
function Plot2DPoint(pt,opts)
arguments
    pt (1,2) double
    opts.ShowOrigin = true
    opts.ShowCoordinates = true
    opts.AddTitle = true
    opts.CoordinatesOnAxes (1,1) logical = false
end

figure

x = pt(1);
y = pt(2);

if opts.ShowOrigin
    hold on
    scatter(0,0,Marker="o",SizeData=50,LineWidth=2,SeriesIndex=2)
    hold off
end
if max(abs(x),abs(y)) <= 6
    n = 6;
    smLabels = -n:n;
else
    n = ceil(max(abs(x),abs(y)))+1;

    smallLabels = round(linspace(-n,n,10));
    smLabels = string.empty(2*n+1,0);

    for idx = 10:-1:1
        smLabels(n+1+smallLabels(idx)) = smallLabels(idx);
    end
end

if opts.ShowOrigin
    hold on
    scatter(x,y,"filled",Marker="o",SizeData=50,SeriesIndex=1)
    hold off
else
    scatter(x,y,"filled",Marker="o",SizeData=50,SeriesIndex=1)
end

ax = gca;
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
xlim([-n,n])
xticks(-n:n)
xticklabels(smLabels)
ylim([-n,n])
yticks(-n:n)
yticklabels(smLabels)
axis square
grid on



if opts.AddTitle
    title("$x = $"+x + " and $y = $" + y,Interpreter="latex")
end

if opts.ShowCoordinates
    if opts.CoordinatesOnAxes
        hold on
        plot([0 x],[0 0],LineWidth=2,SeriesIndex=3)
        plot([0 0],[0 y],LineWidth=2,SeriesIndex=4)
        plot([x x 0],[0 y y],":",SeriesIndex="none")
        hold off
        if x ~= 0
            text(x/2,y,string(x))
        end
        if y ~= 0
            text(x,y/2,string(y))
        end
        legend(["Origin" "$(x,y)$" "$x$-component" "$y$-component"],Interpreter="latex",Location="bestoutside");
    else
        hold on
        plotX = plot([0 0],[0 0],LineWidth=2,SeriesIndex=3);
        hold off
        ell = legend(["Origin" "$(x,y)$" "$x$-component"],Interpreter="latex",Location="bestoutside");

        t = linspace(0,abs(x)+abs(y),101);
        clear plotY
        for tIdx = 2:101
            if t(tIdx) <= abs(x)
                plotX.XData(2) = sign(x)*t(tIdx);
                pause(0.05)
            elseif t(tIdx) > abs(x)
                if ~exist("plotY","var")
                    hold on
                    plotY = plot([x x],[0 0],LineWidth=2,SeriesIndex=4);
                    hold off
                    ell.String{end} = "$y$-component";
                end
                plotY.YData(2) = sign(y)*(t(tIdx)-abs(x));
                pause(0.05)
            end
        end
    end
end

end

function ParseAndGiveFeedback(mySoln,pt)
arguments
    mySoln (1,1) string
    pt (1,2) double
end

signedNumPat = optionalPattern(whitespacePattern)+optionalPattern("-");

SolnPattern = "("+signedNumPat+digitsPattern(1)+optionalPattern(whitespacePattern)+","+...
    signedNumPat+digitsPattern(1)+optionalPattern(whitespacePattern)+ ")";

if ~contains(mySoln,SolnPattern)
    warning("Please enter your solution in the form (x,y). Do not forget the parentheses!")
else
    myPt = extract(mySoln,SolnPattern);
    if size(myPt) ~= [1 1]
        warning("Please enter a single point, only!")
        return
    else
        x = double(extractBetween(myPt,"(",","));
        y = double(extractBetween(myPt,",",")"));
        myPoint = [x y];
    end
    if all(myPoint == pt,"all")
        disp("That is correct, the point is (" + x + "," + y + ").")
        Plot2DPoint(pt,CoordinatesOnAxes=true,AddTitle=false)
    elseif myPoint(1) == pt(1)
        disp("Your x value is correct, but your y value is not." + newline + "Please try again.")
    elseif myPoint(2) == pt(2)
        disp("Your y value is correct, but your x value is not." + newline + "Please try again.")
    elseif myPoint(2)==pt(1) && myPoint(1) == pt(2)
        disp("You appear to have mixed up your x and y coordinates." + newline + ...
            "Please recheck your point and try again.")
    else
        disp("No, that is not the point shown." + newline + ...
            "Please test your solution with the first plotting interaction" + newline + ...
            "and then try again.")
    end
end
end

function CheckExercise2(myAns,shape)
arguments
    myAns (1,1) string {mustBeMember(myAns,["??","a)" "b)" "c)"])}
    shape (1,1) string {mustBeMember(shape,["Sphere" "Cube" "Ribbon"])}
end

if myAns == "??"
    disp("This is the default value, please select a set of equations.")
    return
end

flag = 0;
switch shape
    case "Cube"
        if myAns == "a)"
            disp("That is correct." + newline + ...
                "One way to describe a cube with Cartesian coodinates is a)," + newline + ...
                "as a union of 6 square faces.")
            flag = 1;
        end
    case "Sphere"
        if myAns == "b)"
            disp("That is correct." + newline + ...
                "One way to describe a sphere with Cartesian coodinates is b)," + newline + ...
                "a set of points that are all a fixed distance from the origin.")
            flag = 1;
        end
    case "Ribbon"
        if myAns == "c)"
            disp("That is correct." + newline + ...
                "One way to describe a ribbon with Cartesian coodinates is c)," + newline + ...
                "a set of points that are defined by a range of distances to the" + newline + ...
                "origin, and a range of angles from the x-axis, and a range of heights.")
            flag = 1;
        end
end
if ~flag
    switch myAns
        case "a)"
            disp("No, the equations in a) describe the following:")
            [x,y,z,~] = DefineCubePoints;
        case "b)"
            disp("No, the equations in b) describe the following:")
            [x,y,z,~] = DefineSpherePoints;
        case "c)"
            disp("No, the equations in c) describe the following:")
            [x,y,z,~] = DefineRibbonPoints;
    end
    surf(x,y,z,EdgeColor="none")
    axis square
    disp("Please try again.")
else
    disp("These descriptions might encourage you to think about additonal ways to describe space.")
end
end

function CheckExercise3(mySoln,val)
arguments
    mySoln (1,1) string {mustBeMember(mySoln,["Cartesian" "Spherical" "Polar" "Cylindrical" "default"])}
    val (1,1) string {mustBeMember(val,["a" "b" "c" "d"])}
end
if mySoln == "default"
    disp("Please select an option.")
    return
end

dimWrong = "That is the wrong dimension." + newline + "Please try again.";
genWrong = "That is not the easiest solution.";
switch val
    case "a"
        if mySoln == "Polar"
            disp("That is correct. The polar equations for this figure are:")
            syms r theta
            displayFormula("r == 0.3+cos(theta)")
        elseif mySoln == "Cartesian"
            disp(genWrong + " In Cartesian coordinates this looks like:")
            syms x y
            displayFormula("x^2+y^2 = (0.3 + x/sqrt(x^2+y^2))^2")
            disp("Please try again.")
        else
            disp("That would work, but how many dimensions are required for this plot?" + newline + ...
                "Please try again.")
        end
    case "b"
        if mySoln == "Polar"
            disp(dimWrong)
        elseif mySoln == "Cylindrical"
            disp("This is a classic cylinder! In cylindrical coordinates, this is:")
            syms r z
            displayFormula(["r <= 1" '" and "' "-1 <= z" '" and "' "z<= 1"])
        else
            disp(genWrong)
        end
    case "c"
        if mySoln == "Polar"
            disp(dimWrong)
        elseif mySoln == "Spherical" || mySoln == "Cylindrical"
            disp(genWrong)
        else
            disp("This is a plane. It is easy to describe in Cartesian coordinates:")
            syms x y z
            displayFormula("z == 2*x-3*y")
        end
    case "d"
        if mySoln == "Polar"
            disp(dimWrong)
        elseif mySoln == "Spherical"
            disp("This is an ellipsoid. It is easy to describe in spherical coordinates:")
            syms x y z theta phi
            displayFormula(['"For  "' "theta" '" in [0, "' "2*pi" '") and "' "phi" '" in [0,"' "pi" '"],"'])
            displayFormula(["x == 4 * sin(phi) .* cos(theta)"; "y == 4 * sin(phi) .* sin(theta)"; ...
                "z == cos(phi)"])
        elseif mySoln == "Cartesian"
            disp("Fair, this is an ellipsoid so it is straightforward to describe as:")
            syms x y z
            displayFormula("x^2/16+y^2+z^2 = 1")
            disp("That said, to actually plot this figure, the equations become uglier:")
            displayFormula(['"For  "' "x" '" in [-4,4],"'])
            displayFormula(['"and for "' "y" '" between "' "-sqrt(1-x^2/16)" '" and "' "sqrt(1-x^2/16)" '","'])
            displayFormula(['"and for "' "z" '" between "' "-sqrt(1-x^2/16-y^2)" '" and "' "sqrt(1-x^2/16-y^2)" '"."'])
            disp("Can you find an easier representation to plot?")
        else
            disp(genWrong)
        end
end
end

function [startPt,startCoords,endCoords] = CreateExercise4(NumRange,convention)
arguments
    NumRange (1,1) double {mustBePositive,mustBeInteger}
    convention (1,1) string {mustBeMember(convention,["math" "navigation" "physics"])}
end

coords = ["Cartesian" "spherical" "polar" "cylindrical"];
idxFrom = randi(4,1);
idxTo = randi(3,1);
if idxTo >= idxFrom
    idxTo = idxTo+1;
end
startCoords = coords(idxFrom);
endCoords = coords(idxTo);
pts = randi([-NumRange NumRange],[1 5]);
switch startCoords
    case "Cartesian"
        x = pts(1);
        y = pts(2);
        if endCoords == "polar"
            z = 0;
        else
            z = pts(3);
        end
        startPt = [x y z];
    case "spherical"
        rho = abs(pts(1));
        theta = (12+pts(2)+pts(4))/6*pi;
        if abs(theta-2*pi)<1e-5
            theta = 0;
        end
        if endCoords == "polar"
            phi = pi/2;
        else
            phi = (6+pts(3))/12*pi;
        end
        startPt = ApplyConvention([rho theta phi],"math",convention);
    case "polar"
        r = abs(pts(1));
        theta = (12+pts(2)+pts(4))/6*pi;
        if abs(theta-2*pi)<1e-5
            theta = 0;
        end
        if convention == "navigation"
            theta = theta*180/pi;
        end
        startPt = [r theta];
    case "cylindrical"
        r = abs(pts(1));
        theta = (12+pts(2)+pts(4))/6*pi;
        if abs(theta-2*pi)<1e-5
            theta = 0;
        end
        if endCoords == "polar"
            z = 0;
        else
            z = pts(3);
        end
        if convention == "navigation"
            theta = theta*180/pi;
        end
        startPt = [r theta z];
end

num1 = startPt(1);
num2 = startPt(2);
if numel(startPt) > 2
    num3 = startPt(3);
end
switch startCoords
    case "Cartesian"
        syms x y z
        ptArray = ["x == num1"; "y == num2"; "z == num3"];
    case "polar"
        syms r theta
        ptArray = ["r == num1"; "theta == num2"];
    case "cylindrical"
        syms r theta z
        ptArray = ["r == num1"; "theta == num2"; "z == num3"];
    case "spherical"
        if convention == "navigation"
            syms r elevation
            sym azimuth ;
            ptArray = ["azimuth == num1"; "elevation == num2"; "r==num3"];
        else
            syms rho theta phi
            ptArray = ["rho == num1"; "theta == num2"; "phi == num3"];
        end
end
endingPhrase = "from " + startCoords + " to " + endCoords + " using " + convention + " conventions." + "Enter your answer as: ";

displayFormula('"Please convert the point"')
displayFormula(ptArray)
displayFormula(['"from "' "startCoords" '" to "' "endCoords" '" using "' "convention" '" conventions. Enter your answer as: "'])
switch endCoords
    case "Cartesian"
        syms x y z
        displayFormula(['"("' "x" '","' "y" '","' "z" '")."']);
    case "polar"
        syms r theta
        displayFormula(['"("' "r" '","' "theta" '")"']);
    case "cylindrical"
        syms r theta z
        displayFormula(['"("' "r" '","' "theta" '","' "z" '")"']);
    case "spherical"
        if convention == "navigation"
            syms r elevation
            sym azimuth ;
            displayFormula(['"("' "azimuth" '","' "elevation" '","' "r" '")"']);
        else
            syms rho theta phi
            displayFormula(['"("' "rho" '","' "theta" '","' "phi" '")"']);
        end
end
    if convention == "navigation"
        displayFormula('"Note: All angles are measured in degrees."');
    else
        displayFormula('"Note: All angles are measured in radians."');
    end

end

function outPt = ApplyConvention(inPt,startConvention,endConvention)
% inPt is in math coordinates (rho,theta,phi)
if startConvention == endConvention
    outPt = inPt;
    return
end

if startConvention == "math"
    rho = inPt(1);
    theta = inPt(2);
    phi = inPt(3);
elseif startConvention == "physics"
    rho = inPt(1);
    theta = inPt(3);
    phi = inPt(2);
elseif startConvention == "navigation"
    rho = inPt(3); % rho = r
    theta = inPt(1)*pi/180; % theta converted from degrees to radians
    phi = pi/2-inPt(2)*pi/180; % phi converted from degrees to radians
elseif startConvention == "matlab"
    rho = inPt(3);
    theta = inPt(1);
    phi = pi/2-inPt(2);
end
switch endConvention
    case "math"
        outPt = [rho theta phi];
    case "physics"
        outPt = [rho phi theta];
    case "navigation"
        if theta <= pi
            az = 180/pi*theta;
        else
            az = 180/pi*theta - 360;
        end
        el = 90-180/pi*phi;
        outPt = [az el rho];
    case "matlab"
        az = theta;
        el = pi/2-phi;
        outPt = [az el rho];
end
end

function numPt = PullOutPoint(solnPt,endCoords,convention)
arguments
    solnPt (1,1) string
    endCoords (1,1) string {mustBeMember(endCoords,["Cartesian" "spherical" "polar" "cylindrical"])}
    convention (1,1) string {mustBeMember(convention,["math" "navigation" "physics"])}
end
if solnPt=="(x,y,z)"
    disp("This is the default value, please enter your solution as numbers in the correct form.")
    numPt = nan;
    return
end

mathSymbols = asManyOfPattern(digitsPattern | characterListPattern("+-*/.,") | "pi"|whitespacePattern,1);
trigFunctionsPattern = asManyOfPattern(optionalPattern(mathSymbols) + asManyOfPattern("sin"|"cos"|"atan"|"sqrt"|"sind"|"cosd"|"atand")+"("+mathSymbols+")" + optionalPattern(mathSymbols));

if contains(solnPt,"(") && contains(solnPt,")")
    midStr = extractBetween(solnPt,textBoundary+"(",")"+textBoundary);
    if contains(midStr,"sin"|"cos"|"atan"|"sqrt")
        midStr = extract(midStr,trigFunctionsPattern);
    else
        midStr = extract(midStr,mathSymbols);
    end
    if any(midStr == "")
        warning("You must enter your point in standard mathematical notation." + newline + ...
            "You must use opening and closing parentheses and you may use" + newline + ...
            "numbers, +, - , *, /, sqrt(), sin(), cos(), atan(), sind(), cosd()," + newline + ...
            "atand(), and pi in your solutions. You may not use any other functions. ")
        numPt = nan;
        return
    end
    outStr = [];
    while contains(midStr,",")
        outStr = [outStr extractBefore(midStr,",")];
        midStr = extractAfter(midStr,",");
    end
    outStr = [outStr midStr];
    numPt = zeros(size(outStr));
    for idx = 1:length(outStr)
        numPt(idx) = ConvertToNumber(outStr(idx),idx,endCoords,convention);
    end
else
    warning("You must enter your point in standard mathematical notation." + newline + ...
        "You must use opening and closing parentheses and you may use" + newline + ...
        "numbers, sqrt(), sin(), cos(), atan(), sind(), cosd()," + newline + ...
        "atand(), and pi in your solutions. You may not use any other functions. ")
    numPt = nan;
end
end

function num = ConvertToNumber(str,coord,endCoords,convention)
arguments
    str (1,1) string
    coord (1,1) double {mustBePositive,mustBeInteger}
    endCoords (1,1) string {mustBeMember(endCoords,["Cartesian" "spherical" "polar" "cylindrical"])}
    convention (1,1) string {mustBeMember(convention,["math" "navigation" "physics"])}
end
num = double(str);
if isnan(num)
    num = eval(str);
end

if endCoords == "Cartesian"
elseif (endCoords == "polar" || endCoords == "cylindrical") && coord == 2
    if convention == "navigation"
        num = mod(num,360);
    else
        num = mod(num,2*pi);
    end
elseif endCoords == "spherical"
   switch convention
       case "navigation"
        switch coord
            case 1
                num = mod(num,360);
            % case 2
            %     num = mod(num,180);
        end
       case "math"
        switch coord
            case 2
                num = mod(num,2*pi);
            % case 3
            %     num = mod(num,pi);
        end
       case "physics"
                   switch coord
            case 2
                num = mod(num,2*pi);
            % case 3
            %     num = mod(num,pi);
                   end
   end
end
if abs(num) < 1e-15
    num = 0;
end
end

function tf = CatchImproperDimensions(vec,len)
tf = 0;
if numel(vec) ~= len
    warning("This vector is the wrong dimension.")
    tf = 1;
end
end

function endPt = CheckExercise4(solnPt,startPt,startCoords,endCoords,convention)
arguments
    solnPt
    startPt
    startCoords (1,1) string {mustBeMember(startCoords,["Cartesian" "spherical" "polar" "cylindrical"])}
    endCoords (1,1) string {mustBeMember(endCoords,["Cartesian" "spherical" "polar" "cylindrical"])}
    convention (1,1) string {mustBeMember(convention,["math" "navigation" "physics"])}
end
if isnan(solnPt)
    disp("Please try again.")
    endPt = nan;
    return
end
switch startCoords
    case "Cartesian"
        x = startPt(1);
        y = startPt(2);
        z = startPt(3);
    case "spherical"
        navPt = ApplyConvention(startPt,convention,"matlab");
        [x,y,z] = sph2cart(navPt(1),navPt(2),navPt(3));
    case "polar"
        if convention == "navigation"
            [x,y,z] = pol2cart(startPt(2)*pi/180,startPt(1),0);
        else
        [x,y,z] = pol2cart(startPt(2),startPt(1),0);
        end
    case "cylindrical"
        if convention == "navigation"
        [x,y,z] = pol2cart(startPt(2)*pi/180,startPt(1),startPt(3));
        else
            [x,y,z] = pol2cart(startPt(2),startPt(1),startPt(3));
        end
    otherwise
        warning("You shouldn't be here.")
end

switch endCoords
    case "Cartesian"
        if CatchImproperDimensions(solnPt,3)
            endPt = nan;
            return
        end
        endPt = [x y z];
        xVal = solnPt(1);
        yVal = solnPt(2);
        zVal = solnPt(3);
        syms x y z
        outStr = ["x == xVal"; "y == yVal"; "z == zVal"];

    case "spherical"
        if CatchImproperDimensions(solnPt,3)
            endPt = nan;
            return
        end
        [a,b,c] = cart2sph(x,y,z);
        endPt = ApplyConvention([a,b,c],"matlab",convention);
        if convention == "navigation"
            syms r elevation
            sym azimuth ;
            azVal = endPt(1);
            elVal = endPt(2);
            rVal = endPt(3);
            outStr = ["azimuth == azVal"; "elevation == elVal"; "r == rVal"];
        else
            rhoVal = endPt(1);
            thetaVal = endPt(2)/pi;
            phiVal = endPt(3)/pi;
            syms rho theta phi
            outStr = ["rho == rhoVal"; "theta == thetaVal*pi"; "phi == phiVal*pi"];
            if thetaVal == 0
                outStr(2) = "theta == 0";
            end
            if phiVal == 0
                outStr(3) = "phi == 0";
            end
        end

    case "polar"
        if CatchImproperDimensions(solnPt,2)
            endPt = nan;
            return
        end
        [a,b] = cart2pol(x,y);
        if convention == "navigation"
            a = mod(a*180/pi,360);
        else
            a = mod(a,2*pi);
        end
        endPt = [b a];
        rVal = solnPt(1);
        thetaVal = solnPt(2);
        syms r theta
        if convention ~= "navigation"
            thetaVal = thetaVal/pi;
            outStr = ["r == rVal"; "theta == thetaVal*pi"];
            if thetaVal == 0
                outStr(2) = "theta == 0";
            end
        else
            outStr = ["r == rVal"; "theta == thetaVal"];
        end

    case "cylindrical"
        if CatchImproperDimensions(solnPt,3)
            endPt = nan;
            return
        end
        [a,b,c] = cart2pol(x,y,z);
        if convention == "navigation"
            a = mod(a*180/pi,360);
        else
            a = mod(a,2*pi);
        end
        rVal = solnPt(1);
        thetaVal = solnPt(2);
        zVal = solnPt(3);
        endPt = [b a c];
        syms r theta z
        if convention ~= "navigation"
            thetaVal = thetaVal/pi;
            outStr = ["r == rVal"; "theta == thetaVal*pi"; "z == zVal"];
            if thetaVal == 0
                outStr(2) = "theta == 0";
            end
        else
            outStr = ["r == rVal"; "theta == thetaVal"; "z == zVal"];
        end

    otherwise
        warning("You shouldn't be here.")
end


if all(size(solnPt) == size(endPt))
    if norm(solnPt-endPt) < 1e-5
        disp("That looks good!")
        disp("This point can be written as:")
        displayFormula(outStr)
    elseif endCoords ~= "Cartesian" && endPt(1) == 0
        if solnPt(1) == 0
            disp("This is just the point at the origin.")
            disp("Any choice of angles will work, such as:")
            displayFormula(outStr)
        else
            disp("How far is this point from the origin?")
            disp("Please try again.")
        end
    else
        disp("Your calculations are off. Please try again.")
    end
else
    disp("Your dimensions are off. Please try again.")
end
end

function OpenPopup
fig = figure;
fp = matlab.desktop.editor.getActiveFilename;
fig.Visible = "on";
btn = uibutton(fig,"Text","Return to script","Position",[10 10 100 20],"ButtonPushedFcn",@(src,event)buttonCallback(fig,fp));

    function buttonCallback(fig,fp)
        edit(fp)
        close(fig);
    end
end
%[text] ## 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:2b20]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:155b]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:9ce0]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:732a]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:2799]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:9808]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:82c9]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:340b]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:8c93]
%   data: {"defaultValue":2,"label":"Enter an x-coordinate value: ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:2db2]
%   data: {"defaultValue":" -4","label":"Enter a y-coordinate value: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:dropdown:9d3a]
%   data: {"defaultValue":"true","itemLabels":["Show coordinate values","Just plot the points"],"items":["true","false"],"label":"Plotting options: ","run":"Section"}
%---
%[control:button:6c30]
%   data: {"label":"Plot","run":"Section"}
%---
%[text:image:09cd]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:8da1]
%   data: {"label":"Generate random point","run":"Section"}
%---
%[control:editfield:1737]
%   data: {"defaultValue":"\"\"","label":"My solution is: ","run":"Nothing","valueType":"String"}
%---
%[control:button:14bb]
%   data: {"label":"Check my solution","run":"Section"}
%---
%[control:dropdown:8116]
%   data: {"defaultValue":"6","itemLabels":["1","2","3","4","5","6","7","8"],"items":["1","2","3","4","5","6","7","8"],"label":"Number of lines","run":"Section"}
%---
%[control:button:1694]
%   data: {"label":"Plot the function","run":"Section"}
%---
%[text:image:43d3]
%   data: {"align":"bottom","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAABMCAYAAAAoVToVAAAEVElEQVR42u2c4ZG0IAyGrwRLoARLoIQtwQ7WEizBEiyBEiiBEiiBDjydifM5jiCQBPU+fuTX3e7iIyRvEuBnnuefamlWIVRoFVqFVqEx2\/f7FYtJMFGh\/QPTLPZZbFhML2YXmy\/Mwv8O8Nnmz0ODGdQvZiIAxZqB7xR\/ChrMCk0Iymfrb3xeDQ1ghZadW0zBclv9Vxv4Lrlbzgo+G1rGn1dBWx8+MLPWBxpDgBJ\/Zwy8GE3xO+zQYCb4HkAyzuou8KKGR0IDJ29KwzoZRx8IGOIx0MDfuJJ+xSNhxotA4SheINWyOA5OldRQMAaXEGW726B5gHVMUAaP2Ux50hWH5gG22kQchQ2jruuKQQMfFhrMQATMFRDEkh0aREkX4XDFC4BljTXngWKXy4CIgvZELnCCM2zQAsL1zARC721OvgeIssCMG8ihwZKZOWcZwodSWUsNTQd8wlHUNi+FpsmgQXXBm5ocwHXEKl+CWJ4L2YcKmvUAaw6+zuXMsl29TRequwWrw2hogaUhDjPC5fgyT7S82yQWmm9pjMfZQlxKutNUNjTwV+hok\/n97qLAODMLYJELrb\/44hEJTQcKlmK3fI+JuYbcd2SE1udCMxQhOuH7XWiwAEpcRHT2LOHKQc\/M0JodOBWbRUTmvxTWpEL7cEPbgWszxK69S7Nho9pI2F9Yl94E\/ipKvsD\/F89Hc6TGpe8h6iBtArq9Ua6oVGi+IKCwXZ0CFVnWYBB6MJZW3EPFrNcw0CSR75oKPrCjSPSzoRE6ezbf42uc7Pa5yZyXdjc0TvU+eAKKOZE3rtTyFATQOEs+OtBSbBN86nT8OwYaRUtOcVdcPQ0ZEeEm1C49k1TQLAG0vgC04TBrmoiAZEL1Q5TkeHggmMFfbT6rS2gSydDOAYy4NS+QHGpz9gnuYrzQkQaTRlHuz+AMCAbbCTs8t8Im7IZi2ycsIcUsalvE+CwmYZcXIV4QJOsWbNoKjFCSclxV10S\/K6mLkCSVDoYNMBPyReYXIRP8Dxc4WRLYiT\/TXI0V8n0bEU3qrLZbpK8laawI7sES5qsDsfgWHM1isj4BUe1tIJzVimtbwn6XkGCCZkpAOwkAuG0JCQGB9DRcYtqF3a5qU1YOVyT7EDVdWHWZxwVIEmgZ6Y8m0mqopm5G05luU1\/GctEFJYch9JmCFFpiNNMFBK7G+NATOUO\/UTlxmWrCCHp2fHsi9pdJ481Vzo4znQn8bodN206AJW955Uio3feB10IEgCWXkTgkQf8SYGUPlF0MZHwgsPERRxcvDqiaJyxRzxFx973zkOyFj3OcZaNIeeQoS+EcB\/8bjxyxHKeNI8roZ7qO5PhRyXKOhQdqGOWIfdUVEye+JHQAbcJesLS74GnibADdcW2OjMggttZgf3b91+FasAEgmYgNMWx3gZTyM6VO0qkSF6fccWdaTwxQbSeQ\/4ub+nZLTsUWAva3YNXrDeudkBVatQoNb78ox6WFMDJfcAAAAABJRU5ErkJggg==","width":25}
%---
%[text:image:222f]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:dropdown:6a6b]
%   data: {"defaultValue":"[x,y,z,label] =DefineCubePoints","itemLabels":["no selection","Draw a ribbon","Draw a cube","Draw a sphere"],"items":["label = DefineDefault","[x,y,z,label] =DefineRibbonPoints","[x,y,z,label] =DefineCubePoints","[x,y,z,label] =DefineSpherePoints"],"label":"Select a surface: ","run":"Section"}
%---
%[control:checkbox:7d90]
%   data: {"defaultValue":false,"label":"Open in popup window? ","run":"Section"}
%---
%[text:image:9c9e]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:97b3]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:dropdown:3504]
%   data: {"defaultValue":"\"??\"","itemLabels":["??","a)","b)","c)"],"items":["\"??\"","\"a)\"","\"b)\"","\"c)\""],"label":"The shape is described by: ","run":"Section"}
%---
%[control:editfield:2206]
%   data: {"defaultValue":"1","label":"rho = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:1281]
%   data: {"defaultValue":"pi\/4","label":"theta = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6a34]
%   data: {"defaultValue":"pi\/4","label":"phi = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:checkbox:888d]
%   data: {"defaultValue":false,"label":"Show the components of the point? ","run":"Nothing"}
%---
%[control:checkbox:95be]
%   data: {"defaultValue":false,"label":"Open in popup window? ","run":"Nothing"}
%---
%[control:button:4674]
%   data: {"label":"Plot my point","run":"Section"}
%---
%[text:image:8adb]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[text:image:7805]
%   data: {"align":"middle","height":23,"src":"data:image\/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiIHZpZXdCb3g9IjAgMCAxOCAxNy44Ij4KICA8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMjkuMi4xLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogMi4xLjAgQnVpbGQgMTE2KSAgLS0+CiAgPGRlZnM+CiAgICA8c3R5bGU+CiAgICAgIC5zdDAgewogICAgICAgIGZpbGw6ICNmZmY7CiAgICAgIH0KICAgIDwvc3R5bGU+CiAgPC9kZWZzPgogIDxlbGxpcHNlIGNsYXNzPSJzdDAiIGN4PSI5LjEiIGN5PSI4LjgiIHJ4PSI4LjkiIHJ5PSI4LjgiLz4KICA8cG9seWdvbiBjbGFzcz0ic3QwIiBwb2ludHM9IjExLjggLjQgMTYuNyAuNiAxMi45IDUuMiAxMS44IC40Ii8+CiAgPHBhdGggZD0iTTksNC41bC0zLjgsMi4xdjQuNGwzLjgsMi4zLDMuOC0yLjR2LTQuM2wtMy44LTIuMVpNOSw1LjZsMi4yLDEuMi0yLjIsMS4zLTIuMi0xLjMsMi4yLTEuMlpNOC41LDExLjlsLTIuMy0xLjV2LTIuNmwyLjMsMS40djIuN1pNMTEuOCwxMC41bC0yLjMsMS40di0yLjdsMi4zLTEuNHYyLjZaIi8+CiAgPHBhdGggZD0iTTE0LjgsM2wtLjUtLjUsMS42LTEuN2gtNHY0bDEuNi0xLjcuNS41YzEuMywxLjQsMS45LDMuMywxLjksNS4yLDAsMy45LTMuMSw3LTcsN1MyLDEyLjcsMiw4LjksNS4xLDEuOSw5LDEuOVYuOUM0LjYuOSwxLDQuNSwxLDguOXMzLjYsOCw4LDgsOC0zLjYsOC04YzAtMi4yLS43LTQuMy0yLjEtNS44WiIvPgo8L3N2Zz4=","width":24}
%---
%[text:image:886a]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:554e]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:5ccc]
%   data: {"align":"baseline","height":310,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAboAAAGICAYAAAA3RSUjAAAACXBIWXMAAAsSAAALEgHS3X78AAAgAElEQVR4nO3de1yUZd4\/8M8AchIGRlQ0RBAsTSxQPFZPjAVJpw1T2H7t7iOdsHYrobagbUts24JalXbbTcgKd\/d5tkQ2fHpqdaHHsc08ouPmsZIGURMLOQoMMHP\/\/hhmHGBmmBlmuOfweb9e81qduee+Lzf14\/W9v9d1SwRBAJGbE+s38RIACpGuTURW8hF7AERERM7EoCMiIo\/GoCMiIo\/GoCMiIo\/GoCMiIo\/GoCOPJpFI7HoVFxeLPXQichAGHREReTQJ19GRBzD7m7impsaqE9TV1WHVqlUAAJlMhtOnT0Mmkw33Na6jI3IDfmIPgMiZUlNTrTouLS3N8OPS0lJrQo6I3ARLl+T1iouLDTO\/zMxMZGZmijwiInIkli7JE9j9m7iurg7z5s1Dc3OzLSVLPZYuidwAZ3Tk1VatWoXm5mYAQH5+PkuWRB6IQUdey7hkmZqaivz8fJFHRETOwNIleQKbfxMPLlkePHgQcXFxtp6GpUsiN8AZHXmlwSVLO0KOiNwEg468DkuWRN6FpUvyBFb\/JnZQyVKPpUsiN8AZHXkVliyJvA+DjrwGS5ZE3omlS\/IEw\/4mdnDJUo+lSyI3wBkdeQWWLIm8F4OOPB5LlkTejaVL8gRmfxM7qWSpx9IlkRvgjI48GkuWRMTn0ZHHMi5ZxsXFITk52eoHscpkMiQnJztzeEQ0Sli6JE9g8jfxuHHjDLM5W6WmpqK6unq4w1i6JHIDLF2Sx7I35IjIs7B0SR6L1QoiAjijIyIiD8egIyIij8agIyIij8agIyIij8agIyIij8auS\/IES6w8bqfxTyQSyYAPTXRpDndepZXXJSIRccE4eZMBv9mtCDrJ4DeIyP2wdElERB6NQUdERB6NQUdERB6NQUdERB6NQUdERB6NQUdERB6NQUdERB6NQUdkxqytDbFij4GIRo5BR2SG6oV7q2ZtbZCLPQ4iGhnujELexKadUWZtbVjb\/8MLAN4\/viK6xZmDIyLn4IyOaHiTVM9nfDpra8MisQdCRLbjjI68ib0zOmMnAVQdXxHd7ejBEZFzcEZHZJuZquczdvuFyraKPRAisg5ndORNHDGjM7b3+Iro7Q4ZGRE5DWd0RPZbNGtrw6OztjZMEnsgRGQeg45oZCapns\/4mI0qRK6LpUvyJo4uXQ7GRhUiF8QZHZHjzFQ9n7GbO6oQuRbO6MibOHtGZ4yNKkQugjM6IudYFBR\/3R42qhCJjzM68iajOaPT6wagOL4ieq8DzkVEduCMjsi5AgGkB8bM3OXjN+YvYg+GyBsx6IhGgU9waFhg\/PWzZm1tmCn2WIi8DUuX5E3EKF2ashe6ciaXIRCNAs7oiEbfom\/z79jJRhWi0cEZHXkTV5nRGdvORhUi5+KMjkhc6UHTEj6ftbUhUOyBEHkqzujIm7jijE6vG7rtw06O4jWJvAJndESuIRDAfQFXxVVzdkfkWAw6IhfiGxYxAUA2G1WIHIelS\/Imrly6NIWNKkQOwBkdkYtSvXDvRjaqEI0cZ3TkTdxtRqfHRhWiEfATewBENCxdo8qU6TfHl+y8w8N2VIkFkC3yGLxdOQCVyGNwKs7oyJu464zOWAuA94+viL4g9kAcRA5gp9iD8HJLACjEHoQz8R4dkXsJB\/Cof+RUPtSVyEoMOiI3NP2Pu\/fO2tqQPWtrQ7jYYyFydQw6IvcVC+BRPvqHyDIGHZF7C1S9cO\/7s7Y2ZHAZApFpDDoiNxf7m79XAUiCbnbHHVVGQV1dHQoKCiCRSAyv4uJip1xr1apVkEgkqKmpccr5vQGDjshzhKteuHe7pzeq1NTUICsrS9Trz5s3D7W1tTh9+jQEQcCWLVtQXFyMefPmoa6uTrRxrVq1Cs3NzaJc35VxHR2RB+mf3WHW1oZs6BaZt4g6IAfLyspCXFwctmzZIsr16+rqDGOorq42vJ+ZmQmZTIa0tDRkZWXh4MGDoz621NRUyGQyzJs3D6WlpUhNTR31MbgqzuiIPFMsgEfHhI\/\/UOyBOEJzczPmzZuH5ORkFBUViTYO\/YwpJydnyGepqalITU1FbW2t08qYw0lOTkZ1dTVWrVol2hhcEYOOyHMFXr3p8JFZWxvuc\/dGlbS0NMTFxSE\/P1+0MdTU1Bjuk2VmZpo8Rv9+cXGxaCVE\/Yy3oKAAZWVloozB1TDoiDzfTOgaVWLFHog9CgoKUFtbK+pMDoAhNJKTkyGTyUweoy8XNjc3o6KiYtTGNlhycjLy8\/OxatUq1NbWijYOV8GgI\/IO4aoX7q2atbVBLvZAbFFRUYHi4mLk5OQgLi5O1LHoZ3OWxhEXF2cIQbG7JPXlVTEbd1wFg47IS\/Q3qshnbW141F12VCkoKAAA0RsramtrDaXI4QJX\/7nYQRcXF4fMzEzU1dV5\/f06Bh2R95mkej7j01lbG5LEHoglZWVlhlZ9W4OuuLgYaWlpA9a5paWl2f0XvnH5z1zZcvDnzc3Ndt+n04eTRCIxlEzT0tJs\/jUkJycDEPeeoStg0BF5odjfVn0EIMOVG1X097gs3RMbrK6uztC4Ul1dDUEQUF1djczMTNTU1KCgoADz5s2z+S99W443nvHZs6aupqYG8fHxqKioQHV1taEEWV1djeTkZBQUFCA+Pt6qe2+ucs9QbAw6Iu82U\/Xc3Z\/5hcq2ij0QY83NzYbSn35WYs130tLSkJmZOaArMjU1FVu2bDE0s9TW1iItLc2m8RgHlrWhqx+TLfRj0wf14JlsUVER8vPzDYE+XJAah67YpVQxMeiIvFzsqx99cs17\/z7qSo0qxn8pW9uEUlBQgLq6OrOt\/\/n5+YbPamtr7W6912\/JZe41kpZ+feNIfn6+2UDVf9bc3Gy4h2mOTCZzmXuGYmLQEZGefNbWhkd9AoL+W+yB2DqDqqurMwSMpeONlyjYG0ilpaUQBMHsy97GmZqaGsOv21xYA7pfn\/4aFRUVw87qjO8ZirU9mdgYdERkbFJg7KwZYjeq2PoXsv7+kzUdkcazOmuvYxyew5Uj7W36MF6+MFy4G5dzh7v3ZnwuBh0REdyjUWUwW8LFOCTsCTpbxmLL2j9bFnaPtOHF2zDoiMicmarn7v7MHXZUsSXobAktPeNgGe5a+uAxvj\/maPb8GrwZg46IzIp99aNPAGTP2tqQLvZYnMHajk7j+26WZlDGIThai9wZesNj0BGRNRYFxV+3Z7Qe7GrLDMpW+vPZsj5PJpMZQtFSidH4M2tDdPDx1pQi7V3uIPY2amJh0BGRVaYVf7IDutndImdfy5l\/IetDwtSjdizRH19XV2c2fPVBJ5PJbD6\/cTAOtxTAOOiGu85olFJdHYOOiGwRCCA9MGbmLmc2qhiX\/Ry5+75+h5Dk5GS7gk4fFOaWJugDytI6OHMyMzMN5x+uk1L\/eU5OzrDXsXcbNU\/CoCMim\/kEh4YByHVWo4rxWjFbugrr6uoszob0C7JNPaFcvxB83LhxZoNGvw6vrKxsyKxO\/7w6\/SNyTBnuGsbnNxfwxcXFqKurQ1xc3LCPLjI+B4OOiMgG\/U9CCIQTG1WM17vZcp8uLS1tSNjV1NRg3rx5qKurQ3V19ZASXk1NjWGW1tzcjKysLJMBm5mZidLSUsMWXPogqaioQFZWluEJ36ZYc43MzExDCJv6dZSVlaGgoMCwRdhwszn992UymcVF6J6OQUdEI6J64d4iZzSqGJcKrd2QOC4uDqWlpUOeXFBQUIDMzEycPn3aZJNIcnLykPfNXTMnJwcHDx5EXFwc5s2bB4lEglWrViE\/Px8HDx40Gz7WXkM\/zvz8fKSlpQ14ekFZWRmKiopw+vRpq+636YPYnlKqJ5EIgiD2GIhGy4Df7BKJZOCHg\/4szNrasNb5Q\/Io3QAUx1dE77XhO3IAO819WFNTg7S0NKSmppqdKQG6kmBZWRni4uJw+vRpGy4\/VHNzM8aNG2fYQNkZbLmG\/tdmapPn4a4RHx8PmUxmMYABLAGgsPrEbogzOiJyFIc3qqSmpiI\/P99w\/2s06MuJti4PcLVr6O8jbtmyxatncwCDjogcLG5d9U44sFGlqKgIqampw+7U7yjFxcXIzMx0avOGs6+hf3BrUVGRU8PUXTDoiMgZAgFkB1wVV+2I2Z2+8ULfNeksBQUFhlmQu15D3+iSn5\/vtNKru2HQEZHTxP9+127oOjMHNKpERUWFR0VFlcyePft\/oqKikJaWhnXr1qGtrc3sufTdkmlpaUO6MPU\/t7dEV1dXN2zX5EiN1jXS0tIYcoP4iT0AIvJ4kwA8Omtrw\/bjK6L3RkVFxUqAIwIg1QfU8ePHcfz4cWzfvh2VlZWQSqUmT1RUVISamhqsWrVqwIxIfx57d\/6Ii4tz6ixuNK5RU1ODiooKq5YdeBvO6IhoVKheuHfjrK0N2fDx+bMASGeG+ODN2QHYf1MQXpnpj1A\/CY4fP44XX3zR4nlSU1OHBIa+jd5bt7gCdP+\/lJaWMuRM4PIC8iZcXiCy3n8rJnW+U7AKAGoWBSEq8Mp\/g\/0tGqxUqgEA586dE2eA3onLC4iIHEXoaAkEgPnhPogKlKBHe+UfFwvCfTEzRPdX0p49e8QZIHkk3qMjolHX3qf7X3+fgbPqc9264FuxYsW0c+fOqUZ5WOShOKMjolHzwLI7QgFgQbjurx7jYvGbql609wkAUM+QI0fijI6IRsXkYN\/AX94Qd2fgyv+H+05XAQA+vqiBqlOL\/S0aHGjR6g\/NFW2Q5JE4oyOiUfH6woj0AF9JwP19pxDqJ8GBFi2eOa7GH1W9hpC76667dp07d65K5KGSh2HQEZHTZcWFxM6NCEhs+9f\/YOy5kwCAvVNvwuLFiwEAcrkce\/fuRWlpqULEYZKHYtARkVNNDvYNfGp2WIbQ2YaesucAAG9\/J8ETxX8wBN3cuXMRHR0t5jDJgzHoiMip1iaPk0v9fcIuvv5z+Gt7cLJDi4Rnf2929xMiR2PQEZHTZMWFxN4UGbiw72A1gr7aBwD4aNw8pKc75aHkRCax65KInMK4ZNnyRi78oStZPlP1tthDIy\/DGR0ROYW+ZHm+rBD+2h6c7xaQmFvMkiWNOgYdETlcalTQpJsiAxf2ndiH0AMfAQD+HpqI1B8tg1ojqA81qY+IPETyIixdEpHD\/TpJliF0tuHia48hBMD7FyV4vPI9AMBHZzoVoWMkI34YK5G1OKMjIofasChCPjHIN\/KH8lcQ0tOO890C\/O99ElKpFGc6+upfrL20V+wxkndh0BGRw6RGBU1aOiU4pe\/EPgTsrgQA\/NV3OrIfexwAUHCgibue0Khj0BGRw\/w6SZYBAOdLngIAfNwkwap1ui7LHWc7dymbelrEGx15KwYdETmEvmT5\/XsvI7zjItr7BKjveRLR0dG42KVpzNvbpBB7jOSdGHRENGJJEf7hS6cEp2jqTyCgZjMAYLMwzVCyfFnZzJIliYZBR0QjVjQ\/IgMAzr3yMABgV4sEP1v3LgBdybLmXNcF8UZH3o5BR0Qj8lLyuEVTQ\/xi2v77dUPJUpWSzZIluQwGHRHZLSnCP\/zuqcFy7ffn0PXxOwCAzZ0T8MSzvwLAkiW5BgYdEdmtaH5ERoCvJOD8qw8jCLqnhN9TtAkA8Hlj9z6WLMkVMOiIyC6GkmXVRkgbv0F7n4DTN\/0MCQkJaOvRtq6pvaQQe4xEAIOOiOwwoGRZUQIA2NodgZznCgEA64+2Vn3XqekWcYhEBgw6IrLZmrnj0geXLFNf0XVZft7YvW9LXYdK3BESXcGgIyKb5MyUzpwRNmZG27\/+B9LGbwAADYuzWLIkl8WgIyKrTQ72DXzsWmmG0NkGdVkBAOAvl4Jw75PPAWDJklwTg46IrPanGyfouixfeQQB2l6c7NBi7oulkEqlONSkPsKSJbkiBh0RWcW4ZBn67SEAwIFr78TixYuh1gjqZ\/Y1bRd5iEQm8cGrRDSswSXLAOhKlj9762UAwFsn2liyJJfFGR0RDev1hRHpAb6SANWbv0KAthfnuwXMz98AqVSKU629p8pOtp0Ue4xE5jDoiMiirLiQ2LkRAYltB3ci4sgOAMDn8alYIL8Vao2g\/vnu77nNF7k0li6JyKzJwb6BT80OyxA629Dxx6cRAuD9ixLc99ZrAFiyJPfAGR0RmbU2eZxc6u8Tdr6sECE97TjfLSDuiWKWLMmtMOiIyKSsuJDYmyIDF\/ad2IfQAx8BAP4emojUHy2DWiOo1x66xC5LcgssXRLREPqSJQBcfO0xhED3MNXH\/\/YeAOCjM50KZVNPi5hjJLIWZ3RENIS+ZHl24wsI6WlHe5+AoFW6kuWZjr76F2sv7RV7jETWYtAR0QCpUUGTbooMXKipPwHpv94HAGwJSjCULAsONLHLktwKS5dENMCvk2QZAHDmNw8gArqS5UN\/+wsAlizJPXFGR0QGGxZFyCcG+UZ+\/97LiOhqQnufgKa7nmTJktwag46IAOhKlkunBKdovz+HgJrNAID\/RRSyH3scAMCSJbkrBh0RAbhSsvy28GcAgEPtEtzxu78CAHac7dzFkiW5KwYdERlKlhf\/VoIJLQ1o7xNwPi0H0dHRuNilaczb26QQe4xE9mLQEXm5pAj\/cH3JUvvRWwB0Jcv7n\/glAOBlZTNLluTWGHREXq5ofoShZBks0Q4pWdac67og6gCJRohBR+TFXkoet2hqiF9M27\/+BxNaGgAAqgXLWbIkj8KgI\/JSSRH+4XdPDZYLnW3o2vgsAGDL5XBk\/\/pVACxZkudg0BF5qaL5ERkBvpKA+pceQBA0ONmhxeLflgMAPm\/s3seSJXkKBh2RFzIuWY5r+DcA4Pj8LCQkJKCtR9u6pvaSQtwREjkOg47IywxXslx\/tJUPUyWPwqAj8jJr5o5LD\/CVBHy17mkEQYPz3QJufOGPAHQlyy11HSpxR0jkWAw6Ii+SM1M6c0bYmBltB3di8kkFAODQdffg2uQFLFmSx2LQEXmJycG+gY9dK80QOtvQ9oc8AMCHLYG466k1AFiyJM\/FoCPyEn+6cUJGgK8kQPXmryDtu4zz3QKufaYEUqkUh5rUR1iyJE\/FoCPyAsYly4gjOwAAn8enYoH8Vqg1gvqZfU3bRR4ikdMw6Ig8nL5kCQDf\/ykfAPDFZX9k\/fo1AMBbJ9pYsiSPxqAj8nCvL4xID\/CVBJx+41lMUDejvU\/AuNzfQyqV4lRr76myk20nxR4jkTMx6Ig8WFZcSOzciIDEtuMHMGH\/hwCA\/4tOMZQsf777e27zRR7PT+wBEJFzTA72DXxqdlgGADStfwIRAHa1SHDPWxsAsGRJ3oNBR+Sh1iaPk0v9fcLObnwBEV1NaO8TELTqNZYsyeuwdEnkgbLiQmJvigxcqP3+HHx3fQAAqAmMR+qPlkGtEdRrD11ilyV5Dc7oiDyMccny61\/fj8k+Ag61S7DsrxUAgI\/OdCqUTT0tog6SaBQx6Ig8jL5keea9IkzuOI\/2PgHCf66FVCrFmY6++hdrL+0Ve4xEo4lBR2SnBJl\/7MQg30n+PpLAj59\/6Jqv\/2\/b5Lteee\/fgQtuP3ymo+9Ce6921Bs9UqOCJulLlv7\/fA\/w0ZUsV664H2qNoC440MQuS\/I6DDoiGySPD5g5XTomaXygzwzj9ydGyPA1gGkTZdfPmBx4PQD80K09dfZy38ndjd3K0Rrfr5NkRiVLLUuWRGDQEVklQeYfu3hiYEaAL8Ks\/c74QJ8Z4wP9Z1wb7i8\/3KTeXvuD2qldjhsWRcgnBvlGXtj+N0zuOA8A+H7JSpYsyesx6IiGcffU4PSpIX4L7f1+gC\/CFk0M+PF06ZhTnzR0VjmjpJkaFTRp6ZTgFKGzDfhzISABtmki8bO85wEALFmSN+PyAiIzQsf4BGZfE\/roSELO2PhAnxnLp43NDh3jE+iI8xnTlyxPPncfgiVafNUJyF\/\/GwBgx9nOXSxZkjdj0BGZsXza2OyxfpJIR55zrJ8k0tFhZ1yyjPrhawDAtzdnIzo6Ghe7NI15e5sUjroWkTti0BGZ4eiQMz7vHdHBGY44V1KEf7i+ZNn5598AAKo145HZX7J8WdnMkiV5PQYdkQjGB\/rMuDEyMGmk5ymaH5EBALVrczBe0ovveoCFL70LQFeyrDnXdWGk1yByd2xGIbLTD2dVOLyjCtvWFxre+8PDGZixWI6Zi+VIeyjX4vdnj\/NP\/\/elnpP2Nqe8lDxu0dQQv5i2gztxzdlaAEBtwo9w\/zXXmi1ZTg71Dx8f7B9u6nxfNvIJ4+SZGHREdji1R4E\/PJyBqQlJeGJTFQ7tqMLuinI8sakKJ\/cosG19IXZvKceD68sxNcH0xM1PgoB5EwKSdp7vsrntPynCP\/zuqcFyobMNl0qewDgAH3dKcX\/hOgADS5bXRYbEzpoYnDRxrP9MPx9JgLlzpsbL0NGjaVQ1dyv3nm1Vtqv5ZAPyDCxdEtnozDEl\/vBwBsZPicXjm6owY7F8wOf3PFWItIdy8cNZFd58OAM\/nFWZPVd86JhF9oyhaH5ERoCvJOCrdU9jnKDG+W4BSb9+CwDweWP3vppzXRemjwua9MDcydmp8bKVV4UGJFoKOb0Qf9\/I2ZFjl2bPmZx754wI+XDHE7kDzuiIbPTuU9kAgLSHcxEsNVkFRNrDudhdUY7OthZsW1+Ih9aXmzwuwBdhkUG+4Y1dGqvb\/w0ly+MHMPmkAgBwbFY6licvQFuPtnVN7SXFzbHhSYmTQtJNhdu1O8sQ+fVuRH79heG9xqtvQOPVN+LEkhwAgJ+PJOCaiOCUiXP9Y7ceu\/g+Z3fkzjijI7LBqT0KwwxtzlLzjZPB0nDDTO\/wjiqLs7rp0jGx1l5fX7IEgHOvPAIA2K8OxvLfvAkAWH+0terqiaEzk68KvWdwyIU0NUBethIdEdFQ5GzGB69\/DUXOZjRcfzsiv\/4C13\/yOm57Yxn8u1oN3wkP9Iu577rI7NAAX4ev\/SMaLQw6Ihuc3KMAAIyfEmt2NqdnfG\/u8A7zXf4hY3wsn8jImrnj0gN8JQHHip9ElHAZ7X0Cop57G4CuZHmoRdOdfFXoPYO\/59\/VipS3V6Lh+tvRcP3thvcbr74BX\/zs9\/j3Hc8AAGRnj0Jelj1wfP6+kffMnOCQ5RBEYmDQEdngzHHr92cePyXW8OMfGlRmjwv395lkzflyZkpnzggbM6Pt+AFE\/\/sfAIC916TjWqOSZdr0cfeZ+u71n\/wOIU0NaEi83dTHOLEkxxCAsrNHEb\/3\/QGfTxg7ZsbNseEjXg5BJAYGHZGTDDfj0\/PzwbBlwcnBvoGPXSvNAICz63XLFr647I+0Z14BcKVkGejnM2TT6ZCmBkNw9QSZ35NaP6sDgPh9Hwz5PGHiWPlw4yRyRQw6olFgbeiZ86cbJ+i6LDcWYkrXRbT3CRj\/WBGkUikONamPbKnrUM0YH2yyg1M\/++uIiLZ4jY6I6AGzupCmhgGfB\/r5hC2YIp05ol8IkQgYdEQ2mDpLV72z1FyiZ3xMcJj5oPuhW2vxZIaS5bcnEar4bwBA7aRkzFt6N9QaQf3Mvqbtk0P9w0P8fU1uWTbGqLlkOM1TZht+PPZSw5DPp8kCGXTkdhh0RDYwbjA51d+YYo7xfbkbM7PNHtejFcy27g8oWf72IYz1FfDvLj\/If6NrQHnrRFvVd52a7uiwQLP3+fy72iyOc8BYgqQWP5cG+Fl1P5HIlTDoiGwwZ2mGocnkkIVOSuBKp+WNmdkWS5f17X0qc5+9vjAifXDJMnDVa5BKpTjV2nuq7GTbSQCYMHaMwwOoeUrCkPfMzRqJXBmDjshG9zxVCADYXVGOM8dMd2FWv1OCH86qMH5KrOF4U9QatNa195rceDkrLiR2bkRAYlvjOYTu0pUsj0683lCy\/Pnu7x3+ZAL97K95ymyLjStE7oRBR2SjOUszDDudvPlwxpAS5u6KcmxbX6jbIuydKouzuYbLfSaTcnKwb+BTs8MyAKB+bTbG+gj4qhNY\/FvddfUly5H\/agbS35c7vfDHjj41kWi4BRiRHeYszUDhDiUO76jCHx6+spZav9Gzfr9LS\/oEqL9o7Da5ofPa5HFyqb9PWN2H7yKmVQUA6MrMH1KydCT\/rlZEH\/kHmqfMxulFJpfjEbklzuiI7DR+SizSHsrFm8daDM0mT2yqwrNbFMOGHACo2vv2mnpET1ZcSOxNkYELhc42BG8pBgBs952K\/7j\/Yag1gnrtoUvb7RlvSFPDgP0tB7vhL08CAL746e\/tOT2Ry2LQEYngcp\/QuONsp2Lw+8Yly9qC+xHso8V3PUD6mx8CAD4606lQNvVYvQH0YPKylUPCLvLrL3DbG8sw9lIDFDnlw663I3I3LF0SmXG5T2gc6ydxeJdhnwD1Pxo63zf1mb5k+c0nH+CaplMAgEt3PYkZUinOdPTVv1h7yWSps109\/NMPOiKicVKeA3nZygHvN0+ZjYbrbzc8ucDiOXo0jcMeRORiGHREZlR+e7l8+bSx2Y4Muz4B6uqzXeWmHsuTGhU0SV+yxJ\/XAL7ALt8o3L3yCag1grrgQJPZLsuvmzpVyVeFDnv904vuG9H9tzZ1n8kOUSJXxtIlkRntvdruym8vl7f0aOsdcb7LfUJjleryRnPLCX6dJMsAgD3PZ2Oirwbf9QApr\/8XgOFLlt+197R092mt3wLFTt+196icfQ0iR2PQEVnQ3qvt\/q9vOsqPt\/Tu6BOgtuccfQLU37T17Sr\/qn2juQesblgUIZ8Y5Bv53a6PMPvilwCAkwvugzQyymLJ0tixi5cV9ozPWt192tbPVC3WP76ByEWwdElkhZ3nu\/Ye\/F6tnDchICk+dMyiAF8Mu5parUFrw+U+5ReN3Sa7K\/VSo4ImLZ0SnAIAl0qfx1gJsFszDvc88xsAgKWSpbHPVC3KhIlj5aaeYOAIzg5SImdh0BFZqb1X273zfNfenejaGxc6ZtLkYN9JIWN8wscH+sTe\/qv1uP1X6\/5gQsMAACAASURBVPFDt1Z1vKW3u769T2WuRDmYcckyQdKFDg1w3UvlAIAdZzt32dJl+Xl9a1VqvGxAt4l\/p66i2TuCnU5auvvqOZsjd8WgI7JDXXvvBWuDzBJ9yfL8vp1IUO0GACgTl+GOa67FxS5NY97eJoUt5\/uysUMlC\/LbZvyUcf\/+pxd0jLNv2UBHj6Zx67GLJrtEidwB79ERiSQpwj9cX7JsfmM1AOCwNgx3PPcaAOBlZbNde1l+pmpR1p5v36b\/uezsMQDDP4\/OlI4eTeP7XzaWt6sdv90Y0WjhjI5IJEXzI4aULONf+gsAXcmy5lyX3TPGz1QtyvNt6gv\/ERue\/uFLB2Ns\/X6fVlDXNXft\/fiUbTNKIlfEoCOyoH3\/9kltn2+b2f3tsdjBn42ZFHNhTMRVLeG3ZJ0MuibZpt1KXkoet2hqiF9M27cnEXN6N+ALfBlzA5baWbI05ZtLXRe+udRVvmCKdOY1EcFJE8aOmTHcd7r7tK1nWruVh863K79rt38HFiJXwqAjMqG8vBxfPZ6bq7ncaraDo+eCKgYAWj7921LfsWGtY6+\/STnxP3+9d8z4KItlvqQI\/\/C7pwbLAeCbF3+K6b7Asd5ALC3eDMD+kqU5+8+2ndx\/VrcJ9PRxQZOCxvgGmjpO1dJ1gSVK8kQMOiIjKpUK2dnZ2LVrFwCEAWEAMgDIAcQOOloBQAlAAc3l1rC2PR+ntB+oWRQ6P3WvpcArmh+REeArCTiyIR\/Tta1o7xMwLle3kfLnjd37RlKyHM43l5x3biJXxaAj6qdUKpGSIkdbWyt0AVcIIBuAuefJyY1+XA6gHELfroC2PR+ntB+sWTQhM7cqYtkvBjxOx7hkOWHf3wFf4GjsjVh6wxK09Whb19ReUjj610Xk7dh1SdTvSsglQjdTy4X5kBssG7oZ3k4AMRB61QEX\/7v4x2d++7N0\/RHGJcsvX8xGiC+g6vM3lCzXH211ysNUibwdg46o35WQU2BomdJacuhCUrdc4LJy10LVC\/dmAMCauePSA3wlAfvffg3XaZsAAIGrdM+b+7yxe9+Wug6V3YMnIrMYdEQGYQCqYP0szpxwACUA3gMAdJ08mBj+wQsrZoSNmdHWeA5TPn0bAHBo8jxcc8tdLFkSORmDjsigBPbP5EzJhj7s9mzdnKBUKvHNCz9FiC9wWu2LuS+WAmDJksjZGHREBtlOOqduN643n\/wFpl8+CwDwve9ZSKVSHGpSH2HJksi5GHRETlcCWaAfnp6g6+w\/FD4D1694EGqNoH5mX9N2kQdH5PEYdEROF4sX58QjKtAHF3okhpLlWyfaWLIkGgUMOiInu2XKu3hwmgYA0Pyj1ZBGRuFUa++pspNtJ4f5KhE5AIOOyIl8fNrw5gLdEoJjoXFY+LNfQK0R1D\/f\/b1Dt\/kiIvMYdERO9MLcVYgK1KJDAySsfRcAS5ZEo41BR+Qkcyb8L5665iAA4Oytj7BkSSQSBh2Rk7y1KB8A8KVPBBY88izUGkG99tAldlkSjTJu6kzkBGvm\/T9cG9qDDg1w3fpKAMBHZzoVyiY+441otHFGR+Rg8eE78UjcAQDA9wvvhTQyCmc6+upfrL20V+ShEXklBh2Rg2284UmE+knwjU8YEvOKodYI6oIDTeyyJBIJS5dEDpSXuBILwrvRoQGmv\/xXACxZEomNMzoiB5kmPYCnZ3wBAPh6xi2QTpvJkiWRC2DQETnI7xY+hlA\/oEEIQspa3TZfLFkSiY9BR+QAy6c\/i9QJrQAA2eo3AAA7znbuYsmSSHwMOqIRGhd4Am\/M\/RAAcCz2Rly1cAkudmka8\/Y2KcQdGREBDDqiEVu\/OBuhfsAZbSAW\/7YcAPCyspklSyIXwaAjGoG0mBewbPIlAEDEo68A0JUsa851XRBzXER0BYOOyE6ywHP4\/bz3AQBHJ16HySl3s2RJ5IIYdER2Wjv\/J7gqALio8WXJksiFMeiI7HBL9B+wMvqc7if\/uRaSYCk+b+zex5Ilketh0BHZyMenDUVz\/wAAqA+LxfQ7foy2Hm3rmtpLCnFHRkSmMOiIbPTSwmWYMVZAp9YHs3+nezLB+qOtfJgqkYti0BHZYF7kJjwx7QwAoDMr31Cy3FLXoRJ3ZERkDjd1JrKSj08b\/rTwNQC6kuV1yx5kyZLIeiUAkkS4bjmDjshKudc\/ghkhAi5rJIh5RnePjiVLIqslAUgR4boKli6JrDBd9hGeuqYWANAuvx\/SaTNxqEl9hCVLItfHoCMaho9PGzYufhahfhKcDZqIax4thFojqJ\/Z17Rd7LER0fAYdETDePDaX2B+eB8uaySY8vw7AIC3TrSxZEnkJhh0RBZMDPkUhQl7AACdizMgnTYTp1p7T5WdbDsp8tCIyEoMOiIzfHzasPGGJxHqJ8H3ATLEr34Nao2g\/vnu77nNF5ED1dTUQCKRQCKRID4+3q7vNDc3mz2WQUdkxvL4X+HW8T0AgAm\/\/CMAliyJnCE1NRWpqakAgLq6OpSVlQ37neLiYsOP8\/PzIZPJzB7LoCMyYXzwfmyYo+s1abj+dkhnzWfJksiJ8vPzDT82DjFTampqUFNTA0AXkjk5ORaPZ9ARmfDC3McQ6ifBJQRg1hMvQ60R1GsPXWKXJZGTGAfWcLO6wbO54TDoiAa5LfZpZE9tAwCMy\/sDJMFSfHSmU6Fs6mkReWhEHs2aWZ3xbC4nJ8dQ8rSEQUdkZHzwfrwxdxsA4LuZckjnLcGZjr76F2sv7RV5aEQeLy4ubthZnT4AZTKZVbM5gEFHNMDq63+BqwIl6IIvrnl6HdQaQV1woIldlkSjpKioyNBYMnhWZzyby8\/PR1xcnFXnZNAR9VsU9RyejNNVJ4MefY0lSyIRGM\/UBs\/q9MFnPPOzBjd1Jur3RrLu2XLnxl+Na\/\/jRwCAFdPGLl0xbexSMcflZdb0v8jz1Ft7YE5ODoqLi9Hc3IyysjLk5OQMmc1ZWk4wGGd0RACeu24cZoYI6BR8MPPV98UeDpFXM57V1dbWoqamxjCzs2Y5wWAMOvJ6U8eOwc9nhgMAJFm\/hCRYKvKIiMj4HlxBQQEqKioM79tMEAS++PL0V7ggCCXCIAAEAMLHqVFC6\/3ThY9Towzv8cUXX4595efntwz+Mzic0tLSAefIycmx9RSCIAiFnNGRp0sCoACwWv+GSqWCXC4HAFwnC8D1sgC09Wrx2J6LogyQiEzLyckZ0Flp12wOLF2SZ8sFcBhAov6NqqoqJCUlYdeuXQCAL5vVuPGTBjy2pxFnLveKNEwiMsc46KxdTjAYuy7JE4UDqAKQon+jpaUFubm52Lx585CDz1zuZcgReTAGHXmaDADlAML0byiVSmRkZKC+fmh3c2Ii8Mc\/+uCdd8KxY0cgAODhh5Oxdu3\/jNJwvdu6deuwfv16PPXUU3j66afFHg45VwuM\/lyOJpYuyVOEAygB8CGM\/jCVlJRgzpw5JkNu9WpAqQRuvFGLd9+9hIcfvgwA2LSpFitWTEdb29FRGjoRORODjjzBkIaTlpYWyOVJyMvLG3JwWBiwcydQUjLw\/bVrW7FhQwtCQ7XYs6cLy5en4dixV507ciJyOpYuyd3lAiiE0SyuqqoM2dmPo7V16H23lBSgqgoIDzd9sqysTiQk9GL58ggcP+6D5ct\/j5KS7UhP3wYgHFWnD55SnDtxwSm\/Ei9yb\/z82JujZsYMfl\/o+WSX9vLjChGG5KkuACj3ldW5wsOCFQCG\/DcfDZzRkbvSN5xsQH\/ItbTUIzd3EZYtW2Uy5DZsABQK8yGnl5DQi\/37L2LWrF60t\/vgoYe+wdtvXw2gChnx82Y8lCCf6ehfDJEj3Xz7dxkAVHCdkBMVg47ckRy6P8T36N9QKl+CXB6PN97YN+TgxETg8GEgN9f6C0ilWlRXf4\/MzE4AQGGhP3JzH0Bb2y9wXURo5C\/n3pkYMiaQFRFySZcuaS75yuoYcv0YdORuSgDshKFUqURJyXTMmbMGR45ohhy8erVuFpeUZOfFSlpQWNgKAKioCMby5RVoa0vBlJAz4c8m35UcFzYxxL4zEzmN4sRXPbeIPQhXwqAjd5EEQIkBDScFkMvnIC\/v9JCDw8KADz\/UNZwMV6ocziOPXMbWrU0IDdXi+PExWLDgIo4duwVS\/w8CH519a+KCyPjxI7sC0cj1lyurfGV1CrHH4kjV1dWG7fzsxaAjd5AL3Y3s\/h1OlKiqmobY2GL0b3AyQEoKoFIBGRmOG8DixWpUVjYZ7tvddlsQtmz5Bfx9H\/a7f8ashHvj58c67mpENuv+7B+TM3xldUqxB+KKGHTkykw0nBQgN3cOli1TobV16BesbTixR0JCLyorm7B0qe62R15eONasqQIgx81RgTEPJchn8r4diaAbuqYTldgDcVUMOnJVcgxoOGmBUjkPcnkx3nhj6MH2NJzYQyodvLh8LFasOIe2tjm4LuJ05Oqk9MTI4LBA546CSGf+knNLAZT4yuq45MUCBh25IhMNJwmYM6cWR44MPXikDSf2GLi43B\/Ll4\/BsWO3YUJQZcjTc+5gkwqNBtWBnVFL2Fk5PAYduRITDSf1kMvnIy\/v\/JCDHdlwYo+srE5UVl5pUlm+PAJ79jwKf99f+j2ZuDRZHnXtpNEfFXm6\/qYTJZcPWI9BR65iUMMJcN999yEyMg67dvUNOdgZDSf2GLy4fMWKCLz99iYA2VxcTk5x9lzfOV9ZXZXY43AnDDoSm4mGE90jdT744AP09GiHfMGZDSf2GLq4PAy5udsAlOC6iGguLidHqqpv6L1T7EG4GwYdiUmOITucKCGXy\/GGiY6T0Wo4sdfgxeVpaa+gre0opoSM4+JyGpEbbzt\/N4CNXD5gH\/4rk8RSAqN7cYDukTqmnjYAAMuXA5s2uc4szpxHHrmM2bP78MADMuzZ04l58+7Ehx9+goSEhMBHZ9+auPWb\/af2N57+Qexxkltp2f3Pq+70gM5KsUJaxaCj0ZYE3YNRDffiWlpakJGRgV0mVn8HBARArVbjm29Gb4AjtXixGjNnXsSpU1rU1\/di+fLleOmll5CVleV3\/4wbEqaEjKv\/++kDKrHHSW7BlZ4+MFKi1WJYuqTRNKThpKqqCrGxsSZDLiUlBadOnUJMTAyOHHHdkqWxlhbdModt27SQSkNx++23o729HXl5eVizZg0A4OaomVxcTsNKvPHcEnhOyImKQUejwWzDybJly9BqYouTDRs2QKFQICYmBlVVugazzZuB7OzRG7StVCpALgeOHAFCQoI0u3Z9hqqqKjz88MMAgE2bNuHBBx9EW1sbrouI5uJyskR59Lg6hSHnGAw6cjY5bGo4ScThw4eRazR9S0q8Vr32hZt3A7qwk8t1MydXUlWlm8kdOQIEBkjU5X+SbkqcdX4XAKxduxYbNmxAaGgoduzYgeXLl+PYsWOYEBTKxeU0QP8aue1cPuBYDDpypkE7nOgaTuRyOY6Y2OJk9erVUCgUSDLe4kRbX69pu7Xk+byGmqcfD9sWFCTp2bVLFyoKhfN\/AcNpadGt5Vu2DGhtBa6a5Nt4\/MCUkoy7gi9oLz+u0Ha9\/gEEtTorKwuVlZUIDQ3F8ePHsXz5cuzZswf+vn5cXE4GqvreM76yur1ij8PTMOjIGWIxZIcTXcNJXl7ekFJlWFgYPvzwQ5SUlCDcqK1SUH+wQ9O6pBza890AUPzSOOVfSie+N07m01ZfDyxZoitlijW7Ky8HYmOBbdt0P7\/tlqB9Z45P3Th1ip+h3CR0v3VSezm3HEJra0JCAvbv349Zs2ahvb0dK1aswNtvvw0AXFxO3QA2nvuu70diD8QTMejI0bKhCzlDw4lCoUBsbCy26RPBSEpKCpRKJTKMtzjRNjZqOx4r1XY+N+Rfthl3BV84uCvqrdtuCdoH6EqZsbFAYaHuHtlo0AfcAw\/oZnGycJ\/WtzaM3\/zJ1knbTR0v9O64oGm7cyO09fVSqRTV1dXIzMwEABQWFhrKtFxc7p0W3Xr+DuiaTtx9+YDLYtCRo+gbTt6DUakyNzcXS5YsMdlwsmbNGkMI6gm9n+3TtC8vF3p3mP1DP3WKX\/cnWydtf2vD+M0zr\/E719oKrF0LTJumm+FVOeHuhkqlC1N9wNXXA4GBEvVDPwvd8X1dTMkjK0NVFk+gPd+taV1SLvTVHgF0JdzCwkIAQEVFBdLS0tDW1sbF5d7nwt5Pr7qZIedcDDpyBDl0s7gBDSdJSUkmG05iYmJw+PBhw1\/0AABBrdZ2vf6BtiN7u75UOZxHVoaqju6N3vTWhvGbZ8\/ybQR0M7xly3QLy7OzdbMve2Z6LS26e4C5ubr7gdOm6cK0vh6IGOfTvuKesbuO759SUvrGeJvup2jbM6uE7re3AcAjjzyCd955x3DfbsGCBTh27Bik\/kF8crl3OAkuHxgVLJHQSBUCWGP8hn62YmoWt3LlyiH34qCtr9e0\/+R9awNusEdWhqoeWRm6sep\/Oyf9ZUvLDQcO9cw4f17w37xZF3x6KSm6ADT3OJ+WFkCp1AVjff3Qz5Ou9\/96xT1jDxXkhZ+0Z5x62q5XlZK+Qxd8xpZkp6enB1RWViI3N9fQpGK8uDwiKOT0P1RHzo7keuR6Zi88e\/OJr3oKxR6Ht2DQkb1ioStVDtjhJDs72+S9uLCwMJSXlw+8Fwddw4mpe3H2yLgr+ELGXcF\/B4Cq\/+2c9HFN66IjX\/bEfP2NVtreDh\/9mnQTwzNperxP+7Uz\/E8vTA46dX9miMq4yWSkhN4dF7QdP9noM\/aP9yUkJERWVlbiwQcfxJ49e5CXl4djx45h7dq1WDr1+virxspCPvhq7zcdvd1DH+NA7mg7Q250MejIHtnQLR0w3ItTKBTIyMgwOYtLSUlBeXn5gHtx0DY2ajsLqyzdixuJ\/tAz3K3be0Ad\/vW3nVPOnOuZpKrXhoSEaAxTyt5eSbda7dMNAAvmhCgB3SzRGeMyJvQdatG0Ly\/3GftGulSanLh161asWbMGmzZtwqZNm9DQ0ICSEt0TECYlhY99Q7n9CMPOfd18+3cZn\/1jcjY3Zh59DDqyRTh0+1TeY\/xmbm6uyXtxgK7hZMC9OOgaTrSdv1LYW6q0x6L5AS2L5ge0ADg6Wte0ivZ8t7Y9s8pn7JstEv87UtauXYuEhATk5eUZFpeXlJQgISEh5MUFyxZuPPrpkbrWix1iD5ts1v3ZPyans+lEHGxGIWvJIULDibcYvLj8n\/\/8JxeXe44WcPmAqBh0ZI1C6HY4idG\/YWmHk5UrVxpC0KB\/hxOh+60RNXJ4MlsWl\/9kxo3TRR4uWWH+knNLoXuOHENORCxdkiWxcLGGkxHxmRQu8b06FpKISZCEDZ0VCd+roDmjEjRHVaM\/uP4h9O64oGn7cqNvaGW2VBoZWVlZiRdffBEVFRUoLCzEsWPHUFJSgvmRcVGTx4aP3fjlp8d4385lnTywM6qIywfEx6Ajc7Lh4g0n1pL4zo6FX7IckvAYyweGx8Dn6hTJmBQ1tN\/uFXr\/tRdC++j\/JaU9361pXbzRJ7QiQypNTuy\/R4fCwkJUVFTg2LFjqKysxBTpuPDVSemJf\/vqi1O8b+c6+ptOCrkxs+tg6ZIGG7UdTpzOZ1K4JGBlNsbcunLYkBvALwA+V6dIAv4zV+J\/h9xp4xuGpcXlaWlphicgcHG5a+nfmJkh50IYdGRMDg9pOJH4zZ8p8V\/+qG0BN5g+8FZmQxIqynPjtF2vKrWdz2+GoFanp6ejsrISs2bNwtmzZ7F8+XJs2bIF\/r5+fvfPuCHh9tjEKWKMkQy6AVRxY2bXw6AjvUJ4SMOJZMx\/JMHvhh8DfgGmPq\/7tgnPvfARfINzDa\/X1n1q4YThMZKALNHCTlD\/TaXt+MlGaBsbExISUFlZicWLFxueXL5u3ToAwNKp18fzyeXiuPG283dD11nJNXIuiEFHsdDN4gzbeFnzSJ3y8nKLj9QRi8Rv\/kz4zr3H3Oef\/t9XWHDjOtQebsDXx16AprMEH\/w1G6+t+xQLblyHum+bzHwzJFLUsOtfXC5oTpySSqXYunWr4cnl69evH\/LkcobdqLqw+59X3cnOStfFoPNu2XDiI3VGnc+kcPgtyDD3cd23TfjxT8sRNy0C\/\/zfnyNuWgQAYMW9Sfjgr9moPdyA+35abuECIZES\/\/R0B4\/aetrz3dq2O98Xej4Z8ORyAIbF5Q0NDZgQFBry4oJlC\/kEhFFxAVwj5\/IYdN7JcxpOjEjGLM0wV64EgEef+ADNLZ145KHFQz679ZZrcOst16D2cMMwZcyrEiW+s2MdMV57aS8\/rhC6395manF5WloaF5ePktkLz94MPn3ALTDovI8cgxpOVCqVWzacGJP4zo611Hjy6f99hU\/\/7ysAuhmcKZn977+27lM0t3Sav9iYm8zOGkeLtutVpaXF5Vu2bAHAxeVOpDzxVc8tDDn3wKDzLoUY1HBSXl6OpKQkmxpOtB0\/2Sh2w8kQfslySx+XvfsFACB5TjRk4cEmj7l1yQwAQHNLJ7b+3VJPQUCYxG\/+TLvG6UBXnlze2CiVSlFZWWl4cnleXp7hyeXzI+Oi+ORyx7j59u8yAFRx+YB7YdB5h1gACphoOHnggQdMNpy89957QxtOej7ZpXtK9qGW0Rm2lXwmhQ+3jEA\/m5vWf1\/OlLhpEYYQrOk\/3izfWNGDDoBhcbnQV3tEKpVafHL56qT0RN63G5Hu\/jVy7Kx0Mww6z5cBXakyRf+GQqFAUlKSyYaTxMREKJVKZGdnX3lTaG3VdjxWqr38uMLpo7WDxPfqWEuf1x5uMJQi4ywEnfHnnw4XdJKJrhF0\/bi43Om6AZRzjZx7YtB5Lv0jdT6EUcNJYWEhlixZgnoTj9Bes2YNlErlwIaTvtojmrY7N7pKw4lJkgiLDReHDjcYfmyubKkXLgsCoCtfWrxPB78A+Ma7VKMHF5c7R\/\/GzOysdGMMOs+UBN0sbqX+DX3Dydq1a4ccHBMTg507d5puOGnPrHKVhhOzTG3QbKS5ucvqU8XFXpnsmF9T139ZBImyps4SLi53uAsHdkYtYci5Nwad5ykEcBhWNpzcc889UCqVkMvlV9501YYTOxkHlqx\/xmaNluEC0kcWbvkAcZhaXK5vUuHicpsoweUDHoG\/wT1HLHSlSsO9uOEeqVNSUjLwXhx0DSeuei\/OER59fAsefXyLY04mCXXJoANgWFzuM\/ZNucT\/jpSSkhLccMMNA55c\/u677yI6OppPLjdh9sKzN5\/4qqdQ7HGQY3BG5xk8vuHEUTa+mQVNZ4nZ1623XGP9yTRnVE4bqINYu7j80dm3JnJxuUHVia96bhF7EOQ4DDr35j0NJyNgXK4c7n7dsOVKNzR4cXl1dfWQxeX+vn5+3r64vH9j5iouH\/A8DDr35V0NJ5YI36ssfTxcp6Ux405LS2vuAEDQ1rvNPwyMF5dHR0dbXFz++PW3JXjhfbvuE6d6v2HIeSYGnXsqBBtOrhimhGi8ds7ykoErjSuy8OBh1tx1NIry9PGRMLG4\/KmnngIwcHH59PDI8V62uPwCgPLWNs2PxR4IOQeDzr3Ewo4dTqqqqtxjhxM7CZqjKqBPbe5z4\/tulpYMGIfgsPfqtN+57T8QjBeXP\/300xYXl8+OmOK6DTcOwDVy3oFB5z7YcGKJ9luzjwmShQcjeU40gIGLxwc7dOis4cf6480R+g65dYnL1OLyKVOmDFlc\/nDCkkQPXlyuPKRUL+byAc\/HoHN9bDixgtD7r72WZnX6R\/PUfdtktnxZ2x+CsvBgk4\/yuXKx80egveD2s2FB\/TeV9nJuuX5xeXV1tcXF5SIP19H2cmNm78Ggc21sOLGW0N5taVb3yIM3GO65vf3OHpPH1Ow8BQB49ulbLTSw9KmFnu3bRzZY1yH07rhgaXF5bm6uYXH58\/Mzkj2hSWXqrDNzfWV1HvPfkIbHoHNdhWDDiU2Enk8UEFqGTnH7vfqbuwEAb7\/7xZBZnf55dclzovHs07eav0jf\/iq3a0IZjv7J5b2f7QOAkpISw5PLKyoqPOnJ5d0A3ufGzN6HQed6YsGGE7sJPX9\/H+hoNPXZinuTsPHNLNR924Sld75lKFVu\/bsSP\/5pOZLnRGPHx4+ZP7nm0Dah74DH\/qNB25G93dLi8mPHjrnt4vL+NXLlvrI6j\/3vR+Yx6FwLG05GSmjvFtRbys2F3SMP3oD9u5\/GtGkRWHDjOvgG5+LRx7fg2advxf7dT5svWWoObRN6\/+XWDSjWuLK4XK0evLj8tttuc9fF5Rd2\/\/OqW9lZ6b0YdK6BDSeOpA874fzQGi90HZUf\/DXbsO3XD+dfsVCu7FOj74sPvCHk9HSLy28t8ZDF5Regm8l5VWWDBmLQic9kw4lcLrep4UTofnubxzec2EJo7xbUFVXo\/XQzoG4d\/gumznH+iKD+c4knlyvNGmZx+YoVK1x+cfmLv23u85XVbeTyAWLQiSsXgxpOqqqqkJSUhF27dg052HTDSWOjtuMnG7Vdr3rNjMMWguaoSujeWIK+Lz7QzfDML0HQ6WiE9utdQs8HbwjqCs9rPLGRtj2zSlB\/sAMYuLh8z549rr64fO9vf9f8stiDINfgyiUHTxYOoAqDHqmTm5uLzZs3Dzk4LCwMhYWFhpKRnqc\/UseRhL4DJ6GfmfnGT5IgKBA+snBIQsP1W4gJ2voL3h5spmg7n9sr0fz7gk\/Qi\/elp6cHVFZW4sEHHzQsLi8pKUF6errfwwlLEnec+ffpf6iOnB3+rE7FjZlpAM7oRl8GABWMQk6pVCIpKclkyCUmJkKhUAwMOaG1Vdv5\/GaGnJ00py8ImqMqofdfSqHnE4WgOaoSNEdVDDnzLC0uf+ihh1xlcXn3VTPOJDLkaDAG3egJB1ACEw0nc+bMMdlwsnr1akMI6gmaE6c0bXduFNR\/Uzl9xERGXHxxeTeA8saLfctG8ZrkJhh0oyMJurVxq\/Vv9Pm0OAAACEhJREFUWGo4CQsLw86dO1FSUnLlTX3DSdud77PhhETjgovL+zdm3sjlA2QOg8759A0nifo3hms40YegARtOyMW40OLyCwd2Ri3h8gGyhEHnPOHQzeI26N9oaWlBdnY2li1bZnKHkw0bNpjZ4WTxRm\/b4YRcnwssLldy+QBZg0HnHGw4Ia9ganH50qVLATh3cfm188\/eyKcPkLUYdI7FhhPyPoMWl7\/77rsWF5dHBocFjvCKVV9905M28oGTt2DQOQ4bTsirDV5cvmHDBpOLy5+ec0fyVWNlY209f\/\/GzO9z+QDZikHnGGw4IYJucbn+yeVZWVlDnly+fft2+Pv6+U0Pjxxv46m7T5zq\/YZPHyB7MOhGhg0nRIOYWlyub1IxXlxugwsANra2aX7shOGSF2DQ2Y8NJ0RmDF5cXl1dbXJx+XDm3nwuFXz6AI0Qg852bDghsoaVi8stUB75Un0Tlw\/QSHFTZ9skQffcOMO9OJVKhezsbJP34sLCwlBVVTXwXpygVgvqP2\/nvTjyFtqO7O0+Qc9dkAT8Z3pWVlZAdHQ0HnjgARw\/fhzHjx839zWFr6xOMYrDJA\/GGZ312HBCZCfjxeWLFy823LczZeqsM3MZcuRIDLrhseGEyAEsLS7Xk\/jNVZ77ru9HIg2RPBRLl5ZlQFeqNNyLUyqVyMjIMHkvLjExEeXl5QPuxUFobdV2vVbFe3FE0C0ub19e7jP2jXSpNDnx3XffHdiF6TOJ\/xAkh5MIgiD2GFxROIBCGC3+BnQ30\/Py8kx+YfXq1QMXfwP4+uuvD1999dW3AOAfXqKhcmFUKem3Fro\/e0QOwxndUEMaTlpaWpCRkWF9wwnQCqDw6quvLhnyBSLSK4FuiU45jKomRI7Ge3QD5UJ3P25Aw0lsbKzJkEtJSRnacAIcASCH7g8xEVlWBd2flyMij4M8GINOJxy6P3Ab0P8vy5aWFuTm5ppsOAGADRs2QKFQDGg4AfAGdDNCdlUSWU8JXdgN\/dckkQPwHp3uD1gVBjWcZGdn48iRof\/INNlwoitVZkA3GyQi+8VCV84kchhvn9GVANgJo5ArKSnBnDlzTIbc6tWroVAoBofcNuj+cCqcOlIi76ASewDkeby1GcXmhpPy8nJkZGQYv90KXXcY78UREbkwb5zR2dVwMijk2HBCROQmvCno2HBCROSFvKV0KQcbToiIvJI3zOjYcEJE5MU8eUbHhhMiIvLYGR0bToiICIDnBR0bToiIaABPKl3KwYYTIiIaxFNmdGw4ISIik9x9RseGEyIissidZ3RsOCEiomG5Y9Cx4YSIiKw2uHQZCyB7FK9fDtt2K5eDDSdERGQDU0G3ZhSvr4D1QVcCYPWAN0pKUFhYaHIWt3r1ahQWFg6exe2CLuRa7BksERG5H3doRomFbhY3oOEkOzsb27ZtG3KwmYYTAMgD78UREXkdVw+6bOjCyVCqVCgUyMjIMDmLS0lJQXl5OWJjY43fPtJ\/Ht6LIyLyQq7ajKJvOHkPRiGXm5uLJUuWmAy5NWvWQKFQDA65N6C7r8eQIyLyUq44o5ND16QSo3\/DUsNJTEwMqqqqTDWcZEMXlkRE5MVcbUZXCN0OJ4aQKykpgVwuNxlyK1euhFKpHBxyu3Dlvh4REXk5V5nRxYINJ0RE5ASuEHTZYMMJERE5iVWly+LiYkgkEkgkEqSlpQ17fHNzM+Lj4w3fqampMXfoy2DDCREROZMgCMYvuWBGcnKyAEAAIJSWlpo7TBAEQSgqKjIcm5OTY+nQ7fofHD58WEhMTDR8z\/gVExMjHD58ePB3WwRByBg0fr744osvvvga8Br8hlwwo7q62hA8cXFx5g4TTp8+LchkMgGAIJPJhEuXLpk9VhCEuwRBUG3YsEEICwszGXIrV64UmpubB39PIQhCuNj\/5\/HFF1988eX6L6u7LlNTU5GZmQkAqKurQ3FxscnjiouL0dzcDADIz8+HTCazdNqO3\/\/+9z\/Py8sbUqoMCwvDhx9+iPLy8sHbeOVBV6rkNl5ERDS8QcknFywYbrZmPOtLTk62dCo9uSAIyMzMVMBoFpeSkiJ8++23g49VCoKQJPa\/DPjiiy+++HKvl03r6OLi4pCfnw9A13AyeFZn\/PPS0lKrz7tlyxb53LlzWwA2nBARkWPZvGA8JycHcXFxAHTBVldXBwAoKyszdFfm5+cjOTnZpvOmpaXdXVtb21FYWGj8diuAZdA9ZJWlSiIisplEEATjn8uh25nEooqKCmRlZQHQBV9paSni4+NRV1cHmUyG06dPD3dvTm8JBj4XLgPAh\/0\/5iN1iIhoxOxaMJ6ZmYnU1FTU1NSgrKwMcXFxhpldaWmptSFnShV0ZUoVuMMJERE5gF0zOgCora3FvHnzBryXmpqK6upqW64\/eEZHRETkUHZv6pycnGxoTNGzpQGFiIhoNIzo6QW1tbUDfl5RUTGiwRARETma3UFXUVExZA9L4y5MIiIiV2BX0DU3N6OgoACA7r6cvmRp\/D4REZErsCvoysrKDDO3\/Px85OTkGNbNmZrpERERicXmoKurqxswm0tNTQUAFBUVGY7hrI6IiFyFzUG3atUqw4+Nuy6NN32ura01u+kzERHRaLIp6IzLkjk5OYbZnF5RUZFhsbjxUwyIiIjEYlPQGZckB6+hA4Zu+swSJhERic3qoDNeOpCfn2\/Y2Hkw402fjTd6JiIiEoNVQWf8oFWZTGZyNqc3+HPO6oiISExWBV1BQYEtTw0fcP+OjSlERCQmuzd1dhBu6kxERE41or0uiYiIXB2DjoiIPBqDjoiIPBqDjoiIPBqDjoiIPBqDjoiIPNr\/B\/0gzjqSZc75AAAAAElFTkSuQmCC","width":350}
%---
%[text:image:9f60]
%   data: {"align":"baseline","height":310,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAboAAAGICAYAAAA3RSUjAAAACXBIWXMAAAsSAAALEgHS3X78AAAgAElEQVR4nOzde1iUZf4\/8PcwyEkYTiqeEAJLEhMMNc2+OSakHVynFGprWyczrN12Q\/1u0O6W2GGTSqXd\/aZQGf72UIEWbVtp0Dq2mXYgxwoPldMgeEBThgE5M8\/vj2GmAWZgBhieObxf1zXXJTPPPM9Ne61v78\/9uZ9HIggCiDyACsB8Ea67AUCuCNclIjv5iD0AIiIiZ2LQERGRR2PQERGRR2PQERGRR2PQERGRR2PQkVeQSCQDeuXl5Yk9dCIaJAYdERF5NF+xB0A0HMrKyuw6TqPRYPXq1QCA8PBwZGZmOnNYRDQMGHTkFVJTU+06Li0tzfzngoIChIeHO2tIRDRMWLok6pKXl4fy8nIAQHp6OtLT00UeERENBQYdEYwlS1PjSXh4OAoKCkQeERENFQYdEYDVq1ejrq4OAJCdnc2SJZEHYdCR17MsWaampiI7O1vkERHRUGLQkVdjyZLI8zHoyKv1LFnGxcWJPCIiGmoMOvJaLFkSeQcGHXklliyJvAeDjrwSS5ZE3oNBR16HJUsi78KgI6\/CkiWR92HQkVdhyZLI+zDoyGuwZEnknRh05BVYsiTyXgw68gosWRJ5Lz6PjjyeZckyLi4OKSkp5p\/7Ex4ejpSUFGcOj4icTCIIgthjIBoKKgDzrX0QERFhns05KjU1tb+nk28AkDugkxPRsGDpkjzeQEOOiDwDS5fk8Vi1IPJunNEREZFHY9AREZFHY9AREZFHY9AREZFHY9AREZFHY9cleQq1nceNBRBg+mHbtm3BWq3W\/P+DVatWNU6ePLnD4vizAFr6OJ\/WkUES0fDjhnHyNipYbCyXy+XYt2+f+cO9e\/dCLpdbHr+g6ztE5KZYuiQiIo\/GoCOvVllZKfYQiMjJGHTk1RITE8UeAhE5GYOOiIg8GoOOiIg8GoOOyAqlUgmlUin2MIhoCDDoiPpw+GJbhNhjIKLB4YZxIiuKiooAALlf1v3s5\/+pPX1kefRBcUdERAPFGR1R\/xYHXpb48dSd1QH9H0pEroZBR2SHy57bXQ4ga+rO6gSxx0JEjmHQEdkvAMCd\/hMn\/4ezOyL3waAjclB8\/t6PADwwdWf1WLHHQkT9Y9ARDUwYgAf8oibtFnsgRNQ3Bh3RIPhGRI2durNaOXVndZjYYyEi6xh0RIMQ++SbpQBiYSxlslGFyAUx6IiGRoD2sdtfZ6MKkevhhnGiIdI1uwOMs7vXjyyPPivqgIgIAGd0RM7ARhUiF8KgI3KSyf+3\/yAbVYjEx6Ajcq5YAA+MCBv1ltgDIfJWDDoi5wu4\/OVDh6furL6TjSpEw49BRzR8EmBsVIkVeyBE3oRBRzS8wrSP3V46dWe1XOyBEHkLBh3RMOvahiCfurP6ATaqEDkfg45IPGO1f1B8OCJi7L\/EHgiRJ+OGcSIRxT5d+g4ATN1ZfSeA0iPLo1tEHhKRx+GMjsg1JAB4wDckfKfYAyHyNAw6ItcRdsWrX33DRhWiocWgI3I98qk7qx\/w8Q\/8p9gDIfIEDDoi1zQ2IHbqlKk7q5PFHgiRu2PQEbmorkYVBe+oQjQ4DDoi15egfXTJR7yjCtHAMOiI3EDsM++8B0A5dWf1YrHHQuRuuI+OyL3MCYy\/an3bGe3JzqaGO8QezBCSiz0AL6cGoBN7EM7CoCNyM5flvbcHQMvUndVzjiyPPij2eIbIXrEH4OUWAFCJPQhnYemSyD0FAFg8dWf1nT6+I\/4m9mCIXBmDjsi9JQTET5\/KRhUi2xh0RG6uaxsCG1WIbGDQEXmOOYHxVx2YurN6rNgDIXIlDDoiD9LVqKKcurN6jthj8QYajQY5OTmQSCTmV15e3pBfZ\/Xq1ZBIJCgvLx\/yc3sDBh2R5wkAsDggJmGfp95Rpby8HBkZGaKPYebMmaioqMCJEycgCAKKi4uRl5eHmTNnQqPRiDKm1atXo66ubtiv7coYdEQeKm5T2V4AWZ7WqJKRkYHy8nIUFxeLNgaNRoOMjAzExcWhrKwMcXFxAID09HQUFxejoqJClCBOTU1FZmYmZs6cydmfBQYdkWcLAKD0Hx9X5u6zu7q6OsycORMpKSnYuHGjqGMxzZoyMzN7fZaamorU1FRUVFQ4pYzZn5SUFJSVlWH16tWiXN8VMeiIvED8n\/fth3Htzm0bVdLS0hAXF4fs7GxRx1FeXm6eLaWnp1s9xvR+Xl6eKGXEuLg4FBcXIycnB4WFhcN+fVfDoCPyHmMBPOCOjSo5OTmoqKgQfSYHwBwcKSkpCA8Pt3pMamoqAOMstKSkZNjGZiklJQXZ2dlYvXo1KioqRBmDq2DQEXkZ7WO3bwu8LPFjdylllpSUIC8vD5mZmea1MDGZZnN9jSUuLs4cgmKulZlKq2I37oiNQUfkZWKffLP0sud2l8PYqJIg9nj6k5OTA+CnWZKYKioqzKXI\/kLX9LmYQRcXF4f09HRoNBqvXq9j0BF5rwAAd0okEsFVZ3eFhYXmNn1Hgy4vLw9paWnd9rilpaUN6i98yxKgrbJlz8\/r6uoGtE5nCieJRGIul6alpTn8O6SkpAAQb73QFTDoiLzclSUnN8BFG1VM61t9rYf1pNFozI0rZWVlEAQBZWVlSE9PR3l5OXJycjBz5swB\/aXvyHcsZ3yO7qkrLy9HfHw8SkpKUFZWZi5BlpWVISUlBTk5OYiPj7dr7c0V1gvFxqAjIqCrUcVv9MR3xR6ISV1dnbnsZ5qV2POdtLQ0pKend+uITE1NRXFxsbmZpaKiAmlpaQ6PyTKw7A1e07jsZRqbKah7zmQ3btyI7Oxsc6D3F6KWgeute+sYdERkNnnrgc+n7qxWukIp0\/IvZXubUHJycqDRaGy2\/WdnZ5s\/q6ioGFTrvem2XLZeAz23qXEkOzvbZpiaPqurqzOvYdoSHh7uEuuFYmLQEVFPsXCBRhVHZ08ajcYcLn0db7lFYTBBV1BQAEEQbL4G0jxTXl5u\/r1thTVg\/P1M5y8pKel3Vme5XijGrcnExqAjImsCtI\/d\/vrUndWLxZrdOfoXsmn9yZ5uSMtZnSPXsQzQ\/sqRA1kDtNy60F+4W5Zz+1t7szwXg46IqEvsk2+WApgD4yZzl2tU6cmRYLEMiYEGnSPjsbf06sjG7sE0u3gbBh0R9SdM+9jtu\/2iJu0WeyB9cSToHAksS5bh0t\/1TOFjuUY2lAb6O3gjX7EHQESur2t2h6k7q5UASo8sj9aJOqAhZG9HJ9B9L19fsyjLEByOje4Mvb5xRkdEjogF8MCIsFFvOftCjsyeHGU6nyP78wBjoJiCsa8yo+VnjgSp6Vh7SpED3ergCrdRG24MOiJyVMDlLx86PHVntcKZjSrO\/AvZFBLWHrPTH9N3NBqNzQA2BV14eLhD17AMxf62AlgGXX\/XcHYZ1dUx6IhooJIBPCANCnnDGSe3LPkN5d33TXcISUlJGXDQmcLC1vYEU0j1tRfOmvT0dPO5++ukNH2emZnZ7zUGehs1T8GgI6LBCPOPSZgydWe1fKhPbLlXzJGuQo1G0+dsyLQh29YTyk0bwSMiImyGjWkvXmFhYa9Znel5dabH5Dh6fstz2wr4vLw8aDQaxMXF9fvoIstzMOiIiAagq1FF3nVHlbChPLflfjdH1unS0tJ6hV15eTlmzpwJjUaDsrIyqyW88vJy8yytrq4OGRkZVkM2PT0dBQUF5ttwmcKkpKQEGRkZ5qd8D+T86enp5hC29nsUFhYiJyfHfIuw\/mZzpu+Hh4f3uQndkzHoiGioxGr\/oPhwKO+oYlkmtPeGxHFxcSgoKOj15IKcnBykp6fjxIkTNhtEUlJSen1m67qZmZn44osvEBcXh5kzZ0IikWD16tXIzs7GF198YTWA7D2\/aZzZ2dlIS0vr9vSCwsJCbNy4ESdOnLBrvc0Uwo6WUT0Jg46Ihkzs06XvALhzKBtVCgoKANgfdIAxhHrekuuLL76wWkq0FB4eji+++AKCIODixYv9XiclJQXFxcXma1y8eLHPazhy\/ri4OGRnZ0MQhG5PL7Dn9zAx3Rg7Li5uQOuRnoJBR0TOkKx9dMlHQ9GokpqaiuzsbPPa13AxlRQd2R7gSucHflpDLC4u9trZHMCgIyIniX3mnfem\/L8jR4eiUWXjxo1ITU3t9079QykvLw\/p6elOa+Bw9vlND27duHGjU8PUHTDoiMjZ5FN3Vj\/g4x\/4z8GcxNR4YeqadKacnBzzTMgdz29qdMnOzra7zOnJGHRENBzGBsROnTJ1Z3Wy5ZsTJkyITUhI2Lhp0yZs2rQJBw4c6PMkpm7JtLS0Xl2Ypp8HU6LTaDR9dk0OlrPPb7pGWloaQ84C73VJRMOiq1FF0dWVWVr\/8JwcAOsbGhqwefNmAMDmzZuxaNEi5OfnQyaTWT3Pxo0bUV5ejtWrV3ebEZmCbjB3\/oiLi3PaLGs4zl9eXo6SkhK7th14E87oiGi4JWgfnv8VgPUAsHCUFL+OHYFfTjT+u3vPnj3YtGlTnydITU3tFRimNnpvvMWVSWpqKgoKChhyPXBGR0TDLiLIb4zQ1Ipfx47APeOlCPUz\/pt74SgpVqhb8fLLL2PVqlWIjo62+5z2bAdwVwUFBeZtFuQ4zuiIaNgJTQ2hAPBQ7Ajc\/OEp8\/uzw6SYFWb8a6mmpkacwZHH4YyOiES1\/6ZotBkE+PlIur3\/3nvvrZk7d65apGF5G4\/+78ygI6JhNS5IGtAZHCxIWi5J2gVghATmkDvVIuBYowAA2L59u+rJJ5\/06L+AaXgw6IhoWG1IiZB\/mpkpifvg\/zBCAtS1C\/jukgENHcCfvm9DQ4cAAPtOnTrFkKMhwaAjomGTERcce11UwDVz5k9H05dSAMDKw6041mgwHxMWKtPr6vVKkYZIHojNKEQ0bNZOC1UITXroXsgCABTUCBAmXA4AmDhxItauXYsPysq3njp1SiviMMnDcEZHRMNiy5xIuczPJ\/TUi7kIMbThdIuAGeuew3Wjx2L58uXIyMjAunXrAKBF7LGSZ+GMjoicLnVC4NhFE4Pmdxz9FCGfvwMA+Lt0MlJ\/dpvIIyNvwBkdETndH5PDFUKTHuef\/xVGAnj9nASrt78k9rDIS3BGR0ROtWVOpHxMoDTqx6I\/YWSLHqdbBPjd\/luH7npCNBgMOiJyGsuSpf\/+XQCMJUvlgw+JPDLyJgw6InKaPyaHKwDgdP5aAMA+nQSrNxlLlicbO6rEGxl5EwYdETnFEykRc8YESqPOv\/oUwhrPoaFDwIVbjSXLc82dtdu\/bVCJPUbyDgw6IhpyyZF+YUsmBck7q47Cv3wHAGCHcJm5ZPmUuq5UzPGRd2HQEdGQ2zgrUuEvlfifzVsNAPjwx04sXZ8PANhT07Sv\/FTzWTHHR96FQUdEQ+qJlIg5k4J9Y\/T\/fA4h9WfQ0CGgZuEqJCYm4lxzZ+2agxdUYo+RvAuDjoiGjKlkaTh\/Cs3vvgIA2NkSid888nsAwItH9bvFHB95JwYdEQ0ZU8ny9DOrEIhOfK4zIPVP2wEAH9e2fFqsadSKO0LyRgw6IhoSv5seljwp2DdGX7oNstrv0dAh4MR19yAxMRH6NkP9+oqLKrHHSN6JQUdEgzYuSBpwV3zwYsP5U2guMTad7GyJROajuQCAzd\/Ul55p6uTNmkkUDDoiGrQX543uVbKcnWMMPJYsSWwMOiIalMwEWcKU0BFT9P\/9F2S13wMAjl11C+bOncuSJbkEPr2AiAZsXJA04MErZQqhSY\/Wwhz4A\/jbxUDcs\/UpACxZkmvgjI6IBsxcsvzT\/fA3tONYowFXP14AmUyG4\/Xtx1myJFfAoCOiAbEsWYb88CUA4PMrjSXL1k6h9Vf7z\/M2X+QSWLokIoeNC5IGrLwiZLGtkuXWo3qWLMllcEZHRA7bkBIhl\/n5hGr\/+nv4G9pxukXArOwt5pJl4TH9MbHHSGTCoCMih2TEBcdeFxVwTcfRTxF5eA8A4M2QJMyWL2TJklwSS5dEZLdxQdKAtdNCFUKTHueefRDBAF4\/J8FDu14FwJIluSbO6IjIbqaS5enCXAS3NeB0i4C43+RBJpPhZGNHFUuW5IoYdERkF8uSZcjn7wAwlixTf3YbWjuF1pzPL7BkSS6JpUsissvaaaEKAOaS5T6dBA+9ZixZvnOySaW+0KYTc3xEtnBGR0T92jInUi7z8wmt2fYYgtsa0NAhIHD1TyXLxysuHhR7jES2MOiIqE+pEwLHLpoYNL+z6ihk\/30dALBDuIwlS3IbDDoi6tMfk8MVAHDqT6sAGEuW92wyPkyVJUtyBww6IrJpy5xI+ZhAadT5V59CWOM5NHQIuHDrbxEdHc2SJbkNBh0RWWUqWRrOn0Jn2d8AAP\/GBCgffAgA8PzXut1ijo\/IXgw6IrLKVLL8IfceBEkM+LJBgpuf\/zsAYE9N077yU81nRR0gkZ0YdETUyxMpEXPGBEqjzr2Wj9G6ajR0CDidlono6Gica+6sXXPwgkrsMRLZi0FHRN0kR\/qFLZkUJDecPwXDO1sBGEuWd\/3mfwEAT6nr2GVJboVBR0TdbJwVqfCXSvxPPnUvgiQGfK4z4LrHXwTAkiW5JwYdEZk9kRIxZ1Kwb4z+v\/9CxI8\/AACq52YgMTGRJUtyWww6IgLwU8lSaNKjedsjAIDiS2FQ\/vEZAMCLR\/XssiS3xKAjIgA\/lSyrnrgXgejEsUYD5j5dBAD4uLbl02JNo1bM8RENFIOOiPC76WHJ5pJl9VcAgCOzjCVLfZuhfn3FRZW4IyQaOAYdkZcbFyQNuCs+eLGtkuXmb+r5MFVyaww6Ii\/34rzRCn+pxP\/bTesQiE6cbhEwPWsjAJYsyTMw6Ii8WGaCLGFK6Igp+i\/2YtwxFQDg4\/hUzJYvZMmSPAYfvErkpcYFSQMevFKmEJr00P9lDWQA3tIFIGPrswBYsiTPwRkdkZcylSy1f\/09ZB2XcLpFwJW\/y4dMJsPx+vbjLFmSp2DQEXkhy5Jl5OE9AH4qWbZ2Cq2\/2n+et\/kij8GgI\/Iy44KkASuvCFkMAOdfzAYAfHLJDxl\/NJYstx7Vs2RJHoVBR+RlNqREyGV+PqEnXngEo1vr0NAhICLrz+aSZeEx\/TGxx0g0lBh0RF4kIy449rqogGs6q45i9GdvAQCKAxNZsiSPxq5LIi8xLkgasHZaqAIATj55LyIB7NNJcN9rxqeHs2RJnopBR+QlTCXLmm2PIbL5Aho6BASufhYymQwnGzuqWLIkT8XSJZEXMJUsDedPQbrvDQBAeUA8Un92G1o7hdaczy+wZEkeizM6Ii9gKll+98e7MM5HwJcNEtz29xIAwDsnm1TqC206UQdI5EQMOiIPt2VOpFzm5xN68tWNGNd4Gg0dAoRfbjCXLB+vuHhQ7DESORNLl0QeLHVC4NhFE4PmG86fgt8HrwIA\/o0JWLD8LpYsyWsw6Ig82B+TwxUA8EPuPQjyMeDLBglufv7vAFiyJO\/BoCPyUFvmRMrHBEqjzu5+DaN11QCA8wtWIDo6miVL8ioMOiIPZCpZCk164P\/lAgDe7oxC+po\/AACe\/1q3W8ThEQ0rBh2RBzKVLI89eieCJAZ82wTIn3sNALCnpmlf+anms6IOkGgYMeiIPMwTKRFzTCXLCT9+BwD44XoloqOjca65s3bNwQsqcUdINLwYdEQeJDnSL2zJpCC50KRH0\/97EkD3kuVT6jp2WZLX4T46okFIGeWfEBPsmyDz8xk70lcSZflZayfqG9oNZ8+1dGqP1LUdq23udHqH48ZZkQp\/qcT\/62d+gxhJO063CJj5+80AWLIk78WgI3JQyAifgGujAubEhvjO8ZXA39Zx\/lKE+kt9QkcF+EyZGjZika7NUKW+0KaqrGvTOmNcT6REzJkU7Buj\/2IvYjSfAAC+vGop7kqZzZIleTUGHZEDUkb5J8wc7a\/oK+BsCfPziZGPC1gxJXTE4bJTzbsb2g1D9qQAy5LlxfzfIALAu00y3JW7CQDw4lE9uyzJa3GNjshOt8eOVMwZ43\/HQELO0rggadKyy0Yq40JGjB2qsZlKlt9uWocIoRWnWwQk\/3ErAODj2pZPizWN2qG6FpG7YdAR2eH22JGKcUHSJFuf\/1ijxdubc\/FQYpj5VfZKvs3zjfSVRKVNDBySsPvd9LDkScG+Mfojn2PcMRUAoHLqYlyZMhv6NkP9+oqLqsFeg8idsXRJ1I8lk4IW9xVyxw+o8MpaJaITk5G7R41RE2NxaE8pXsvNwqE9pVi5uQijJsb2+p6vBP43jA+887ymc9tAy5jjgqQBd8UHLwaAU3+6HxMAfNYahGVP\/hUAsPmb+l4PU50cETg2cIQ0wNr5vq7lzI88D4OOqA+jAnwmSeBzja3Pf6zR4pW1SoyKjsVvXv6pc3\/GIgWCZGH4yyoFtq9V4pFildXv+0sR+rOYoDv\/8X1j0UDG9+K80Qp\/qcT\/xAuPYIJwCQ0dAmQPGbssLUuW18eGJU8KDUgYPXLElL7OlxofDl1LR9WJi83qQ2cajjW08onj5P5YuiTqw9hA39l9ff5abhaa9DrMS1f2+mzKXDmmzJXjZKW6zzJmmJ9PzLyogGRHx5aZIEuYEjpiiv7I5xj92VsAgP9Ez8ds+UJzyfKqqODYB2dPyEoZH7K0v5AzjyfANyZlfMhS5YxxWdfHhjk8LiJXwxkdUR98fTDS1mfHD6hw\/IAKgHEGZ83VixQ4fkCFspfzMS9diSBZmNXjrgzzk++vbVHbO65xQdKAB6+UKQDg\/PO\/xmgAn1zyw9LHtwAwliyvjg6bc0Vk0Hxb57hybyGivtuPqO8+Mb9Xe\/m1qL18Ho4uyISvj8Q\/ZXzI0nEhfrFvfH2OG83JbXFGRzRAH5cUAQAmJSbbDLApc+UAgCa9Dof22M4KfylCU0b5J9h7bVPJ8tttuRjdWoeGDgGjHtwImUyG4\/XtxyUjg5JthVzwhWrIC1egMTIaqswdeOO576DK3IHq6Tch6rtPMP2953DjC7fBr7keADA+xD\/pjqvGWE9yIjfAoCMaINNsLtJKo4nJqImx5hA81nW8LTHBvnYFnblk+cMxhKj+CQCoGJuCmYuWoLVTaC3QtJ4YH+JvtXnGr7ke819agerpN6F6+k3m92svvxaf3PNnfHXz7wAA4TXfQF6oNH8+PsQ\/6fapoxfbMz4iV8OgIxqAk5VqNOmNd\/Sy1lFpaVS08fPj\/QTd6EBpv0E3LkgasPKKkMUAUPP0fRgpFfBVsy\/kT74EANh2vOHdy0ePXGjr+9Pfex7BF6pRnXST1c+PLsg0B2B4zTeIP\/i6+bOYsIBrrooKju1vjESuhkFHNADVR35aTgsKtV62NAnsmtE16XXmcLTGVwL\/qEBpnyfbkBIhl\/n5hH67LRcTm8+hoUNAwOpnzSVLndQ\/3tdHYnVDe\/CFanNwtQWG2ryGaVYHAPGfvtHts5kTQuR9jY\/IFTHoiAagr8DqyXLG92O1tu9jA2wHXUZccOx1UQHXCE16yPYZny233z\/GXLL81f7zpWNG+tmcFUZ\/9T4AoDEyus8xNEZGd5vVBV+oNn8WFuAbMy7Er+9kJ3IxDDqiAbAMLFuNKNY0OxCQlsYFSQPWTgtVAMA3\/7sMQT7Gh6ku\/qtxW8HWo\/rS6IiRsbZmcwAwoqu5xB51E6eZ\/zzyYnW3z6aNCba7aYbIFXB7AdEgvZabhddys5x6DVPJUvPWdsTUawEAzenZkMlkONnYUVV4TH\/slimR8r7O4dest\/t6bYEym59FBfvFAjho98mIRMagIxqkn+fmW90wbvKXVYp+G1H6YlmyDCrOA3yA3dJJyLhrFVo7hdaczy+UAkCwX9\/rewNVNzGx288jpBKrtw8jclUsXRINgGW5sr\/1OkfKlc0dQq9bbvVVsnznZJNKfaFNBwBBI4Yu6Eyzv7qJ0\/psXCFyBww6ogHor9PSUlP9T0EX2bXVwJoOAa2ahvZuTwDfMidSLvPzCf3+vTfMJct2xW\/NJcvHKy46pYRoWpc7cc0dzjg90bBi0BENgGUnpWWQWfNjjRaAcRbY1547XatBa\/lz6oTAsYsmBs0XmvTw+fsGAEBZ5yjMXfGbbiXLoebXXI\/ow++jbuI0nJhzpzMuQTSsGHREA2C6tRfwU5BZY1nWtPyONTWXOo5Z\/vzH5HAFAFRsyMQoSTvOtAHXPLEdQPeSpaOCL1R3u79lT9f+7bcAgE9+8eeBnJ7I5TDoiAYgSBaGSYnGG\/tXV9q+F7PlZ6bjrekQ0Gp5U+ctcyLlYwKlUWf2vYMraioAAMdm34mJV1yJc82dtdZKlu2dvdf3bJEXrugVdlHffYIbX7gNIy9WQ5VZ1O9+OyJ3wa5Loj50CmgHMMLaZ\/PSlThZmYUfa7Ro0uus7qc72XUHlSBZWJ+dmd\/Wt6tMfzaVLAGgpSAHIyXA\/s4ILP3dkwCAp9R1VkuWdS3tZ+15FE9jZDSOyTMhL1zR\/fsTp6F6+k04uiCzz+87EqhEroBBR9SHCy2dagCzrH02L12Jspfz8WONFvtLipB2X++9dKYbOaetyrK5sfxSh1C793SzeYZmKlke+IMSiZI2NHYCVz1RBADYU9O0r\/xU81lr5zl\/qf3sFZH2\/V4n5tw54PW3upZ2q9cnclUsXRL14XRT55EzTZ2HbX2+dG0uAGB\/cVGvbQam59VNSky2GoKAsWT5fnWT+c7JT6REzBkTKI06\/eleJGr3AwDUSbeZS5ZrDl5Q2RrLZzX6Yx0GodX+325gjp9vOtb\/UUSug0FH1I+yU827L3UItdY+m7FIgZ\/nGmd1f12lwMmuNblDe0rxylolJiUm46GXrTdHdghoLatpLqpt7tQBQHKkX9iSSUFyAKh74WHjeQyhuPnRZwHYLllaOnepzakhpGvpqPr+ovUZJZGrYumSqB8N7YaWXT9cKro5OkgxKsCn1xrYvHQloqcmo+yVfDybIQdgXJNLW5XV50yurKa5yHLf3MZZkQp\/qXSBgewAACAASURBVMS\/Mu+3iJY0o6FDwJhHXgTQd8nS0kdanWp54piEvu55ORhfnGpQOeO8RM7EoCOyQ0O7oeUNTePriyYGySfLfHs9uXtSYjLu21xk17l0bYaq8lPNpaaZHGAsWU4K9o3R\/3AM4YfeB6TAl\/E3YEnKbOjbDPV9lSwtnWlo0x0+27g7ZXzI0p6f+TUZb+rcPsA7nVTpWj79urZRO6AvE4mIQUfkgD01TSp1oFQ9LypAPi5IavUp3ra0dqL+qK5NZbmNAOhesvz+8V9gshSobA\/Akj8VAgA2f1Pv0Mbwj7Q69bgQv9ieTxn363p6QWOE49sGdC0dVW8eOb\/b4S8SuQAGHZGDaps7dW9qL5VGBUpVU8P9EsYHSRPC\/HxirB17qUOo1bcZzh6vb1dX1rVprR1jKlke3pKNyYZ6NHQIiMgybtb+uLbl02KN47OoN74+V3r71NEtMWEB15jeC6+pBND\/8+h6Ot3Qevi9by8w5MhtMeiIBqi2uVNX29x8EF2PrAkZ4RMwKdh3LGC8OXPP+1Za87vpYcmmkuXoT98EpMA3sfOw6NoF0LcZ6tdXXFQNdHxvHjm\/+6qo4GPXxYQqAnx9Qt964guHvt9hEFqPnW9SlZ1wzv00iYYLg47IDs3fVoQ1VR4c2\/LDN2Mt3w+4bNrZoMQ5ZwOvSNE1tBtabM3arBkXJA24Kz54MdC9ZLkobwcAY8nyTFPnoDZnf13bqP26tjH\/+tiw5EmhAQl2bShv66zV1rWoD9bUqxtaB3d9IlfAoCOyQafT4V9P\/Cb52\/J\/Kzov1Vvt4NAfeBcAIB0ZWu8Xfbk2bP5ydVjqXVp7zv\/ivNEKf6nE\/5t\/\/BWTDcb1s4B7\/ghg4CVLWz7S6tQA1AAwOSJwbOAIqdVnyrHZhDwRg47IitLSUqxYoYReX2\/R0DEfgLzHkSoAanReqg9tPvZFUvOxL5LO\/f2Z+rCFd6rG3PMHmzfBzEyQJUwJHTFFX3sKkf\/+M+ADHIi4CouW3DHokmV\/uA+OvA2DjqgHpVKJHTt2dP0UAyAXgLKfb6kB5AMoReel+tAL\/ypY2vDZnuQx9\/x+d8jsxd2CZVyQNODBK2UKAPj+sV9gso+AE61SzH26CACw\/duG3YMtWRLRT3hnFCILGzdutAi59QC06D\/kACAZQFHX8esBhKLtrDam5rnM1ef+9nS3xxZ0K1leqjG+uWIDZDIZjte3Hy88pucttoiGEIOOyMKePXu6\/vQqjDM5R4V1fU8NY6kTuPCvgqUnn75nMdC9ZOn\/9l8AAF+GTcGMJXegtVNo\/dX+8055mCqRN2PQEfWyHvbN4voSC+P6nfGelZfU+65pKn521sorQhYDwJdPrEbUCANq231w9eMFAICtR\/WD7rIkot4YdETdJGFgMzlb8gFsAQBUlfz1Zs2Rr0K\/2rkdV+uOAwCaM7Ihi5rAkiWREzHoiLpROuGcWQCMt57831\/9FiN3PgcA2CedgOnLV7JkSeRkDDqibpL7P2RAigCE4rr27zFa2oHGTmD+c\/8AAPzzRCO7LImciEFHNCzCMGP0tVh7xUgAQM3C+yGLmoCTjR1Vz32ls7nfjogGj0FHNEy2zvkBAFDREYLZ9z+C1k6hNefzCyxZEjkZg45oGKyf+XNcGWIsWab8+R0AwDsnm1TqC226fr5KRIPEoCNysviwvVh7hfHJAWf\/5xfmkuXjFXwqANFwYNAROdnWuWsBAMcNwbj61+tZsiQaZgw6IifKmr4a14Q3orETGP+o8YnhLFkSDS8GHZGTXCb7HP+b8B8AwHdTbsCE6bNwrrmzliVLouHFoCNykoJ5mQjxNZYs528w3ubrKXUdS5ZEw4xBR+QEyyY\/gmvCGwEAE7I2AwD21DTtKz\/FZ8ERDTcGHdEQiwg4iheufgsAUBk7D+OvWYBzzZ21aw5eUIk7MiLvxKAjGmIv\/c89CPEFThoCzA9TZcmSSDwMOqIhdEP0X5A6uh4A4Hf\/MwBYsiQSG4OOaIiEB5zC\/836MwDgmzFX4YobboW+zVDPkiWRuBh0RENkw6y7MT4AONcpNZcsN39Tz5IlkcgYdERD4Ibov2BF9CnjD7\/cAEmQDB\/XtnxarGnUijowImLQEQ2Wj4\/eXLL8NnIKJt98B\/Rthvr1FRdV4o6MiAAGHdGgPXHNbRgfADQZfJCy8Z8AjCVLPkyVyDUw6IgGISXqDfzmspMAgB9v\/Q1LlkQuiEFHNEA+PnpsnbMeAPD9yImYdvdDLFkSuSAGHdEAPZ6ixJSRnbjUKcHkJ\/8OANj+bcNuliyJXAuDjmgAJoe\/g1WXfQUAaJDfBVnUBByvbz9eeEx\/TOShEVEPDDoiB\/n46FFw7SMI8ZWgJnAMrnggF62dQuuv9p\/nnjkiF+Qr9gCI3E3W9PsxM7QDlzolmPiHVwAAW4\/q2WVJ1D9512s4qRh0RA4YE\/wh1l5RAUCCBvldGHdZAkuWRPaTA1g\/zNdcz9IlkQO2XbsWIb4SnJKMZMmSyE0w6IjslH75Q1g4qgkAMOH3LwEA\/nmikV2WRC6OQUdkh1FBn2HLjN0AgOrpN0E2dRZONnZUPfeVTi3y0IioHww6Ijs8f81qhPhKcFHij8TsP6O1U2jN+fwCS5ZEboBBR9SPG2PX4bZxjQCAiKy\/AADeOdmkUl9o04k5LiJPUl5eDolEAolEgvj4+AF9p66uzupxDDqiPowK+gwvXP02AOBMghyymQtwsrGj6vGKiwdFHhqRR0lNTUVqaioAQKPRoLCwsN\/v5OXlmf+cnZ2N8PBwq8cx6Ij68NjVD2N8gAQ\/CiNwxbpNLFkSOVF2drb5z5YhZk15eTnKy8sBGEMyMzPT5rEMOiIbZo9\/GspJPwIAAlfnQRIkY8mSyIksA6u\/WV3P2VxfGHREVkil1fjLzB0AgFOjLse4+UtwrrmzliVLIueyZ1ZnOZvLzMw0lzxtYdARWZE78+dICBbQJPgg4ZnXAQBPqetYsiRysri4uH5ndaYADA8P73c2BzDoiHqZPf5p\/Da+1vjDL3MhCZJhT03TvvJTzWfFHRmRd9i4caO5saTnrM5yNpednY24uLh+z8egI7Lg43MOTycbS5bnw6IxdvHPca65s3bNwQsqcUdG5D0sZ2o9Z3Wm4LOc+fWHN3UmspA1\/VnMDjOWLC\/L\/RsAwCDAsHvxOKW4I\/M8AVJJgI2PlBj+O9zT8LD1v3kvmZmZyMvLQ11dHQoLC5GZmdlrNmdrO0FPDDqiLpNGjsDaK3QAJGhLuxc+oycAAMYGSceJOzKvE9P1Is9TZe+BplldTk4OKioqUF5ebp7Z9bedoCeWLom6bJ07BiG+EpwJHo9J9+aIPRwir2e5BpeTk4OSkhLz+46QCIIw5IMjclHJAP4LINj0xnXXXYf9+\/fj1okj8Y\/rjRO3VWfH4lynVKQheh+9Xo\/KykpER0dj4sSJYg+HnCghIaFh27ZtIY58p7CwEKtXrzb\/nJmZiYKCAoeuy6Ajb5EFIBdAqOmN0tJSpKeno6OjA9XpcZCN8MHGry\/ima8vijZIIk82d+7clk8++cTudTqT+Ph4aDQaAMCJEyfs6rS0xNIlebowAKUAtqAr5HQ6HbKysnDbbbeho6MDAPDzj87g3ZpLDDkiF2QZbI6GHMBmFPJschhDzjyLU6vVUCqVOHz4cLcDP65txse1zcM7OiIaFgw68lT5AB7u9kZ+PtasWWP14JUrJTh8OBRarXFt7qGHfga5\/JdOHyQBlZWVWL9+PTIyMpCRkSH2cDzOxo0bkZPjGs1VI0eOrAMw7F3MDDryNMkAigAkmd7Q6XRQKBTYt29fr4NDQ4GiIkChEKDX6\/H44zKUlAThpZf2QKc7jvz8d2GsfpKz+Pv7w9\/fH\/Hx8ZDL5WIPx+O42H\/TNjEuyjU68iRZAFSwCLnS0lLExo63GnLz5wNaLaBQGH+WyQzIz9dh7doGAEBJiRbLlydDr9\/v\/JETDSGlUin2EFwKZ3TkCcJgnMUtNb2h0+mQm7sKL7ywy+oXtmwBsrKsn2zdugYkJrYjKysMBw60Iy1tGbZvT0di4l\/Qbujs\/E91pba68ULj0P8a3iU6ODJ4Ucz0Xo+SFjoqDgttb6rFGJNHkIy8WPTqpt0QafbUjzsBrO73qCHGoCN3J0evhpP3oFTehcOH63sdnJRkLFUmJ\/d90sWLW7Br1wWsXBmBmhopli3bifz8cixe\/Jp0UUxy\/J6TX514X3u4Zkh\/EzIy1OqE1te0Yg\/DTaml4RpXfsqGXIyLsnRJ7iwfwF6YQ06H\/PzFmDHjFqsh9\/DDgErVf8iZJCa2o6zsPObObUNDgw\/uu0+PTZtuBJCPRZOmx9+XKE8Yot+DaNCunFUzz8VDTjQMOnJHyQDUsOiq1On+Abl8HNas2dPr4NBQ4K23gPx8IMzBvhKZzICdO39EenoTAGDz5hHIytoAvX4JrooMifrDLEVK8IgAVkZIbKXfft+WJvYgXBWDjtxNj4YTLUpLpyE29hfYt6+l18E9G04GKj9fhy1bdACAkpIgLFv2KaqrkzA6sCL48dm3XRMXOia4n1MQOUMLgNel4RqPXtMsKyuDIAgY6J28GHTkLnrd4QTIR1ZWAm67rRL1vSuV2LLFWKp0dBZnS0ZGEz744DxCQgw4cmQE0tLaUFl5I\/ykT\/k+MG1hknzClWOH5kpEdmmJiKmaIQ3XHBN7IK6OQUfuQA5AC3NXpQ5q9UwkJ6\/BCy+09jo4KQk4dMh2V+VgmNbtpk5tR0ODD268cTSKi5+Dn3S5ryJ+8pS7p8ybPPRXJerlLIBt9frOO8QeiDtg0JGry0W3hhMV8vPHQS6vQI+7eAEAVqxwrOFkIKKjO7Fr1wXzut2aNWHIytoHQI5ZUfoJD02\/MZHrduQssxacWgSgSBqu0Yk9FnfBoCNXFQtjw8l60xs63YtQKBZgzZqWXqVKU8NJUdHQlSr70ntzeRCWLz8FvX4BJocdHfVw8uIkrtuRE6i\/VLfOlYZrei9Ik00MOnJFShhDznyHE5VqOWJjf4233+598Pz5gFo9+IaTgVi3rgGvvHIRISEGHDjgh7Q0f1RW3ojRgbuCH5i2MGla5ETeP4yGiorbBwaGQUeuxNRw8iq6SpVarRbLl1+LBQt2WW04Wb\/eWKqMjR3GUfZg2lw+cWJn1+bySOze\/SD8pH\/3XZW4IOmm2CQ+TZQGZdLUk1dLwzUqscfhrhh05CrkMM7izLfxUqvVSE5Oxq5dB3odHBNjbDjJzR228fWpZ5PKffdFYNOm3wIo4uZyGowWAEWnznT8TOyBuDMGHbmCXBgbTmJMb+Tn50Mul6PeyjRuxQpjqdKZDScDIZMZUFZ23mJzeQiystZAr9+PqyKjubmcHDLvxtNLYGw60Yo9FnfHoCMxxaJXw4nxkTpr1qzpFXIjRw5vw8lAWW4uf\/11fyxbdh+qq6sxOjAk+JGUW1PYpEJ2OPvl4bYj0nDNWbEH4gkYdCQWJXo1nKgQGxuLt611nACYNAlwrUdr2ZaR0YRnnvkR58+fwyefVCMtLQ2VlZWQ+QUGcHM59UMLoKitzXCP2ANxglwAkuF+MehouPVqOAGArKwsLFiwwGqpMjs7G6GhoTh61DmbwJ2htBT47W\/bYDAI8Pf3R0NDA2688UYUFxfDT+rrq4ifOeX2+FmxYo+TXMu0a2qul4Zrirh9YGgx6Gg4yWGj4eSFF17odXBMTAwOHTqEjRs3orTU2FW9Ywfg6s+ULCoCbrsNqK8Hli5disOHD2PRokUAgDVr1iCrK62vn5AQw83lZEF19Nu2G8QehCdi0NFwyYWNhpPDVm5xsmLFCnMIAoBcLsfWF5++ALhu2Ol0xnHde6\/x52uvCTj81s7HDkdHR2P79u1Yu3YtAKCkpATLly+HXq\/H5LCoUQ8nL06KCgoNEG\/k5AJKuX3AeRh05GyxcKDhJDQ0FG+99RaKiooQZtFxIrS+sef+O1\/+67qHQt8GjGGXnGx8MoErUKuN64c7dhh\/Xr505L6P3h9XamhILxVa39gDAOvWrcOWLVsQEhKCAwcOmNftRgeGBK+bcXMKN5d7pZYx8VXTPP3pA2Jj0JEzKeFAw8n8+fOhVquhsLzFiaG21tD4YIGh6dGDAJD3RIT6qcfC3wgMlLQdPmwMu\/x8Z\/8atul0xnXDGTOAw4eBgABJ69Yto3a8\/uoYlekYQ9OjBw3Nz70BobU1IyMDu3btwsSJE1FTU4Nly5Zh9+7d8JP6+q5KXMAmFe\/SAqDowsXO5WIPxNMx6MgZHG44Wb9+vTkETYT2jz7tbFhWJLTv6dZinbMm7FhZ6bitE8ZJz9XXA2vWGO+MUlTknF\/GGp3OuFk9NhYwLS9On+Z3\/MhnE\/PvXxGi7Xm80LL1mOFSVhEMtbWJiYkoKyvD1KlT0dDQgPvuuw8vvfQSAEARP3MKN5d7vq4bM+dz+8DwYNDRUJNjAA0nuZa3OBFaWw3Nz71haFTuhuG01e6zObP8dVWVk7bed0\/InqAgSXtVlXFtLDbWOMPTOem+7lrtTwG3YYOx4SQi3Ee\/dcuoHV9+NOH1SRN9bXbLCe17znY2LCuCoapKJpOhrKwM6enpAIDc3FxkZWVBr9dzc7nn035zpP17dlYOHwYdDaVcDKLhBABgqKrq1C\/MF1q22vUwyYIXRh385uDEzXcsC9o\/ciQ6qqqMM7zwcONNnouKBr+Op1YbwzM5Gbjssu4Bt+6h0LfPnYjZYm0WZ5XhdEtn\/YIiof2jTwHjf58tW7YAMDapLFu2DHq9npvLPZdaGq7x1D1yLov\/YqShEAtjqdK8FqfT6aBUKq2uxYWGhqKoqKj7WhyMDSemtThHTJro2\/KPl6LKT9Z0fFzwav1VJaWN8zQ\/GELffhvmpx3ExBiDKjnZOBszVUjDwozvqVQ\/nU+rNb5UKmPI9ay0Jk\/3+2750pFf5qwJG\/CTnQ2Nyt0+gY+elQTcvzQjIwPR0dG49957ceTIEcyePRu7du1CYmJiwAPTFia9p1WfUJ06yhKXG7v+pjOKM2c7zmq07blij8UbSQRBEHsM5N6UAPJhsRanUqmgUCisrsXNnz8fRUVF3dbiYKitNTTllvZcixuMg5+3hr1Rqpu1\/2DL1C8PGQbVzThyJDoSE0bU\/M\/coMO\/zpQd66s86SjJiEVjfUbmKyHx96+ursbKlStx5MgRAMCWLVuQkZEBAPjo1LGqN098rh2q67qCaZETw1YlLkg6cOAAli9fjrVr12LdunUQ2t7bZ7j0kErs8Q2xUnZWioczOhqoMABFsFiLA4xrTRs2bLD6hfXr13dfiwMgdFQcNlx62OZa3EDNmeWvmzMrqgxAGQCU\/rtpbOV3DdPOnW8fW3nEENrULARIfQXf+nr4HDki+E2YIOmYMF7S0tGBjpFBPi2T431rI2T+2rmzA84qbg1y2mxKaN9ztlO\/MF8asksZHR0dtWvXLmRlZWHPnj1Ys2YNKisrsWHDBlw\/ISFm\/MjwkUVHPzre2N7S4azx0JBrAfA6b8wsLgYdDUQyjKVK81qcVquFQqGwuhYXExOD0tLS7mtxQmuroeXPpfauxQ2W4tagswo4L7AGxXC6pbNhWZHPyBcWy2QpSdu3b8emTZuwefNmvPzyy6isrMT27dtNm8sDXq7cW1nbVM9GBhc378bTS44eb\/++Xt+5UeyxeDs2o5CjcgEcgkXIFRUVITk52WrILV261GrDiaHx7m3DFXJuwXC6pa\/N5cuWLePmcvdydv8H4+fV6zvvEHsgxKAj+8UCUMHKHU7uvfdeq3c4efXVV1FaWtr9Didt7+3rrF9QJHR86aQNAO7N1ubyI0eOcHO5G7j+pjOKpHmnFsD4HDnOul0Eg47soYBxb9x80xsqlQrJyclWuyqTkpKgVquhtLwhpVBfb2h8sMAlmgwkIQES31kJEr+b5fc+JFvnG\/HD+vf3zn1A4r9CKfFPV0j8bpZDGi9aiHBzufv66P1xud8caZ3PkHMtDDrqi6nh5C1YdFXm5uZiwYIFqKqq6vWF9evXQ61Wd7\/DSUfF4U79LduGsqtyICTSabES\/7vvlPivzIbvtXfA5\/L5AQEjgwHA3z8sCpKwGEjGJ8Hn8vmSEbeulgQ8kCXxu1kOSciw33CZm8vd0m5puKZU7EFQbww6siUZxlncCtMbWq0WycnJVrsqY2JisHfvXut3OGlILx3qrkqH+IwNk\/jffSdGLFwByagp9n\/RPxQ+l8+X+P8ySzIidY7zBmgDN5e7hetvOqOYNPXk1dJwjcN7QGl4MOjImlwMoOFEbvn4bxdpOJFIp8VK\/JY94FjA9eTrD2niIon\/3XeKMbszNCp3Cy0vvQ0AGRkZ2LlzJ0JCQsyby\/nkclG1fPT+uMWnznT8TOyBkG0MOrIUCw9qOJGM+J9kjFi4AvD1H5oTjpoi8c9QihJ2zc+oDY0PFkBobZ07dy527dplXrfjk8tFo4Ox6cQ1t62QGYOOTDyq4UTiOysB0quX9n+ko4KjxAo70+ZyU5PKrl27uj25fP16479Prp+QEHNfojyB63bOM2vBqUWBUdoUhpx7YNCRRzWcAAB8xobBd7ai\/wMHKjhKMmKh3Hnn70PX5nKho+KwTCbD9u3bsWrVKgDAyy+\/bH5y+VWR0VF8crnTHPt874QFvDGz+2DQeTfPaTixIBmxSDFk5UpbfGKukUinxTr1Grb02Fy+YcOGPjeXs0llaFx\/0xnFtGtqrpeGa17n9gH3wqDzXrnwkIYTSxLptFhIwmL6OkbzwwU8u+lDSIOy8NL2TwAAN976Im689UU8u+lD+y\/mmyIfzFgHy9rmclOTiuXm8t8mLUphk8rgffT+uAeOftt2g9jjIMcx6LxPLDyo4aQX36Q+twF8+J9vcXnik9j5phof\/PtXuH\/ltQCAD\/79K6TMiMajj72DyxOfRMWh6v6vJQmLEW1W16Xn5vLPPvuMm8udo5TbB9wXg867eFTDSS+SkIC+thFUHKrGjbe+iLjLIrHn3Qex8IYrun3+zJNL8Mi6hdD8cAGLbtkKzQ8X+r+m75XJ\/R\/kXI5sLv\/fq29JYpOK\/ebdeHpJREzVlXzEjntj0HkHz2s4sULim9znjOXOXxQBAB5ZtxDhYUFWjzF9VqdrwqOPvWPHRce4xizJtLm8o+IwYNxcblpLtdxcPjE4Ioyby+2m2\/\/B+Ft4Y2b3x6DzfB7ZcGKVJNLmOtSH\/\/nWPENbfrvtSVh4WJB5prfzTbUdszpff\/iMdZknCRga0ktNm8vvv\/\/+PjeXz46KHyX2eF3R9TedUcxacGoRgG3cPuAZGHSeLRce2HBikyTUZtCV7z0OAIi7LNLmbM4kZUa0+c873+y\/YiWRjHKZoAP63ly+bNky8+byu6Zcm8jN5b3V6w313xxp\/56dlZ6DQeeZYmGl4USpVHpGw8kA2NVc0iXuskjzn+1ap\/MJd6mgA4zrdobGu7f13Fze0NDAzeV9U39zpHU+98h5Fgad5+nVcGJ68OmOHTt6Hex2DSfDoL8ZXy+SEJcLOgAQOr7U9bW5fOXKldxc3uX6m84o4qZXz+LTBzwTg85z2Gw4mTFjhv0NJ51Hj7tyw8lwCw8P7P+gzpNapw9koEyby9ve2wd031y+Z88ebi7v8tH745RV1e23iD0Ocg4GnWdIhrFU2a3hRC6XW204CQ0NtdpwIrS89LZBf8vrLt1wMkCmdTd7SpEa7Y\/mPzs8u3NRhksPqfraXH7gwAFv3VzeAmPTCbcPeDAGnfvLgrHhJMn0RmlpKZKTk7Fv375eBy9dutQcgmaG2lpD493bDM3PuPf\/2YXzWlsfWTaYfPifb\/s8jWUY3n\/f3P4va6hyi9mveXO5UF\/fc3P58uXLvW5z+ZyFp2+OiKmawc5Kz8egc19hMM7itpjeMDWc3HbbbVYbTrZs2WKj4WTuNk9oOIHhvM2\/sJbfnmxuMinpp5PS1Gl5\/8pr7ZjRNdZCaHCbGbDxCQi3bOtrczkAb9hcfvbgh+Ov5x4578Cgc08KAFo40HCiUqnMf4kBMDacNP1hhyc1nAgdnx8DOlptff7Mk0sAAC9t\/8RmF+azmz6E5ocLiLssEs88dWv\/FzVc0A5osGLqZ3N5Wlqax24uN92YGcbnyLnNP1BocBh07iUMQD4caDh5+OGHzSFoYm44aX1N6\/QRDzfDKZvTteW3J+ONvysBAItu2dqrhPnS9k\/w6GPvGG8R9u9f2bU+J3QcdNv7H3rj5vKLFzsvHvuu\/SRDzrsw6NyHqeHkYdMb9jSc5Ofn\/\/SmhzecAKbgsT2rW357Mr6rfAyPrFuIG299sdvTC1565QCeeXIJvqt8rNteOtsXO30YhrNuXfL1ss3lpUe\/bbtBEASl2AOh4cWgcw9sOLGX4awOhh\/6nGXFXRaJR9YtRGdTfrenF3y2fx0eWbfQzgt1tAptu3cPdriuwNM3l8+78fSSSVNPXs3OSu\/FoHNtbDgZAKHtPRXQWOvUi3R8VupOTSj98eDN5S37Pxh\/y6kzHT8TeyAkHgad62LDySAIrcVFTgs7Q9WnxsYXD2NjczkAd91cfhbGphNuH\/ByDDrXw4aToSA0tDgl7AxVnwptpR5RsrSl5+byDz74wO02l3c9fYAhRwAYdK6GDSdDyRR2wo\/HB3+yjlZ0fvm2p4eciSOby++eMm+yyMPtSf353gkL2FlJJgw618GGE2cQGlqE1n+8jo5P3gBa6\/v\/grVznD4stO3aJrT\/16v+u\/bcXL5r1y6rm8tnRcVNcIXN5dffdEYBQC0N15Qy5MgSg058bDgZBkLH58eElm356PzybftmeK31xjLlGy8IrSWl7r6NYMAsNpfLZLI+N5c\/nLw4Scx1O21V+0k+fYCscas2YQ+kgPGJA+a1OLVaDYVCYXUtLikpyfzgVDOhvt7Q\/Gyp167FOahrVqYGAIl0Wuy2\/IkB2\/78a+M6U2dlIcZ20QAACdxJREFUCwxnzwrCjzqvDTYbDA3ppT6Bj2olAfcvvf\/++xEdHY2srCzz5vJdu3YhMTEx+IFpC5N2fv\/Z8c9qT\/zY\/1mHTAuA3afOdOQO4zXJjXBGJw42nLgAofMbrdDx+TGh7T2V0PaeSmgvPyh0fqNlyFlnubl88eLFfW4uvyk2aeJwjGnejaeXwNh04lVlZXIMg274seGE3Ja1zeVz587ttbl80aTp8cOwufzs\/g\/G38LOSuoPg254seGE3J55c3nn0eMymQw7d+7sc3O5k8KOe+TIbgy64WG14SQrK8uxhpP2jz5lwwm5BMPpFoP+ltf72lxeXV2N0YEhwY\/Pvu2aoWxS4dMHyFEMOuezeocTuVyOF154odfB1u9w0tpqaPrDDkOj0iv2cJH7MFx6SCW0vPS2tc3laWlpzthcrj76bdsNDDlyBIPOuXo1nOTn52PGjBk4fPhwr4NtN5wszGfDCbkqQ\/Mz6r42lxcXFwMY3Obyrj1ypdw+QAPBoHOOZBhb2M0NJzqdDnK5HGvWrOl1cGhoKN56663eDSetb+xhwwm5g582l9fW9txcvmbNmsFuLm\/56P1xSnZW0kAx6IZeFozrcd0aTmJjY602nMyfPx9arRYKheKnNw21tYZLWUWGpkfd9qGe5IUMp1uMa8j2bS6PDom0Z92uBdw+QIPEoBs6YQBKYWw4CQX6bjgBgC1btkClUllvOGnfw24ycks9n1z+yiuvdFu3Mz0BYdGk6fF9nYc3ZqahwqAbGnIYG06Wmt7or+Hk0KFDbDghj2VofkZtaPrDjp6by2tqasyby\/txtuvGzAw5GjQG3eDlA9gLBxpOVCoVG07I4wmtr2n72ly+adOmXt9RKpWAz+iz0nDNNnZW0lBh0A3cgBtOzKVKNpyQh+trc\/nmzZuxcuXKXmV9ie8sz3uoLYlKIgiC2GNwR1kAcmExiystLYVSqbS6Fjd\/\/vxem79hqK01NOWWci2OvIXPyL\/KJX43zweA4uJi8z8IQ0JC0NDQgLVr12LdunUAsAHG\/38RDQnO6Bwz4IaT8PBw83tCx5dlEunYKKF9z0EY1\/a0vhE\/rDf9mT\/z575+dqWxOPKz4dJDRUJrySsSiQSWm8s1Gg1aWljQICcSBIEv+15yQRB0goVDhw4JSUlJAoBer2nTpgnvvvuu0IOu6zxi\/y588SXmK1kQBK0gCEJ9fb0wc+ZMYfz48cLzzz8vdMl1gTHy5UEvzujs43DDyX\/\/+1\/cfPPNlm+\/DSAWxj12RN5MDeMa92GZTIYPP\/zQvLmcyBm4Rte3ZBgfjGre\/K3T6aBQKKxu\/g4NDUVRUVH3zd9APYzrDfm9vkBERQBWAEBlZSUSExMBrtHREOOMzrbB3+EEOAzjHjuGHJF1SgD3AjCFHNGQY9D1NiR3OAHwAn7agkBEthUBWABj9YNoyDnz6b\/uSA5jyJnX4tRqNZRKpdW1uKSkJBQVFXXb\/A3j\/1kV4FockSNUMP7DkE8noCHHGd1PBn2HE7DhhGgwtDD+Y1Ml6ijI47AZhQ0nREQezdtLl73ucKJSqaBQKOy\/w4mx4UQJrsUREbkkby1d9mo4AYCsrCwsWLDA0YYTORhyREQuyxtndHIMTcOJElw4JyJyed42o8uFlYYTuVxuNeRWrFhhreFkH4wNJww5IiI34C0zulgYg6lbw4lSqcTbb7\/d62AbDScAsAZsOCEiciveEHRKGMPJ7oaToqIixMbGWr7NhhMiIjflyaVLU8PJq7Cz4WT9+vVQqVQ9Q44NJ0REbsxTZ3RyGPfGxZje6KvhJCYmBqWlpWw4ISLyQJ44o8uFseHEHHL9NZyo1Wo2nBAReShPmtHFgg0nRETUg6cEnRJsOCEiIivcvXTJhhMiIuqTO8\/o5GDDCRER9cNW0MmHcQxqADoHv5MLYL3lG\/n5+cjNzbU6i1uxYgXy8\/N73qdyH4zPjXP02kRE5EZsPaZnOJ\/dswD2P38qFmw4ISIiB7hT6VIJNpwQEZGD3KEZhQ0nREQ0YK4+o5ODDSdERDQIrjyjywXvcEJERIPkijO6WLDhhIiIhoirBZ0SVhpOlEolqqqqeh1so+GkCsZtA1yLIyIilyldhsG4Ftet4SQ3NxcLFiywGnI2Gk52AEgGQ46IiLrYHXR5eXmQSCSQSCRIS0vr9\/i6ujrEx8ebv1NeXm7r0MkwBtMK0xtarRbJycnYsGFDr4NjYmJw6NAh5ObmWr5dD+A2GGeE3ABOREQ\/EQTB2suqlJQUAcbN5EJBQYGtwwRBEISNGzeaj83MzOzr0J2WP7z66qtCaGio+buWr6VLlwp1dXU9v68SBCHWxu\/BF1988cWXl79sfWBVWVmZOXTi4uJsHSacOHFCCA8PFwAI4eHhwsWLF20eKwjCrYIgaOvq6oSlS5daDbjQ0FDh1VdftfbdXLH\/A\/LFF1988eXaL4fW6FJTU5Geng4A0Gg0yMvLs3pcXl4e6urqAADZ2dkIDw\/v67SNABTJyclWuyqTkpLMe+csVAGYAeMWBCIiIttsJKBN\/c3WLGd9KSkpfZ3KRC4IAtLT01XoMZNbv369teOLBEEIE\/NfB3zxxRdffLnPy+Guy7i4OGRnZwMwNpz0nNVZ\/lxQUGD3eYuLi+VXX321DjA2nOzdu5cNJ0RENGgD2l6QmZmJuLg4AMZg02g0AIDCwkJzd2V2djZSUlIcOm9aWtqSu+++u02tVkMul1t+tA\/GbQO8wwkRETlkwI\/pKSkpQUZGBgBj8BUUFCA+Ph4ajQbh4eE4ceJEf2tzJj0f06MA8JbFzxvAtTgiIhqgAd8ZJT09HampqSgvL0dhYSHi4uLMM7uCggJ7Q86aUhg3fsvBO5wQEdEgDerBqxUVFZg5c2a391JTU1FWVubIGKw9eNX0KHCuxRER0aAM6hZgKSkp5sYUE0caUPqgA0OOiIiGwKDvdVlRUdHt55KSksGekoiIaMgMKuhKSkp63cPSsguTiIhIbAMOurq6OuTk5AAwrsuZSpaW7xMREYltwEFXWFhonrllZ2cjMzPTvG\/O2kyPiIhIDAPqutRoNIiPjwfQvcuyvLzc\/AiflJQUfPHFF\/aMwVrXJRER0ZAY0Ixu9erV5j9bdl1a3vS5oqLC5k2fiYiIhovDMzprd0SxpNFoMHPmTNTV1dl7hxTO6IiIyGkcntFZNpr03EMH9L7pMxtTiIhITA4FneXWgezsbPONnXuyvOmz5Y2eiYiIhpvdpUtHS5KFhYXmtbx+GlNYuiQiIqexe0aXk5PjyFPDkZmZidTUVABsTKH\/384dnAAAwzAQ23\/rDpGGlkNa4vDHAO+MTp0vsegAWDP+ugSAnwkdAGlCB0Ca0AGQJnQApAkdAGkHePLNALBqEBcAAAAASUVORK5CYII=","width":350}
%---
%[text:image:19ab]
%   data: {"align":"baseline","height":310,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAboAAAGICAYAAAA3RSUjAAAACXBIWXMAAAsSAAALEgHS3X78AAAgAElEQVR4nOzde1xUZf4H8M8wyADCwIB3rmLmBY1RvJYl6pCWtuIF1rVtxUrINhOzEjUT3U2htsR1NwXbhNrtIphYP0sDEzfbvEGQ5iUNQcFbIcxwGy4z5\/fH4RxnYAYGmPt8368Xr5fOnHnOw8ww33m+z\/d5joBhGBBiJ7wB5AMIM1H7xQAiAFSbqH1CiAk4WboDhBhRDkwX5NDado4J2yeEmAAFOmIvEgBMNcN5praeixBiIwSUuiR2wBtAKQAvM51PDiAYlMIkxCbQiI7YgyiYL8ih9VxRZjwfIaQHKNARe2CJoEOBjhAbQYGO2IMIfXcIBIJu\/aSkpHT7nIQQ60KBjtgDc6YtLXlOQkg3UDEKsQd638R5eXkGNVBSUoL4+HgAgEQiwS+\/\/AKJRNLZwwSGdpAQYjnOlu4AIaYkk8kMOi4yMpL\/d1pamiFBjhBiIyh1SRxeSkoKP\/KLjo5GdHS0hXtECDEmSl0Se9DtN3FJSQnGjRuHqqqqrqQsOZS6JMQG0IiOOLT4+HhUVVUBANasWUMpS0LsEAU64rA0U5YymQxr1qyxcI8IIaZAqUtiD7r8Jm6bsjxz5gxCQkK62gylLgmxATSiIw6pbcqyG0GOEGIjKNARh0MpS0IcC6UuiT0w+E1spJQlh1KXhNgAGtERh0IpS0IcDwU64jAoZUmIY6LUJbEHnb6JjZyy5FDqkhAbQCM64hAoZUmI46JAR+wepSwJcWyUuiT2QO+b2EQpSw6lLgmxATSiI3aNUpaEELoeHbEHxwBMbXujZsoyJCQE4eHhBl+IVSKRIDw8vLNzEkJsAKUuiT1IALCt7Y0+Pj78aK6rZDIZcnNzOzpkFYDUbjVOCDErSl0Se5ABQN72xu4GOQPIW89JCLEBlLok9qAa7Ohqo+aNJsxWpLaekxBiAyh1SeyFN4B8AGEmPk8xgAhQoCPEZlDqktiLagCx0JHCNCJ56zkoyBFiQyjQEXtSBHa0VWaCtsta2y4yQduEEBOiQEfsTREAKYBMI7aZ2domBTlCbBAFOmKPuDTmYLBBqjvpTHnrYweD0pWE2DQqRiGOIhjAVc0bBALtHbx0\/C3QFl+E2AEKdMSRaL3ZKdAR4hgodUkIIcSuUaAjhBBi1yjQEUIIsWsU6AghhNg1CnSEEELsGgU6Qgghdo0CHSF6CN09P7V0HwghPUeBjhA9RAH33zcy+\/okS\/eDENIztGCcOJIuLRgfmX19U+s\/LwLIOb8wQGnKzhFCTINGdIR0bnjp+qjvRmZfD7Z0RwghXUcjOuJIujui03Ti\/MKAQ0bvGSHEZGhER0jXTHIbMvr7kdnXB1i6I4QQw9CIjjgSY4zoOEoA+ecXBpwwVucIIaZBIzpCuscVwCy3waHHR2Zfd7V0Zwgh+tGIjjgSY47oNCnBVmVe7EnnCCGmQSM6QnrOFcCikdnXZ9HojhDr42zpDhBiL0o3zE9mmpQNI\/HlvPMLA25Zuj+EEBalLokjMVXqUpdDVKhCiHWg1CUhpkGFKoRYCRrREUdizhEdhwpVCLEwGtERYlquABaJBoXk0uiOEMugQEeIGQz5+7HvAMTSjiqEmB8FOkLMZwCA5+jSP4SYFwU6QsysdMP8XSOzr8eOzL7ubem+EOIIqBiFOBJLFKN0hApVCDEDGtERYjmupRvmfyLyv+8bKlQhxHRoREccibWN6DRVA\/iEdlQhxPhoREeIdfAG8JxL\/0C6qCshRkYjOuJIrHlEp6kU7NxdtYXOT4hdoREdIdYnGMBzvbz77Ld0RwixBxToCLFOrr0GDh48Mvt6FBWqENIzlLokjsRWUpdtUaEKIT1AIzpCrJ936Yb5h0ZmX4+wdEcIsUU0oiOOxCpHdDGeJcGT3W4HG3Ksh1Nz9QOiyoueTs1KE3eLEHMoApCP8NUmLbyiK4wTYgFSUaX3yz7FEaGiquEigUrUxYfPNUmnCLGUgrePAchA+OoMUzRPIzriSCw+ohvoXO+6qc+ZiClutyYau21C7MAxAAkIX11kzEZpjo4QMxnoXO\/68aAjsRTkCNFrKoB8FLwdZcxGKdARYgZckOsnbOhv6b4QYuW8AOxHwdsRxmqQAh0hZrBnQP4iCnKEdEkOCt4ONkZDFOgIMbFXfIqlgb1qgyzdD0JsjBeADGM0RIGOEBNb4Hk1wtJ9IMRGTTVGCpMCHSEm9IpPsVTs1ORl6X4QYsNie9oABTpCTChMVBls6T4QYuN6XIFJgY4QE7rPRRFs6T4QYuO8UPC2tCcNUKAjxIQobUmIUXj35MEU6AixU1l5xfCZvgEpmUct3ZUuGzJ3KwTjXkbeqctmPW\/eqcsQjHsZQ+ZuNet5jSkl8yh8pm9AVl6xpbtiNSjQEWIB8VuyTf5BlJJ5FFWKBqRkfmPS8\/RElaIBVYqGdreXVFRaoDfWc35D6OtjSuY3ra+7bXzBid+SjYIL5SY9BwU6QsyopKISkc+nYc2SaYiWhZn0XMkrZiN8hD\/S1i006Xm6K\/L5NPhM34CCi6b9kLM3BRfKMWTuVr2jzrR1CxE+wh\/JK2abuWfdk7ZuIVIyj5o0MNPVCwgxEzbIpWNv8lMI8fM1+flkE4bizIcJJj9Pd5k7LWkvqmoaOhxxRsvCTP4lytj2Jj+FyOfTAABrlkwzevs0oiPETGISP0S07AGEj\/C3dFcIsTrJK2YjccdBk6T0aURHiBmkZB5FwYVyvWnErLxiZOX9iJKKSpRUVCLEzxeyCUOxZsl0SMRu\/HHpn51A\/JbsDs+Vtm4h4uZPQt6py4h8Pg0hfr745cBa\/n4u5fXLgbXIO3UZKRnfoOBiOSSe7pBNHIrkF2ZDInZDlaIBif84iLyTl1FVU49oWRh\/n6Yhc7eipKISue\/GQzZhqNZ9uvoQk\/ih1odZTOIH\/DydrjZKKiqRknmU74dswv1Ys2Ral74waLZRUlGJ8BH+iJaFdXn0wLbxM\/98hfj5YE3sdL7PVYoGDInagipFg87fBQASdxxESuZRyCYMRe678QAMe\/2rFA3wmb5B6\/kXjHsZALSe345ej7bPQ4ifL8JH+Ot9Pn2mb4DE0x2\/HFiLggvl\/Pu4q6+D5nsuK6+Ynz\/WfF+Gj\/CHbMJQJO740ugjUhrREWJiXEEI96HSVt6py\/yHv8TTDeHD\/fkPpHFPpeos1mhL88OvbSBqm+biPkxTMo8i8vk0PoVYUlGJ9M9OIPLPaSipqMS4p1KR\/tkJlFRUokrRgPTPTujsjyGFG5rHhPj5aD0PEk93hI\/w1\/ncZOUVt+sHd5uhqc+8U5cxZO5WpH92AiF+PpBNGIqSikok7jjIp8sM6f+QuVuRuOMgSiruQjbhfkjEbnwg5+aXJGI3yCbcD4D9UqJLVt6PAMB\/mHfl9Q8f4Q+Jp7vW\/8NH+CPEz0err7qkf3aCfx64YF9SUck\/n7rmyKoUDVp9ycor7tbrUFJRiaqaeqR\/dgIxiR+i4EK5zn5Gy8L48xkTjegIMbGsvGJUKRr0fksNH+6v89s3F4RSMr\/hCwvi5k9C3PxJ7drgju3K\/EzijoNYs2QaP2pgP3A\/4Isdwkf445d31yLEz5e\/r6SiEun7T\/RoHoX7XbjRSNr6hTpHPgD74azZx4IL5XyVXuKOg53OQZZUVCIm8QNIxG7Ym\/wnrZFXTOIHrc\/v0U5\/n5jED1FSUYk1S6ZpFXkUXChH5J\/TkLjjIGQThiJ8hD\/i5k9CVl4x8k79jCpFg9YXD+4DXiJ2418nQ19\/idgNZz5M4IMrAIPnYPNOXeYzAckrZmv9vimZR5G44yASdxxEiJ+PzvdP2\/dKV18HAHyGQDZhKNbETofE063dMdyXHe51NxYa0RFiYlyaTl8BCjsKaP9BvyZ2OoDOizYSdxxE3qnLCPHz7VKFZbQsjP8ABdjilbh594Jo2rqFfJ8178s7+bPB5+iptn3UrCbUNyrQxKXI1iyZrvUcS8RufDv6Rl6crLxiFFwoh2zC0HaVjGzaj32d0vez7cgmDEWIny8\/6mnbFvd7cb9TT19\/QyTuOMi2uWRauwCieVviji91Pl7X68C91wx5HTgST3c+qOsawXPvNy7rYCwU6AgxsZKKuwCg8xuspipFA\/JOXUbijoOI35KNlAx2\/VtHa4y4EQnAVq61TVt2JFr2QLvbuA8fidit3QcR939zLgfQ1UfZhKH878k9t\/pwQUwzgHPCR\/hDInbjU3H6cKlGXSNprh1A+3Xi+t0+0GmnLTV15\/U3RElFJd+Gvt+Bu11fgNH3XjH0dWh7Hn0kYje+zbyTxqvKpdQlISbEzXEA7efONLHriL7R+sDtLGhxaTng3tqprpCI3fXepuuDv6P7TEVXHw3tg+YHts\/0DZ0eGy7W\/fxxQSJ+SzZiEj\/U0Uc3reMA9gM9JfMo8k5d5tOXeafuFcK0HcF15\/U3FP9FS+ymN6sQ4ufLFyCVVNxtd1xPXgdNhrxHQ\/x8UaAoR1WN8d5nFOgIsbD4LdmthRK+SH5hNp\/WKrhQjnFPpep\/3BvZ\/NxfZ9+UHZHmh3Bn85YdrWvkAmb4cH+9H\/iAdmDiCo8KLpQjK6+Yn7fT1Zfuvv72rkpRb7S2KNARYkFcpSMA5L4bZ\/BC8u7Oy5kCPxIorwTajFSM+WHVVZrPZdq6hd0eIXEBS3MZgSHi5k1C\/IXsdoFOM43a3de\/K7iKTC67oOscBRfK+S8GmhWcltTRl4quojk6QkxIM12ke0\/He3MbbT+A9E3G92RezhTCh+ufu+PmpDpizGDYNlXMpcp6sgiZa4ObMzMUNzLLO3VZq\/JW8\/XqzuvPMfR1D\/Hz5dvWV7bPFdKwSxV6Hmw1X4eu4l+\/Tua0u4ICHSEmxn+j1jHnoPnHrFldx67zal8B19N5OVOQTby3boz7HbhNhTsKMNzoyJBgaIjEHQfhM30D4t+4t6Ceqybk0oNtdVaIwrVxb\/nFhzo\/wHUVjGiuqeNey7Yp5q6+\/oD2CM3QiszkFY8DYF+jtsEuJfMo\/9wYY39MXa9DdxjzvU2pS0JMqJERNkbLwkR5py7r\/DDkdujIyitG5PNp\/Id\/3qnL\/MJmzW\/u3LwcwH4L576Ja+rOjh89ETdvEr8IOfL5ND6VCdzb1kmXaFkYP9rxmc4uWTjzYUK3RxTc88sFXu4cySvu8pWMif84qFXCXqVo4HeS0SfEzxd7k\/+EmMQPWncwKeaLNzTb+eXA2nZ951KWmrudaOrq68\/1h0uncuvpNHdZ0UXzeWB3ZmE3MNAM9Gnr9K9n7Apdr4OhuP7o21yhu2hER4gJ3W5xuxU3fxJfXKDL3uSn+CsNcOm\/tHULkftuPL8ei\/sw0kx1FVwo1\/nTNhXY9sPXkEDS0THtK\/LYhcxx8ydprbvLfTcea5ZM0woKmuLmT0Lyitn876jZbmd91DnP1PrctV1KsGbJNL5\/Ek93ft1XiJ8v1iyZBtnE9h\/ubduXTRiKX3LWIXnFbMgmDEVVTT0\/rxU+nF3bp7ljiebjuLb0BdOuvP6c3H\/G82lQidgNIf6dP3e6ngeJpzvi5k\/CLwfW6uyfsV4HQ7+8cEsKdPSlyKAG9BAwDNOTxxNiS7Te7AKBQPvONn8LI7Ovb+rpCTf3OTNpoWfJTG73CX37H5Ke4SoUOxvZENPq6evAbQ925sMEzS9HxQhfLe1Jv2hER4gJfVYz+CIAfvPbznbhIN3DzVVxu4kQy+jJ68DOOf7Mz4lqyOhpvyjQEWJCRY2+1YXKPsUAm6IquFBO12EzgYIL5YiWhdFo2cJ68jrEJH6AuHnt9nKVwwiBjlKXxJGYPXUJAFJRpfeegfnPiQQqEVs1+aHVVEwSYg3it2Tzc6ZtbEL46qSetk+BjjgSiwQ6AHjFp1i61OvSXO7\/KZlHIfF0c9gdTa7fUeDtj\/6H78+Vo\/yOAiMH98WsSfdh9R8mW7prxMwSdxzkq0\/bKAMgRfjq6p6egwIdcSQWC3QA8O+B30SNdf3NuFeUtEE\/lfyKBes+RU19U7v7Rg7ui31bYiDuLbJAz4iVmYbw1fnGaIjm6Agxkz\/enJ7Dzdc5soTth1BT34ThHk7IlIpwaoobtgx3gaezAOev\/ordnxdauovE8lYZK8gBFOgIMStHD3bfn72O81d\/haezAB9IRZjgLYSnswDzBjjjH6NcAAC7DxRYuJfEwjIRvtqou1lToCPEzP54c3pOdk3IYUv3wxLOXf0VADCjDxvg6lrU\/H0TvIUAoDOlSRxGJsJXxxq7UQp0hFjA67+NO5H027hMhdpFbum+mJNX69xbhZINcL2d730E1bRQvYCDM0mQAyjQEWIxe2tCSudVPLrrcF3AMUv3xVwmjw4AAExsHb1phrYtV5oBsAUpxOFsMlWQA2hTZ0Is6maLu3LVncn5UtH9RS\/7FEfYe1VmQD8x1s0eiafqSgEA\/65ogbyZwalqFU5Xs6M8WmLgUOQAYhG+OseUJ6FAR4gVKGr0rf7jzek5UlFl\/ss+xRF9hEpvS\/epp1x79XLt59m7f9vb5wvYZVFHflNhy2Xt+bhta\/6AWZHj2zfGMC2orfjOND0lFlINIAHhq0tNfSIKdIRYES7gWbofxnJo1sDYQA\/nIO7\/ipxd6F1bjZoWBhdHz4F\/9UmUl5cjNjYWzz33HAICAvQ19QaAJHP0mdgfmqMjhJjM+z\/X5HP\/Vv9aAWX2dgDAv6t748+v\/5UPbHPmzOkoyJUBMGq5OXEsFOgIISazt6S29Del6g4A3H7rObgyLThdrcYjSbsgFosNaUIOIApsmouQbqFARwgxmbjh4uF9XIX9FDm70LviImpaGBSFzcPkyQYVnMgBRKCHF90khAIdIcQkBroLXZePEEepf61A476\/A2BTlssSXzfk4ccASEFBjhgBBTpCiEm8NdF3lkgoEN3c\/hJE6mZcrDUoZXkYwDSwI7lSM3STOAAKdIQQo4sJ8Qge6ysKU3z7OTyvsps0nx4xG5MnT0ajimm806C6reehyQDyzdVP4hgo0BFCjGqgu9D1pVFeUUy9Ak3pawEAu28K8NS6vwIAdl5Q5ChVjNKSfSSOhQIdIcSoNoX7RIhdnLzuvPU8XNRNuFirRuirf4dYLMYlefOl9IuKi5buI3EsFOgIIUYTE+IRPKW\/68SWM7lw+\/kkAOALn3GYNWsWGlVM46bCu4cs3EXigGhnFEKIUWimLG\/\/41V4AvjkjgCv7NsNAPjiWn1+UWUTrYcjZkcjOkKIUXApyxvpSfBsrsUNJYOQFSkQi8W4VttS9nrB3ROW7iNxTBToCCE9JvNzGzClv+vElgsn4Xn6CwDAZ55hkP1uHhpVTGPi6Uq72b+T2B5KXRJCeuw1qSSKqVfgzpvL4QE2ZfnCvj0AKGVJLI9GdISQHtk2yTein5uw\/28ZW+DRVIMbSgYu81+klCWxGhToCCHdJvNzGzDT332qquwCRN\/tAwB8JhyM2OUvAAAoZUmsAQU6Qki3vSaVRAFAxZZnAQDHqgV46u33AQCHy+uPUcqSWAMKdISQbuFSlr\/u+Su8a++gpoVB5ZwXERAQgDsNqturTlTmW7qPhAAU6Agh3SD1dfHmU5Z5mQCATOZeyvKvRVWUsiRWgwIdIaTLksf7dpiyzKtouGW53hGijQIdIaRLNof7TAr0cA5S5OziU5Y3pyymlCWxWhToCCEGk\/q6eD8R6B6h\/rUCDVmpAIBspS\/i1iYBoJQlsU4U6AghBkse7xslEgpEN7Y+CzeocLpaDdkWNmV5\/LbyJKUsiTWiQEcIMYhmylJ8+wpqWhj8MuUphIaGQtGklm8suJtv6T4SogsFOkJIpzpLWb5zTp5zs15FF1MlVokCHSGkUxvH+swSCQWia2+\/CDeocLFWO2W5t6S21LI9JEQ\/CnSEkA7FDRcPH+bVa5ji28\/hc\/1HAMD58TGUsiQ2gwIdIUSvge5C1+UjxFFMvQKN6YkAgA\/vumH+i2sBUMqS2Aa6TA8hNiAmxCOY+\/fP8qZqc+0h+e5DfaNEQoGoYssyeKqbcbFWjbGvp0EsFqOwsrGYUpbEFlCgI8QKxQ0XD39koOvw+zx7BYtdnLx0HXOttqXs1K+NFz8rrb1oisCnmbL0vFoIADg9Yjb+PHkyGlVM4ysnKw8Z+5yEmAIFOkKsyCsPeEsXBPeO0BfcNAV6OAcFejgHLRzce2ZhZWPx336sNtoFTjVTlvLdG+AFYH+1K57a+VcAwM4LCkpZEptBgY4QKyDzcxvwmlQS1c9N2L87jx\/rKwr7aFr\/sMPl9ceMsQXXWxN9Z4mEAtHVf6yDr6oeN5QMRrySCrFYjEvy5kvpFxUXe3oOQsyFilEIsbC44eLhb03wje1ukNM009996v7IAYsGugtdu9tGTIhH8FhfUZjizFH4Fh8GABwfIsOEiBloVDGNz3\/3K23zRWwKBTpCLOiVB7ylCaO8fi8SCkTGanOYV69hH0\/rH9udYDfQXej60iivKKZegdp\/rgYAfHJHgJjX3gRAKUtimyjQEWIhMj+3AYuHeMwyRdv93IT935ro2+W2N4X7RIhdnLxupCfBo6kGN5QMQlakUMqS2DQKdIRYyGtSSZQxR3JtjfUVhcUNFw839PiYEI\/gKf1dJ6rKLsDz9BcAgK88QyH73Tw0qpjGTYV3qcqS2CQKdIRYwLZJvhHGmJPrzPIR4ihDUphcyhIArv1lKQD2YqrP\/P1DAMAX1+qNVtFJiLlRoCPEzAa6C10jBrpNMse5REKB6NUHvDs9F5eyLN+1Ab4NlahpYeAWz6Ysr9W2lL1ecPeEOfpLiClQoCPEzP54n+dwU6Ys25rcz1Xa0f0yP7cBXMpS\/O0nAIC9bvdSlomnK6nKktg0CnSEmNmMQW4dBh5jE7s4ecn83Abou\/81qUQrZVlYQylLYl8o0BFiZoEezkHmPufsAHedRSncXOGdj1P5lOWNyDhKWRK7QoGOEDPS3JzZnII9e7Ub0cn83AbM9Hefqv61AuovdgIA\/g9+WLziZQAApSyJvaBAR4iVq9+6BIonh6Lxi3QAgPrOdTT8\/UUonhyK+q1LDGrDTShoV3nJpSyvJj0Fd4EahTUCPP63fwMADpfXH6OUJbEXtNclITZEdfUc6rfGgqmT96gdzZRl3+rrrSnLeEQEBOBOg+q2MfbLJMRaUKAjxFbUyaH81wYwdXIIentBODgUwsGjutyM1NfFe6a\/+1SmXsGmLAXAN4IBeKo1ZfnXoipKWRK7QoGOEBvR9M2nYOrkcJm+CKJFL0PQu9Mr+eiUPN43CgAurl0EP4EalxsEiNj+MQA2ZZlX0XDLeL0mxPJojo4QG8HUyeE86kG4PvOXbge5zeE+kwI9nIMU334Ov98uAwDOjl2AAEpZEjtGgY4QG9Jr+qJuP1bq6+L9RKB7BFOvQMOuVwEAe+u8EfvaVgCUsiT2iwIdITbEedSD3X5s8njfKJFQICrbvBRuUOFirRqT38gAABy\/rTxJKUtiryjQEWJDupuyFLs4eQZ6OAcpzhyFz\/UfAQBXxkQhNDQUiia1fGPB3XwjdpMQq0KBjhAHIO7l5M3UK3B32woAwMF6MRYnvQ0AeOecnC6mSuwaBTpCHICTAE4\/v70aPmjEDSUD6WvsTijHbytP7i2pLbVs7wgxLQp0hDgAxZmjGHgxHwBQOHouRoRPoJQlcRgU6Aixc0y9AoodqwAA+6tdMeeljQAoZUkcBwU6QszIEmnCkt1\/hbilDjUtDEa8kgqxWIzCysZiSlkSR0GBjhAzu1bbUmaucynOn0bfU\/sBAN8ETMWEiBloVDGNr5ysPGSuPhBiaRToCDGzU782XjTXuX79258BAP+rc8Hc17cBAHZeUFDKkjgUCnSEmNnOC\/KiRhXTaOrz\/LL9VfRtrEJNCwOfhL9DLBbjkrz5UvpFhdkCLSHWgDZ1JsTMbtarlPk3G07M9Hefasjx7mszu3yOtinLp1pTls9\/9ytt80UcDo3oCLGAN3+sPqFoUvfsonIduLmdveROYY2AUpbE4VGgI8QCbtarlK8V3P3EFG1f25OMgbU3UNPCgPlTEqUsicOjQEeIheRVNNza83PNAWO2qf61Ai5f72Hbdx2CaQsXo1HFNG4qvEtVlsRh0RwdIRb01o\/VRQCweIjHLJFQIOppe5dfW4yBTmoU1ggw799ZAIAvrtXnF1U2Vfe0bUJsFY3oCLGwt36sLnrlVGVGT+fsSj\/e0S5lea22pez1grsnjNVXQmwRBTpCrEBeRcOtSZ9XpB4urz\/WnaUHTL0Crp\/\/AwDwnSiIT1kmnq6kKkvi8Ch1SYgVWXWiMh9A\/isPeEsf7O86PNjDOVhfSvNOg+q2Zy8nTzdngfu5lxcgyEmNn+uBWZnssgJKWRLCokBHiBVqnbsrAgCpr4v3\/V4u3pr37y2pLd02yTdipr\/71FuHPkaQvBQAcPWRWIyjlCUhWijQEWLliiqbqtuOzGR+bgNm+rtPZeoVwAdJgAA4oOqPp1atBwBQypKQe2iOjhAb9JpUEgUAZzcsgbtAjZtNQMRbHwMADpfXH6OUJSH3UKAjxMZsm+Qb0c9N2P\/msS8QfOscAODihEUICAjAnQbV7dZ5PkJIKwp0hNgQqa+LN5eybEhbAwDIVfXB3Ff+AgD4a1EVpSwJaYMCHSE2JHm8bxQAFGyKQx9BM242ARM3vw+ATVnmVTTcsmgHCbFCFOgIsRGbw30mBXo4BynOHMX95QUAgILQ38H\/\/hGUsiSkAxToCLEBUl8X7ycC3SMA4G7qCgBAvtIDi5PeBkApS0I6QoGOEBuQPN43SiQUiH5KeRE+TCNqWhgMXZcGADh+W3mSUpaE6EeBjhArx6csz59GwI9fAQBO3D8LI8InQNGklm8suJtv2R4SYt0o0BFixTRTlhVblgEATjW6Y8Ff2H0t3zknp4upEtIJCnSEWLGNY31mcSlLP6YONS0M\/NbuBsCmLPeW1JZatoeEWD8KdIRYqbjh4uHDvNcScS4AACAASURBVHoNU1y9CMkPbMryXPBDlLIkpIso0BFihQa6C12XjxBHAUD5G8\/AQwj82OCMyet3AKCUJSFdQYGOECv07kN9o0RCgejnXUnwb7iDmhYGrvFvQiwWo7CysZhSloQYjgIdIVZGM2XpeewjAEDBgHCMm\/kEGlVM4ysnKw9ZuIuE2BQKdIRYEc2U5ZWty9HbicGPDc6I+AtbgLLzgoJSloR0EQU6QqzIWxN9Z4mEAtG5\/\/wD99WVAwB6L02CWCzGJXnzpfSLiosW7iIhNocCHSFWIibEI3isryhMcbsCvv\/3dwDA9z6jMeaJ36NRxTQ+\/92vtM0XId1AgY4QKzDQXej60iivKAAo2xSL3k4Mfq4HJr+RAYBSloT0BAU6QqzApnCfCLGLk1fJ\/vcRJC8FADREr6GUJSFGQIGOEAuLCfEIntLfdSJTr4D60zcBAMeEfnh48bNoVDGNmwrvUpUlIT1AgY4QC9JMWX6\/Phb9hCrcbAKmvvUfAMAX1+rziyqbqi3aSUJsHAU6QiyIS1le+fJTjLpzFgBwd86LEPf3w7XalrLXC+6esHAXCbF5FOgIsRCZn9sALmUp+CAJAJuynLxkBRpVTGPi6UqqsiTECCjQEWIhr0klUQBw7PV49BW2oFZFKUtCTIECHSEWsG2Sb0Q\/N2H\/GyePYuzNMwCAorB5lLIkxAQo0BFiZjI\/twEz\/d2nAkDV9pUAgB\/UXnh8LVtxSSlLQoyLAh0hZsalLL9fH4sAQQNqVcCQTR8CAA6X1x+jlCUhxkWBjhAz4lKWFT+eRmjpdwCA86GPw\/\/+EbjToLq96kRlvmV7SIj9oUBHiJlIfV28uZTlja1xAIBLag\/INmwHAPy1qIpSloSYAAU6QswkebwvW2W5MR7DnGpRqwIGrU0HwKYs8yoablm0g4TYKQp0hJjB5nCfSYEezkGKqxcx9NI3AICzQQ\/C74HxlLIkxMQo0BFiYlJfF+8nAt0jAODK63+EhxD4qdkVM1MyAVDKkhBTo0BHiIklj\/eNEgkFolO738R9ajkAwPe5rQCA47eVJyllSYhpUaAjxIT4lOXtCvgf2Q0AKBw4DvdPnwNFk1q+seBuvmV7SIj9o0BHiIlopizPvrwAHkLganMvRPztYwDAO+fkdDFVQsyAAh0hJrJxrM8sLmU5Wl0JAHB7jt395Pht5cm9JbWlFuweIQ6DAh0hJhA3XDx8mFevYYrbFfD6mk1Znus3mlKWhFgABTpCjGygu9B1+QhxFAAUbo7HQBfgdrMTRiXuAEApS0LMjQIdIUb27kN9o0RCgejH7PcxtvoSAODuE+zFVAsrG4spZUmIeTlbugOE2BPNlKVbVgrgDLx\/tQGr\/vQC5mR9rb42Zn4hRk83aR+8XYSukX5eUlehwNWkJ+qB2\/VO3o0qYMzMGPQNfRAN4gBclgN3GhArb0KEpftnBUoB5D8eiFIL98MuCBiGsXQfCDEXrTe7QCDQvrPN38LI7OubutL4QHeh65czByaIhALR4RXzMfnuWdS0CDD6836oUn7HH9dbOvVk4PoPD3W59waIHuwzKdzXPcLZSSAyRfvE7IoBpD4eiAxLd8SWUeqSECN5a6LvLJFQIPrhi08x+e5ZAMALp1+EwP04gKsAlgAA6oqOTbz6yqxFzb9VGG3ENUriNuB16aDnJvbtPZOCnF0JA7Dny2so\/fIajXS7iwIdIUYQE+IRPNZXFKZQKCDI3AgAyPvVHzlXX0BjIwAEA8gAsAeAF5Sl54eVpzwTZazzzwnwniV2EfY3VnvE6gQBOPrlNSRZuiO2iAIdIT000F3o+tIoL77KMkSkQk0L8Oy3\/wYA1NVpHh0LIB8AoCw9P6x0w3yjBDtvF+EAY7RDrN7GL69RGrOrKNAR0kObwn0ixC5OXpf+dxRjb54BALxW\/EdUKf30PEIKdmQHNFw8E1a5\/5\/De3L+OQHeUmOkK9c\/GYnZQQLMDhJ0fjCxpCVfXkOCpTthSyjQEdIDMSEewVP6u04EgLupLwIAChReyLi0sZNHxgJYCQD4NSs1qrvzdd4uQtcp\/T1mdeexpL1DH6Xj9w\/4YP2TkaiVV1m6Ox3Z9uU1SC3dCVtBgY6QbtJMWR5eswShvZSobQGePvbv9gcLoKO8ORVAGJjmRlHF9hXdClZP3983iopPDHfrWgmKjufpvX9PciJq5VUoOp6HQx+lm7Fn3ZJq6Q7YCgp0hHSTZspyVCm7fGDblfkordGRiWSgJx+YAYBNYVbnfRTclfPPCfCWDnLvNawrj3Fkzzw8BM88PARZO1P0HnPf6HD+3wMCQ8zRrZ6Y+uU1BFu6E7aAAh0h3SDzcxugmbL0dBagqM4LfyvU\/yGqmxTcsoPKA7siDH3UKInbgIiBnnO7eDKHdutaSafHrH13L5YmJuON\/+RiyuxoM\/Sqx4xWuWvPKNAR0g2vSSVRALBvwwsI7cVuW\/ni8Z3dbC0JgBeabpUGGTqqmxPgTfNyJuDhJcHC5WsgnSKzdFcMFWHpDtgCCnSEdNG2Sb4R\/dyE\/ct\/voDJlw8DAN699hCKK8d3s8VgoLWIriujOkIAeFu6A7aAAh0hXSDzcxsw0999KgD8svEpeAiBK0pXrD2e0cOWYwEATbdKg2pOHerxmrii43nY+nwMnnl4CGYHCfD7B3yw9fmYDgsxTNX+nuREftlCdgfzYwCbXuSOXTlnnNZ9V84WYMfaeKycM44\/5vcP+GDH2nhcOVugs73snSntlkwUHc\/jb5sdJMD6JyP5+7qyxKLoeB52rI3H7x\/w0epz9s6UDis2uXNwz0WtvArZO1Ow\/slIvq31T0Z22g4xHAU6QrqAS1keeGsDxjjJAQArzvzdCC0Hg5+r+yJ9Uk9a2rE2HuufjMTxg1n8vFStvArHD2Zh\/ZOR2LE2vkc97Wr7jy2O4\/\/97cGsDts+rnG\/5uOyd6Zg5ZxxOPRRulZQq5VX4dBH6fx95lArr8L6JyOx\/slIHPooXSsYXTlbgD3JiXjm4SGdfqm4fLYAV84WYOWccdiTnIii43l8W0XH87AnOdEWljnYBLp6ASEG0kxZDj\/1CeAC7JeH43\/XphnpDAkAMqH85ezw5t8qXHv18evyNet2rI3nP\/CXJiZj1uI4eHhJcOtaCfYkJ+L4wSwc+igdAwNDsHD5mi73sDvtDwgMwX2jw3Gl9YP91rUSvRWNXCD08JJoFYMMCAyBh5cEsxbHYejocHh4SQDcCyxc36RTZFptT5kdzVdSciO3+0aHY2liMn8M15YhuCDHBVvpFBkea30OuP5zwW\/9k5F44z+5euf7bl0r4QPZrMVxGDNFBg8vCa6cLUBW62juytkCbH0+Bm\/8J9fgPpL2KNARYgCpr4s3l7I8+frTiHQB7qh6YWWuMUcRUrDr6opFVV9lDO\/31PoifUdWNrbc6uPqHKR5W\/bOFD4IrdiahlkaI6IBgSFY++5ebH0+BscPZmFPciKmzI7uUgl9T9p\/eHY0HxyOH8zSGWRvXSvhj5kyO1orAE2ZHQ1payDQxN3GjSK\/+ihdK4gNCAxp9zt6eEm6XWyStTOF7+OsxXFYsTWtXX+Gjg7n+7NjbTz+9e0vOtvi2ln77l6toC6dIsOsxXFYOWccv+7vytkCraUPpGsodUmIAZLH+\/Ipy0jhbwCAxPMpkDeJjXymWABAzanDHe56oVSp2432vmoNQtwHpS6aQeB4J2lEY7Y\/y4D0pebxD+so7dc38pqlMaLSN1dnDFyaFGADaNsgp9kf7ve9da2kw5Tq0sRkncsYPLwkiNb4MmCsuVVHRYGOkE5sDveZFOjhHKRQKNiUJYBvm4dh39knTHA2dllU063SoIafCwyuqCs6nsfPlz2mJwgB2iOcH7rw4dnT9jVTkVz6si0uAA4IDOnyiIsb7ZgyIBw\/mMXPl0V3kvbVvL+j57mjtXqaz0FXXisbFwV2x5f8Tn4ywOb6gw1plFKXhHRA6uvi\/USgewQAHHphHma5AHVqJzx54CMTnTEY7CXIilFz8lCw2\/3hetOXmjRHMp0FiQGBIVppQnO1\/\/DsaH7U1jZ9qXl8R4GUK3q53BoszTnSuakRnA15Dgx5njtKHdvAzizG4g02aCUA8DLwMVPBVm9tA3AM7GLUfH0HU6AjpAPJ432jREKB6NuP3sMs1TUAwN9+XWOClKWmWACrUPfjt8MBGBToND+Ef\/+Aj0Fn6Uo1nzHa5+bdauVV+LZNoNNMW+ob5WTvTOGLNCxBM2AZEoS4QGfIjiwOLArs6MzQAKfLVABHARwA+8dT3fYASl0SoodmytI9+00AwDlhMN458rSJz8ymL5Wl5w3ex9LUH6bGal9f+pJLW+orkNmTnMhvuHzf6HCs2JqG7f93BgfLGBwsY2xpJxNyTwaA\/ehZkNM0F+wXw3bz2zSiI0QPLmW5f0U05rkxqFMLsOjrfWY4czDYC0qXoXL\/P4f7zvvzxbZHKFWMVjGKZqHGwTIdF0roIWO1\/9jiOL44g0tfaqb3xugIWFfOFvCLq6fMjsbad\/d2+\/w9oRmAO1oioXkMAKqW1C0D3MJR4woCm8KUAijlbqQRHSF6iIQC0dHsjyBTsuXhh3s9jeu\/mTJlqYkd1dWdPxGs697rdU23NP8\/VOPD1BSVh8Zq\/77R4XyA+FZjvg4Av06uLc0qTX2VjuYwUCOwdTY3qJmypEDXTixME+Q4XgByNG+gQEeIHgqFAoIPkuDpLECZyyAs\/TDRjGePAAA0ll0M1nXvzfomrXkIzdTdVybYIcSY7XPFJlz6UjNtqYtmYNW3xMCUywo4mv3r6FI\/be\/XNUo1onxTNm4C3tBxHb28vDwIBAIIBAIMGTLEoIbaPqaqSmvuNgxsgQoACnSE6JW\/YRnGejKoUwmwuczcI4kIAEBL1e3+uu4tq22qVjSpbnP\/v290OB+MDn2UbvTtsIzZvmbAOH4wq9NqS83gpmsktWNtvEEFKtxIsrtBcUBgiNb6OH1bqWk+P9IpMlNf7ien80OsSip0zMnJZDLIZOz7q6SkBOnpnb+\/UlLufZlYs2YNJJJ2X4IS0LrpNc3REaLDqfwjCL9VADgLcMYrCtmf6riYqkl5g1tmUJ33UbC3bHFp2yMKK+tPaF6TbmliMr+l1I618fj2YBYeblPcUSuvwuWzBaiVV3U5DWis9gcEhmBK61IDbuRz3+hwvSm+MVNkfHpz6\/MxWJqYjAGBIXz15vGDWXw1Z0ekU2T89lw71sbzi9J17Z7S0XPArSk89FE6bl0r4bcAq5VX4QeNK5N7eEm0FtCbwLHHAw2ryrUS3ujg+nlr1qxBXh77RSYlJQVxcfqXmeTl5fHHymQyfcd6gU2TpgoYxvgT14RYKa03u0CgvUM997egUCjwvz9NxoO9m3CnlwTjck5BLjdfJ++JBZAJ8eTZx\/xe2pmv64jEBwbGam4Fxu3w39moxcNLgk9\/vKt12\/onI\/kRk76Ck560r+nQR+laI6Klickd7r2pucdmW7MWx2FgYAi\/52VHfW97RYS25zbkOWi736UuXGWoruBtyDk43FUUpFNkbfe7lAOIsLFAFwtgT0cHxMfH86O5tLQ0vcEuMjKSD3S5ubn8aFCHYgBSSl0S0saBzavwYO8mAMB7Lf+0UJADuCrppptX9V62Z9fFO5+0TWFu\/78zWLE1rd1+kQD7gblw+ZpuF3UYq\/22j9W3pRhnxdY0LE1M1gocXAXmiq1pWm3pC0D3jQ5vd+VwDy9JlzZ15h6j+Rxokk6R8UsfTFyEkmBjQQ4w4CKxa9bc+7KjmZrUpDmai4uL6yjIAWxaxJtGdMSRdDqiO5V\/BH474+HpLMDZwHmYkvymWTuoLR\/ANDhL+t8emn56l76jvF2Ers8N77eo7SbPxC7JAcQ+Hmhzc3MA+4ae2tlBnY3quNGcRCLBmTNnEBLSadp5Go3oCGmlUChw4a0EeDoLoHDujT9\/ZckgB3RWkMKpblIpk3+8mZF\/s+ZAQ4vaYuNPYlJyAJkAgm00yBksOTmZLyxpO6rTHM2tWbPGkCAHAKARHXEkHY7o\/rPxJcy5\/DkA4EBIOv70V2NdZ64nggGUwf+V9DTPCbNudXY0AAR5uHgPEbsO8HPv1eMrlZuKbJCr1Fvk5LV3716Ul5cjOiYGAf7+uNOATHnTvYW+BNUAih4PtLllBLoYHGxSUlKQmMjOuWqO6rjRXEhICM6cOaOr0lKXaWAYhn7ox1F+tLT+4TEAGC8XJ+bC\/CGMfPF9TOHaZxkvL4YBrOFnKgOA2b9\/f9vu24UFCxYwgwYNYv73v\/9ZuivEity9e5eRSCQMACY8PJxhGIbJzc3l\/17T0tK60lwEpS4JAbB2tA8GuQpwFyK8deFtCxagtMUWpBQV2VrdASHdJ5FI+MKUgoIC5OXl8fN2HSwn0IsCHXF4oyUiLB\/GXvrt9iNb8HGOubb5MgTbr+rqdhuyE2LXNOfgEhMTkZWVxd\/eZYzl00n0Qz+m\/vFmGCaDaQOtaZDvHgtg5IvvYz6d5scApVaQrtT82a+VYrW3nz59+jCDBg1iRCKRxftCP6b9OXr0aNs\/wU6lpaVptREXF9flNhhKXRIHIAV76Y4l3A2lpaWQStmU4GiJCKMkIiia1Yj7bgnYzc+ticEXGSfE7sTFxWlVVnZrNAdKXRL7lgTgB2hEr4yMDEilUhQXF0MoFOJXkQSyEw3481kl6hmL9bMDFOiIY9MMdIYuJ2iL9rok9igY7PWupnI3VFdXIzY2FgcOHOAPUqlUqKysBMP4oEIphK\/v+6iulkOp\/IfZO6xfu2tIEkK6iEZ0xN5EgU1V8kEuPz8fUqlUK8hxRo5UIe\/rOkyepIKTkxN8fPbjj3981YzdNVwP5iit9mfqVPZlOnr0qMX7Qj+m\/YmIiLDY3w4FOmIvvMGO4vZD4zIgSUlJmDZtGsrKyto9YOPrLigq7I1RowTIzqpHdHQzAOCbb\/6DObMfh5OTwjw9J4SYFAU6Yg\/0FJwMxaZNm9odHBTkhKPfuCNpo0jr9tR3lNj2jhIAUPhDMSZPHgNv71JT9ttAbNwuLS21bDcIsVE0R0dsXRKAjZo3ZGS8jYSERMjlLe0Onvs7Z2TscYW3t6DdfQAQE92M0JEqLIh2x9WrSvTt+zAEggOoqhprir4bSArgGF78eHtxyENj7WJB3ctjZ4f5e\/i0q7RR16\/PZBo\/LjV\/j+zL+GkVM08f9XtMKCmxpveLxcq9aERHbFUw2N3Q+SBXXX0NUVH3Y+nSl9sFOS8vAfa874qc\/W56gxwnNFSN3K\/rMXKkGnV1ari5PYFhw7Yb\/zcgxDRunT7qN83KghzAXhvOIijQEVvUvuDk6CpIpSE4cOByu4PDwpxQVOiO2CW9DD5BgL8a+zTm7Wpq3kRISGxP+02IqRUJJSW7hJISpaU7ooPFAi8FOmJLdBSc\/IikjYGYNj0VZWWqdg\/gCk6Cg7v+VheLGaS+o8RLq9iLsCqVuQgNfZiKVIhVGjG+\/CGhpMSaL+FjqQ1b8ynQEVvRpuBEjtKrz0EqHYNNm6+3O1hfwUl3rH6pEdveUcLTk0FVVQmCgx9Er14\/9bhdw1lbBopYoZyfrzRFWroTncjvzoNyc3P5JQrdUAzQiI7YhiRo7nDCfIuMPSMhHZOO4mJ1u4Pn\/s4ZRYXuiJgqNFoHYqKbsS+rHv7+aiiVVQgImA1X10NGa79j7NSGvRSiEON56NEbTwDIEEpKbOHyFjlgLyBrTqkABTpi3YLRtuCkKgFRUdOx9OkbkMu1v+F1peCkO0JD1cg9zBapKJXN8PF5Bp6ebxv9PIQYSHnhUvMVoaSk1NId6YJUM55LDja4UqAjVqtNwYkc+UdHQTpmBw583n7ZQHcKTrpDLGaQe7iOL1Lx9HwH\/fr9mebtiLndApAqV6h+b+mOdFEqgPa7N5hGElrz\/hToiLXRU3ASgGnTf0JZWftUZU8KTrpLc3G5s3MOBg78HYTC9nOFPUfZSqJt7CMVMrDpSmusrOxMNYBYM5znGDRGjxToiDXRscPJIURETMCmzTXtDjZmwUl3xEQ3I3tvPTw9GTDMZQwYMMMERSrs1Eu\/+4Mp4hEAKCo+2zjFRoMcJx\/AUhO2Xww2I8SjQEesRQLaXFJn0aJFGDbscRw71tjuYFMUnHTH5MkqfnE5w9Shb99H4e6+14hnoPhGePlWvnygKzJgmmBXDCACbf5wKNARS\/MG+w1vG3cDd0mdTz\/9FE1N7QtOtr0jMlnBSXdwi8tnPsrOHXp7r4K3d4KRWmdHdL6D\/euM1CCxQYEjr40VSkryLd0PI8sAMAbG2zFlE9isULtvhxToiCVFASiFxg4nRUVFkEqlyMzMbHdwWJgT8r9xR8JKF\/P10EBiMYP3\/9XALy53d89Cnz4LjVCkUgoAcOnt1r4ChzgCJYCMipstv7N0R0ykCGxwWoruBTw5gEwAg8EWn+hEmzoTS\/AG+6ZcqXljUlKSzqsNAMDS2F54\/1+upu9ZD61+qREBAWq8tqEXamq+Rr9+81FZuR3NzaHdbLEUABA4LpRymA7moUdvPPHd14NmCyUltyzdFzPIaP0JBpt6DAYbANtt\/A02OFaDzQTlG9I4BTpiblKwb+gw7obS0lLExsbi2LFj7Q7u1asXmpubUfhD++29rNWjkU14faMcNTUqNDd\/hz59FqCqKhVK5axutMY+JwNDh9Yat5fEyt0qLG467yBBTlMp2M8Ho6LUJTEnruCED3I5OTmQSqU6g9zcuXNx+fJleHmJUVysRuxS6y80q65mEDG9HpcuqSAWeyIsLAwCQQ18fJ5B7967u9gaOz\/n7uOldPP2pNSl4ygFkNHUpH7K0h2xFxToiDnoLTiZN28e5HLtXYG8vLywbds25OTkICgoCBkZ7Hxd5gfNVh3siorUkI6tR3GxGp6evdXHjv0XJ06cQHR0NADAyysJ3t4JXZi3ywcA+AQOotGcgxg1sfwRoaTEVtfIWS0KdMTUulhwEob8\/HwkJNyrWoyaO02+acMj3wFssIua14Dqaotdw1GnjMxmREyvR1mZGhJvJ\/mef3rsDgtVnASA1NRUbNvGxnh39yz4+i4wMNjlAwAGhd1v7v0BiWXkX\/i5abqlO2GPKNARU\/EGuzOBxg4nbMHJmDFjUFbWfheglStX8kGQw6guXFIpZu9av+p63uoXvA4AwIHPWyAdW4+iova7pJhbdTWDqHkNWPq0EnI5g\/tCepUV\/NdvV9Qc91vq2thDjHL3AQCIiYlBdnY2PD090avXefTrN8GAxeUHAADDZkz+zdS\/B7G4HDtcPmA1KNARU5CCHY7wVZWlpaWIiIjQWVXp5eWFo0ePIjVVY79XprGRUe4+oFbM\/gTqG0oASNnsU7RzW59MV1dBY1mZGmPC65CwqtFio7vU7U0IDqnj995cOLf3sYtn\/DMC\/Z35tJO6YWuRunZ5GpjGxsmTJyM3NxcjR46Ek1NNJ4vL2XXB7j5eSp+gQZTGsl\/KfkPKRtnI1QdsFgU6YmxdLjjhgiBPffu2uvbJXeqGre3++Jct8Sw9f8o\/9YFRLpcAYPvf2WCTtMl8AS8jsxnBIXVY9VIj5HIGgwYIb2d\/0D\/tkz398nUdzzQfvqVSzEiF+vbtgIAA7Nu3DzNnzgTALi738tqo41FsoAsaP7rSVL8HsTglgIzKu6qFlu6IvaNAR4yl2wUn3t73lsowTV8eU8kn72JaCvWuGwv0d1YW\/tfvk53b+mT6+jjVyOUMNm1ugsS3FrFLlcg\/ZvylCEVFaiSsaoS3Ty2WPq1EWZkaPhInxeoXvA5cOx+4K2qOe8dl4OobSlXNggympaBYLBbj\/fffx0svvQQA6N37vTaLy6vBroEFxj05p9zovwyxuPHTKmYCSHXA5QMWQevoiDFEgV37ws\/FFRUVISoqSudcXFhYGDIyMrTm4sDI5eqGN3OYxo9LDT3psiWepcuWeL6z5vW70uzPax8uu6byyfygGZkfNMPLS4Couc6IiBAiYqqwy1c2qK5mkH9Mhfx8FXIOtGhdNcHXx6kmdrHnNymbfbqWblLfUKpronOc3LfeEoh+P3P16tUICAjA66+\/jpqa7+HruwDV1alobs4CAAwIDmigtKVdKj13vvkKVVaaj6CblycnBOjGDicrV67UnosDW3Cirl2Ww83FdVfO\/9UPSMusln1\/sim4tpbR2u3Zy0sAqdQJwUFOCA7WvUdmdTVQVKxCaSmj83JADz\/oem7mDLefEld5X+xJPwFA4Lp8uJPri1EQiEQ\/\/fQTnn76aZSXl0Ot9kR19a9QKu9iz5498H541KX8igt2963\/5bGzw\/w9fLwXLlyI77\/\/HtnZ2Zg8eTLU9eszu\/JlxwYV2dHGzDaDRnSku7q0w4mXlxdycnK05+KYxkam8YNDuubiuiNqjvutqDnu\/wbYoHfoaM2Uoh+bAi79rPKQyxmnY8dUOAbD05ohg4Xy0BEuVyeGu14yRnDTxCh3XlSrSjKc3JOiQkND++fm5mLBggU4f\/48fHxcUVcXgNjYWAAYNsS7v\/e\/fso36vmJ+Q0dc31SSWlzkqX74Ygo0JHuSIDGXBzAFpzExsa2m4sD2IKTjIwMrbk4qG\/fVtf9+ZOO5uJ6ojXoZXP\/P3G60ftyidL\/WkXzgNJrKg8PD4bvTEODoFalQgsATBjjXtTXV6jsdM7NCJjmw7dUNWczhJ7\/WSQWBwXl5uYiISEBWVlZ6N1bhYSEBGzevBmjfQP6rx8f1Xt70aHi2mYl7ZBim3IoyFkOBTrSFd5gywH5xd\/V1dVISEjQufjby8sLSUlJWou\/AbbgRF33Qr6J+6pl0nhR9aTxomoA58x53k6pbyhV8mkZTh4ZswS9HpmYmpqK0NBQJCUlISsrCz\/99BP27duHvmKxx6vhc8IzLvz3pxL5HdopxXYowV4N3O7Sz7aEqi6JoXq8wwkYuVxdvz7T3EHOpsxNnwAAGDpJREFUFmguLl+2bBm\/uPz8+fOYMGECfvrpJ4hd3FyfGzUjbEL\/IX0s3V9ikGqfoLIxFOQsjwId6YzOHU5SU1O7tcOJnRca9EjbxeX79u3DyJEjUVNTg0cffRR79+6Fi9DZefGwB0PnDxkfbOn+kg7dArBLrlD93tIdIRToSMfa7XBSXV2NiIgIrFq1qt3Benc4afz0sOYOJ0Q\/zcXloaGhWovLV61ahY0b2cXlj\/gND3omNGK4Ry9Xmn6wIo88djMq7KGKaWDTlfR+txIU6Ig+CWCDnNYOJ8HBwTqrKqdOnap7h5O6hAx1\/doTJu+tPdGxuPzZZ58FALz33ntYuHAhFAoFRvsG9F8pnRXW393L+q9I6yD++9XApHPnG6dSkLMuFOhIW1zByTa0piq5ghNdO5wAwLZt25Cfn6+9w0nzf0+q5JN3Mc2HaX6iO1oXlzONnx4GgE2bNmHbtm3w9PTE999\/jwULFuCnn35CXzdPj9VjHg8P8ernYekuExyiNXLWiQId0RQBtuBkLndDUVERIiIisH379nYHh4WF4YcffmhTcNLYqK5fn6mujT1k8t46AHX92hPqhrc+BdPYGBMTg3379vFFKgsWLMChQ4fgInR2fjFsZniE34gBlu6vI3rksZtRgSOvjRVKSihzYaUov084qWizw0lqaqrOuTiALThJSkrSXhvHVADqkyIn0eglEI02ZV8di7qyDKrP70L4mG9oaKjLqVOn+MXlzzzzDJKSkrBs2TJEDRlHi8vNT\/nfrwbOospK60YjOiIFUIQuFJzs378fqampGkGuGVD\/AKi\/BdBklk47FCffIAhUA6H+2gXMHYjFYuTm5vJXLtdcqzjaN6D\/y2Nnh1GRillUg9bI2QQKdI6tWwUnUVFR925kqgH1NwBzyfS9dXhNrc\/1VQDsiDspKQkAkJWVhcjISCgUCvh7+Hi\/Gj6H5u1MaPy0iplu\/UvDKcjZBgp0jskoBSdgfgbUhwCmyjy9dgCRM7dA4PwHCJz\/oP8g9Un2B7S43EIunj7qN62pSf2UpTtCDEOBzvFEoKcFJ2hmRxbqQpN1Mn33Efj0fRaRM7egqqrOZOexWcxVQH0YQDPaLi5fsGABLS43gUceuxk1amL5I0JJySe0fMC2UKBzLKkAjkLHDifFxcXtDl65ciXy8\/PbXDeuAlB9ATB3TNrRxHUfo6qqDnlHziJ99xGTnstcSkruIO\/IWeM1yFQBqkMAUw3NxeU1NTW0uNwE\/vvVwOcu\/Nw03dL9IF1Hgc4x2FzBSfjYEP7fISH9TH4+Uxty\/0oMuX8lUt78wsgt1\/HzdroWlz\/99NO0uNw4cmj5gO2iQGf\/bLLgZO8nK5G85Q\/IPbwO0Qsnme28plJSYsoRcBM7Z8ewF2bQXFx++PBhWlzeAw89euMJn6CyEUJJiVGumUgsgwKd\/bLpghOJpDfWvPo7yGbQejyDqc8B6uMAmqFrcfn3339Pi8u7pvq7rwfNpo2ZbR8FOvsUARsoOCEmwJSzrxvqEBoailOnTvFFKgsXLsTu3bsBAFFDxg17JjRiuGU7a50eeexm1PhpFTMB7KLlA\/aBAp39MXrBSUHhVcQvfw\/jJqzjS999+j6L+OXvoaDwqt6OaJbKd\/YTOXOL3sfqazflzc8BsGnB+OXvYcj9K\/m+xSza3q5vWdknELNoO3z6Pqv1O3SUVjSo3F\/PcSlvft7utrwjZzv8vXXh+s39fuMmrEPKm5\/rr0ZlqgDVYYC5WUuLy7tOrlDLz51vvkKVlfaD3uD2QwogAxpzcdXV1YiKitI5F+fl5YWMjAztuTg0s+kvjbm4lDc\/R+K6j9s9vqqqDum7jyB99xGk7XwWcctmGPFXMUzekXOQyUYjcuYbWh\/6VVV1yMo+gbwjZ5F7eD3Cxw5G\/PL32lVvcr9DVvYJ\/jhrUlVVh5hF29tVahYUXkVB4VW+3xJJbx2PbgLUxzwY5v5zAuexo\/RdudxfzC4upyuX84rOnW9MsnQniHFRoLMPCQCSoDGKy8nJQWxsrM65uKlTpyInJ6fNXNzdBjCn3drOxYWE9INE0htxy2YgfOxg\/kO1oOAqHwDjl78H2YzR7aojk7f+AVVVT+jttOZoas2r+o\/Tp+TqbUTOfAMAkLbzWYSE9GsNXt8g78jZ1kCRirhnZyB99xHIZoxG3LLpkEh6o6qqDilvfo6CwquoqqpD\/HO7ceZU56OrroheOAnh4Wzw5EZu4WMHI3nrvRGeRKK\/LoQLcnHLZkA2YxQkkt4oKLiKlLfY0VxB4VXELNqO3MPr9LbBNP3jJ7RM\/kXgumzusmXLMGrUKCxdupRfXL5v3z6Ehoa6PjdqRlj2lVOXTt3+5Tcj\/fo25ZHHbkaVV7RUlF1vTrJ0X4jxUaCzbd5gR3H8XFx1dTWSkpJ0zsUBbMGJ9lwce0kdgeBiMARit7bHRy+cBNmM0e1GDdxt8cvfAwCkv3cEyVu003sdjZAS133MB7nkLX\/oVtFJSckdSCS9243GohdOQuTMLcg7chYlJXeQuO5jyGaMbhcQZDNGY9zEdSgpucOPkIxZ4RkS0q9d8JdIPAz+XfOOnMXeT1Zq9YkN1jP4fucdOYuCwqt6n2uB08AB6oat+YKWwltOvVNjJ0+eLNq3bx8SEhL4IpXNmzcjJibGefGwB0P9PXzKPvvldGm3f2nbpPzvVwNjqbLSftEcne2KgDEvqSMQ99d3It2pMSBu2QytEZ6hsrJP8PNr4WMHY82rvzP4sW0lb\/mDzg\/5uGXa63rTdj7b7hiJpDfWvHLv3KZdAtB1yVv+oDPwtu13Xl4Hi9Cd+gwA2CuXq2uf3NX2yuW0uBxKsBszU5CzYxTobJPOgpOIiAjDC07UZWUqxYxUpvHj0p50hFvYbeiOH1zhCMB+YO\/9JKGTR3RM3whM8\/bwsYP1LjrXHF3lHTnXo74YW0fznob2WyBw4ReIMy2F1R1dubzt4nJ7D3bjp1XM9AkqG0OVlfbPrt\/IdigY7No4rYKT2NhYHDhwoN3BugtOAKbx08Pq+rVd2uWBK\/AoKLzao62s4pe\/xxeOcPNqPaFvtKl9jP55MGvedaWj363b\/W69crlT739UC1wen7pp0yaEhoZi1apV\/OLy1sIVj9cnzJu469yRYjstUrl1+qjfNKqsdAw0orMdsWC38eKDXH5+PoKDg3UGualTp6KoqEg7yKlv31bXLk\/rapBLefNzDLl\/JV+52N0gl\/Lm5\/xj45bNsIsdT2yVuu6FfM0rl3\/99dcOsbic25gZbLqSgpyDoEBn\/bgdTvZAI1WZkJCAadOm6ayq3LhxIx8EOUzzf0+qahZkMM2Hu5SmSVz3Mb\/BcvjYwUjb+SzOnNoCpuVjMC0fG1xYUVB4r0ozJKRfu8IVYn6McudFdV1CBhi5vLPF5U8Oe+g+C3fXKO7eVd29eLn5GgU5x0KBzrpFgB3FaRWcSKVSnQUnQUFB+OGHH\/iLcQJgC04a3vpUXRt7COobXfrjLii8yheNRC+chDOntvDLDLqCK\/Pn7P0kwaCUIzE9pvnwLZVi9i6oy8rEYjH27dunc3H5+P4hfnawuDznws9N0xmGibV0R4h5UaCzXklgC06CuBs6KjhZsmQJHwR5XMGJcufF7nQgK\/tehlNX1aKhNNfL6auStAUdVWVWVdnwNJb6hlIln8YXqXR05fKV0llhtrYp9EOP3ngicOS1sVRZ6bgo0FmfYLCjuI3cDdwOJ6tWrWqXquQuqZORkaG1AJxp\/PSwSj4to6ujOE2aSwb0jcAKCks6bIPbeQRgKwV7spTAEmQzRvH\/1jc3ye1UYuvUNdE5jHL3AYC9cvm\/\/vWvdlcu7+vm6WFjVy5Xfvf1oNkVN1ts641HjIoCnXWJhYUKTnTRDG66PuQ1Kyh14RZrc23t\/WSl3mOtlWZ1I7cjiSZuVxVD2+nsi4GlqRu2Fqlrl6eBaWycNWtWh1cufyw4zN\/S\/e3ELbBFJ7R8wMHZcr7dnrTb4QRgC0707XCyceNG7bk4sAUn6vp1+d0bxbU0As4izVtkM0bxo7GYRduRvOUP\/DZbWdknkZV9gt9OS5eYRan8fWte+V2nH\/LWeEme6IWTED72c35ZReTMNxC3bAZCQvppbcclmzG6w2pU2YzRSC85wgbG5e8heuFEAEDI4P4mXeLAMLXVXX5M6+Jyp97\/XBQaGtr\/\/9u7v5i2zjMM4I\/TaG3WBHCrrVnbFQoX0YpWSJ1uQ5MWWGHZFE0QNbSTKm1O1Tg3k4A1kqm6BfsmDRcBZxcLpkiQq2QBVtOLJh1MMatW1jUuZh1U\/YPrNG2a3NSQhPD\/fLs48cHYB+Njn2Mb8\/ykI4XDsX1Slbx853u+9+vv78eLL76IkZERNDU1YXx8HE6nE\/see7Lk4fvN2\/\/6yb8\/u704t2TE\/Sfr6aqv9v1vYvGzhQWpI9P3QpnHQpd5lZCLnDIX5\/f7YbVaVefiCgsL4fF4onYbmJ+X5v7sSXYuDgAgTV\/HlgcLI0\/ZDj8D3wefo\/P1lX+go79f\/Ph3VZs+h\/tIhqldE00srX9NJrg7DiuNo8M7Oaz6\/umXEArNxC10tsPPKE2lw82wAXnO0tDHudJNzYUOWFlcvmX763V5eT\/Y1dfXh5aWFnR1daGrqwtXr16Fy+XCDx\/8\/kM7ywvuP+W\/OJZFxc7\/\/qVHTjBZSWF8dJlZDmQ4cBImlq8F1c67T78UEyCpP\/gTnD\/XAPfpl1Y93syFeSo1lqcex+X3jisjOUB+FGk7\/AwmPzklJ1Et8QM2lqcej9kt3Wy+3\/D0qVj8bwq\/\/Fybk27uPycW3hoGVnYuB6AsLr969Sq+s23H9mM\/OvDjTIdUwmvk7jEHPCxyFMkkhMj0PWxGRchQh5O1mLaW7tzy7ReO6PFelC2W5pdvHjuhxztt2fZKuene3\/4SpnvvHR8fx7PPPotbt25hx44d6O7uRkVFBQDAM3n5Y+9XH607J3b0qf1lj25\/oODgwYMYGRlBX18fKioqIN159UwKbek8TFaSGo7o0s+KLAqchIml8esQs7Grz2nDEkuf6\/aPvjT7mj\/e4vLz588DyNji8jmwyFEcLHTpk9EOJ4kQi5e9er8nZY6Y\/4duvwgBkYvLb9yIXlze1NSUkcXlP\/3FtV+Duw\/QOljo0qMSGexwkihp7oKfo7rcIJY+fU8sf5FUECUu6drc8nRFR5YsLr\/+r78\/vJ\/LB2g9LHTGcyBLAieJkObf9hj9GWQwMTstzb3hNfIj4i0ur6mpScficq6Ro4Sx0BmnCFnS4UQLsfCfoFj8cDgdn0VGWJqXZv92DtKU4f+\/SLOv+aU7r56JXlz+5ZdfGrq4nLsPkFYsdMawIgsDJ4mSZs96xfKV2OEmZT2xMHJRLI2nbZQj5s8Go3cur6ioUHYuP3nyJABg32NPlui0c7n\/o08Wfs4iR1qw0Okr6wMniZJm3B4Wu41kaV4svDMgzV1IeyhD2bl8+aOP8\/Ly0NfXp+xc3tbWpsvO5T\/71dd1kJOVfLROmrHQ6acSUYGTYDCYdYETLaQZt0csvDMgtwejrCVu3pDu\/LUnE0VOoXFxed63tt2n4d3n\/nnhe79hspKSxUKnDweiAic9PT0oLy\/XFDiRbr\/QkY7AiRbS3AW\/NNPVwdFdNlqaF4sfDi\/fOtGRzseV8Ugzv\/eKudcH1HYur6mpUXYu11Do5iDPx2XVzwVtLCx0qSkC4IVK4OTQoUOqgZPu7u7YwMnCW8PyfmAf6B8H14FY\/mJKmnF7pJmOU2Lp0\/e4BCHDxM0bYvH9t5dvt7mk2bPeTN9OtEQXl6\/n6aqv9gHoYLKSUsWmzsmrg9yMWZmL83q9sFqtuHLlSszFZWVl8Hg8q+biIKanpZnmc5mci9NCLH8xJe50XwRw0bS1dKdp62M7YYqo2GQoIX19XSz6g+lIVKZKXlz+Ycc9O\/qteXkPPdTf349jx46ht7cXTU1NePfdd+FyueK9xfX3Lz1SxdAJ6YG9LrUrAOAC8LvIkw6HA06nU\/UFqlvqLPnGpJmGrJiLIzLSlh29daatljIAOHnyJNra2gAATzzxBABgYmJC6XV59A8HJlv\/NHaUoRPSE0d02pRDTlUqc3HBYBB1dXVrbqnT09ODysrKlZN6bKlDtIFIt+o9W7a9EjTdd7j25ZdfRmlpKRobGzExMRFz7Z3Ze6ZY5EhvnKNLnAPAKBIMnNTW1sLv968uclkaOCEymtri8kcfjV1D\/pfTfUczcHuU41jo1leEJAInHo9nVeDE6XRiebrKIZY+8AMIbn3g8xYAwfDBr\/m1Xl9n071Efi3mz3qlGdsfx8bGUFpaisHBQWV7HyIjcY4uvtQDJ8CVu+\/DNUBEsgLIP1e1gNxQ4fnnnw8XvSrIv1gS6YaFTp0ugRMAZwA0AsjKZQNEGeZAxJOSu1joSHcMo8RKPXACTEPud8lJdaK1OSA\/3nQh4qkJkd44R7eaA6kGToBhrBRLIoqvB3L7PDYhIMOw0MmKoEPgBIAT8g9t0OD7Jcolfsg\/g2wzR4bgHB0DJ0TZpACc0yadbeYRXTj59QYiipzD4UBVVZVqkWtpaYHf748ucmcgP6pkkSNKHYsc6W6zhlEYOCEi2iQ244jOAQZOiIg2jc00oiuC\/Khyb\/jE1NQUrFYrBgYGYi7Oz8+Hy+WC1WqN\/pYTcrEkIqINYLMUOgZOiIg2qVx\/dMnACRHRJpfLIzrVwInVasXw8HDMxXECJ42QiyUREW1AuTqia0RU4MTj8aC8vFy1yK0ROBmDXCx7DL1TIiIyVK4VugLIHU7awyfCgZMDBw6odjhpb29fq8NJOdjhhIhow8ulR5cxgRO\/34+6uro1AyfhZQURrkBeG+c18kaJiCh9cmFEF95SJyZwsnv3btUi19DQAL\/fH13kBiCP4ryG3i0REaXVRh\/RhefQysIn4gVO8vPz4fF4GDghItpENvKILhw4UYrceoGTYDDIwAkR0SazEQsdAydERJSw6EeXRZDDGOni0Hg9AydERKRJ9H50lQAupfPzE7yuAHJRbIg86XA44HQ6VV\/Q0NAAl8sVfXoAcpHjViBERJvERgijMHBCRERJy\/Y5OgZOiIgoJdla6Bg4ISIiXWTjo0sGToiISDfZNKJjhxMiItJdtozoGDghIiJDZMOIjoETIiIyTEKFrrW1FSaTCSaTCTU1NeteHwqFUFJSorxmaGhorUu9YOCEiIiMJISIPCrFGiwWiwAgAAi3273WZUIIIU6cOKFca7PZ4l3qCf9hdHRUFBYWKq+LPMrKysTo6Gj0a4N37zf678CDBw8ePHgoR\/SJSrGGwcFBpfAUFxevdZmYnJwUZrNZABBms1l88803a14rhCgQQky1t7erFjgAoqGhQe11nruvzfh\/QB48ePDgkd1HwnN01dXVqK+vBwAEAgG0traqXtfa2opQKAQAsNvtMJvN8d526vjx40ebmppivpGfn49Lly5Ft\/GaBtAEeQkC23gREdG6NPW6DAQC2LNnD0KhEMxmMyYnJ1cVsqGhIWUOz2Kx4PLly+t+PgDU1taOvvnmm8oagb1796rNxY1BXhvnT+DvRUREBEBj6rK4uBh2ux2AHDiJHtVFfu12uxN+34GBgd27du2aBYD29nZ4vd7oIncKcuCERY6IiDTRvLzAZrOhuLgYgFzYAoEAAKCzs1NJV9rtdlgsFk3vu3\/\/\/kM+n+92Y2Nj5OlpAFWQlyAQERFpltQ2Pb29vXjuuecAyIXP7XajpKQEgUBA9ZFmvM+P+roRK8sNuKUOERGlLKnOKPX19aiursbQ0BA6OztRXFysjOzcbneiRU6NCyuPKGM2kyMiItIq6Y1XfT4f9uzZs+pcdXU1BgcHNX2+louJiIi0SroFmMViUYIpYVoCKEREROmQUq9Ln8+36uve3t6UboaIiEhvSRe63t7emB6WkSlMIiKibJBUoQuFQmhubgYgz8uFH1lGniciIsoGSRW6zs5OZeRmt9ths9mUdXNqIz0iIqJM0Zy6DAQCKCkpAbA6ZZlE+y+AqUsiIjKY5hHdkSNHlD9Hpi4jmz77fL41mz4TERGlk6YRnVpHlEjrNX1W+\/xkb5yIiCgRmkZ0kUGT6DV0QGzTZwZTiIgo0xIudJFLB+x2u9LYOVpk0+fIRs9ERESZkNCjS62PJDs7O5W5vHWCKXx0SUREhkpoRNfc3Kxl13DYbDZUV1cDYDCFiIgyK+mmznp9fho\/i4iINqGUel0SERFlOxY6IiLKaSx0RESU01joiIgop7HQERFRTmOhIyKinPZ\/10XUfR7FMZUAAAAASUVORK5CYII=","width":350}
%---
%[text:image:8eec]
%   data: {"align":"middle","height":42,"src":"data:image\/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyMS4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9InN2Zy1pY29uIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjEwMiIgaGVpZ2h0PSIxMDIiIHZpZXdCb3g9IjAgMCAxMzYgMTM2IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxMzYgMTM2OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KLmljb24tc2hhcGV7ZmlsbDojNkY2RjZGO30NCjwvc3R5bGU+DQo8ZyBpZD0ic3ZnLWljb24iPg0KCTxwYXRoIGNsYXNzPSJpY29uLXNoYXBlIiBkPSJNNjgsMjUuM2MtMjQuMiwwLTQ0LDE5LjgtNDQsNDRzMTkuOCw0NCw0NCw0NHM0NC0xOS44LDQ0LTQ0UzkyLjIsMjUuMyw2OCwyNS4zeiBNNjgsMTA5LjQNCgljLTkuNywwLTE4LjUtMy40LTI1LjUtOS4yYzAuNC0xLjEsMS44LTIuNiwyLjMtNC4yYzAuNS0xLjktMC4xLTMuNy0wLjEtNC43YzAtMS4zLTEuMy0xLjktMi43LTIuNGMtMS41LTAuNS0zLjEtMC44LTMuNy0xLjUNCgljLTEuMy0xLjMsMC43LTQuMi0wLjYtNS41Yy0wLjYtMC42LTMuNS0yLjYtNS4yLTMuNGMtMS4xLTAuNS0zLjEtMC45LTMuOC0xLjFjLTAuMy0xLjMsMC41LTIuNiwwLjQtNHMtMS4yLTIuOC0xLjItNC4yDQoJYzAtMS4yLDAtMi4yLDAuMS0zLjRjMS40LTAuNywzLjctMS45LDUuNS0zYzEuOS0xLjEsMy40LTIuMiwzLjQtMi43YzAtMC43LDAuMi0zLjEtMC41LTUuMmMtMC42LTEuNy0yLjEtMy4zLTIuMS0zLjgNCgljMC0xLjMsMi42LTMuOSwzLjktMy45czEuMyw1LjIsMi42LDUuMmMwLjcsMCwxLjYtMi42LDIuOC01YzEtMS45LDIuMy0zLjUsMi4zLTQuMWMwLTAuNi0wLjctMS42LTEuNS0yLjZjLTAuOC0xLTEuNy0xLjktMi4xLTIuMw0KCWM3LTUuOCwxNS45LTkuMywyNS42LTkuM2M3LDAsMTMuNSwxLjgsMTkuMiw0LjljLTAuOCwwLjUtMS45LDEuMS0yLjksMS44Yy0yLDEuMi00LDIuNC00LjYsMi40Yy0wLjYsMC0yLDAtMy41LDANCgljLTEuNywwLTMuNiwwLTQuMywwYy0wLjYsMC0yLjQsMS4zLTMuOSwyLjdjLTEuNiwxLjUtMy4xLDMuMy0yLjYsMy43YzAuNiwwLjYsMS45LDAuMywzLjItMC4yYzEuMy0wLjUsMi42LTEuMSwzLjItMS4xDQoJYzEuMywwLDEuMywzLjksMCw1LjJjLTAuNiwwLjYtMi45LDEtNS4yLDEuMWMtMi4zLDAuMi00LjUsMC4yLTUuMiwwLjJjLTEuMywwLTMuOSw1LjItMy45LDYuNWMwLDEuMywxLjMsMi42LDIuNiwyLjYNCgljMC44LDAsMy40LTEuOCw1LjYtMy4zYzEuNS0xLDIuOS0xLjgsMy40LTEuOGMwLjYsMCwxLjYsMC42LDIuNSwxLjNjMSwwLjcsMiwxLjMsMi43LDEuM2MxLjMsMCw1LjItMy45LDYuNS0yLjYNCgljMS4zLDEuMy0zLjksMy45LTMuOSw1LjJzMS4zLDEuMywyLjYsMS4zYzEuMywwLDEuMywyLjYsMCwyLjZjLTAuOCwwLTMuMywwLTUuNSwwYy0xLjYsMC0zLDAtMy42LDBjLTEuMywwLTIuNi0yLjYtMy45LTIuNg0KCWMtMC42LDAtNC4yLDAuMy03LjYsMS44Yy0zLjQsMS41LTYuNiw0LjEtNi42LDQuN2MwLDAuNi0xLDItMSwzLjVjMCwxLjcsMSwzLjYsMSw0LjNjMCwwLjYsMS4xLDEuOCwyLjQsMi44YzEuNSwxLjIsMy4zLDIuNCw0LDIuNA0KCWMxLjMsMCwzLjktMS4zLDUuMi0xLjNjMC42LDAsMi44LDEuNCwzLjgsM2MxLjIsMS45LDEuMyw0LDEuMyw0LjdjMCwxLjMtMS4zLDIuNi0xLjMsMy45YzAsMC42LDAuMywxLjYsMC44LDIuNg0KCWMwLjUsMSwxLjEsMS45LDEuOCwyLjZjMS4zLDEuMywzLjksMi42LDUuMiwxLjNjMC40LTAuNCwxLjQtMS40LDIuNS0yLjVjMC41LTAuNiwyLjEtMC4yLDIuNy0wLjhjMC43LTAuOCwwLjQtMi41LDEtMy4yDQoJYzEtMS4xLDEuNi0yLjEsMS42LTIuNWMwLTEuMywwLTIuNiwwLTMuOWMwLTEuMyw0LjUtMy42LDMuOS01LjJjLTAuNC0wLjktMS42LTEtMi45LTIuM2MtMC41LTAuNS0xLjgtMS40LTItMy41DQoJYy0wLjMtMy4zLTAuMy03LjEtMC4zLTcuMXMyLjYsNy44LDMuOSw5LjFjMS4zLDEuMyw1LjItMi42LDUuMi0zLjljMC0xLjMtMi42LTYuNS0yLjYtNi41czEuMywxLjMsMi42LDIuNmMxLjMsMS4zLDIuNiwwLDMuOSwwDQoJYzAuNiwwLDEuNiwyLjMsMi42LDQuNWMxLDIuMywxLjksNC42LDIuNiw0LjZjMS4zLDAsMS4zLTIuOSwyLjYtNC4yYzAuOS0wLjksMy41LTIuMiw1LjItMi4zQzEwOC4xLDkxLjQsOTAuMSwxMDkuNCw2OCwxMDkuNHoiLz4NCjwvZz4NCjwvc3ZnPg0K","width":42}
%---
%[text:image:37db]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:dropdown:7098]
%   data: {"defaultValue":"0","itemLabels":["-3","-2","-1","0"],"items":["-3","-2","-1","0"],"label":"Minimum z = ","run":"Section"}
%---
%[control:dropdown:5393]
%   data: {"defaultValue":"2","itemLabels":["1","2","3","4","5"],"items":["1","2","3","4","5"],"label":"Maximum z = ","run":"Section"}
%---
%[control:editfield:5058]
%   data: {"defaultValue":1,"label":"a = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:41ba]
%   data: {"defaultValue":3,"label":"b = ","run":"Section","valueType":"Double"}
%---
%[control:editfield:9b26]
%   data: {"defaultValue":10,"label":"h = ","run":"Nothing","valueType":"Double"}
%---
%[control:dropdown:722b]
%   data: {"defaultValue":"max(0.02,a+b*sin(pi*Z\/h)-(cos(6*pi*Z\/h)).^2)","itemLabels":["r(z)","r(theta)","r(z,theta)"],"items":["max(0.02,a+b*sin(pi*Z\/h)-(cos(6*pi*Z\/h)).^2)","a-b*cos(Theta*h)","Z.*(cos(Theta)).^2-a*sin(b*Theta\/h)"],"label":"Radial function: ","run":"Section"}
%---
%[control:checkbox:4295]
%   data: {"defaultValue":false,"label":"Open in popup window? ","run":"Nothing"}
%---
%[control:button:6d16]
%   data: {"label":"Plot surface","run":"Section"}
%---
%[text:image:55fc]
%   data: {"align":"middle","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAABMCAYAAAAoVToVAAAEVElEQVR42u2c4ZG0IAyGrwRLoARLoIQtwQ7WEizBEiyBEiiBEiiBDjydifM5jiCQBPU+fuTX3e7iIyRvEuBnnuefamlWIVRoFVqFVqEx2\/f7FYtJMFGh\/QPTLPZZbFhML2YXmy\/Mwv8O8Nnmz0ODGdQvZiIAxZqB7xR\/ChrMCk0Iymfrb3xeDQ1ghZadW0zBclv9Vxv4Lrlbzgo+G1rGn1dBWx8+MLPWBxpDgBJ\/Zwy8GE3xO+zQYCb4HkAyzuou8KKGR0IDJ29KwzoZRx8IGOIx0MDfuJJ+xSNhxotA4SheINWyOA5OldRQMAaXEGW726B5gHVMUAaP2Ux50hWH5gG22kQchQ2jruuKQQMfFhrMQATMFRDEkh0aREkX4XDFC4BljTXngWKXy4CIgvZELnCCM2zQAsL1zARC721OvgeIssCMG8ihwZKZOWcZwodSWUsNTQd8wlHUNi+FpsmgQXXBm5ocwHXEKl+CWJ4L2YcKmvUAaw6+zuXMsl29TRequwWrw2hogaUhDjPC5fgyT7S82yQWmm9pjMfZQlxKutNUNjTwV+hok\/n97qLAODMLYJELrb\/44hEJTQcKlmK3fI+JuYbcd2SE1udCMxQhOuH7XWiwAEpcRHT2LOHKQc\/M0JodOBWbRUTmvxTWpEL7cEPbgWszxK69S7Nho9pI2F9Yl94E\/ipKvsD\/F89Hc6TGpe8h6iBtArq9Ua6oVGi+IKCwXZ0CFVnWYBB6MJZW3EPFrNcw0CSR75oKPrCjSPSzoRE6ezbf42uc7Pa5yZyXdjc0TvU+eAKKOZE3rtTyFATQOEs+OtBSbBN86nT8OwYaRUtOcVdcPQ0ZEeEm1C49k1TQLAG0vgC04TBrmoiAZEL1Q5TkeHggmMFfbT6rS2gSydDOAYy4NS+QHGpz9gnuYrzQkQaTRlHuz+AMCAbbCTs8t8Im7IZi2ycsIcUsalvE+CwmYZcXIV4QJOsWbNoKjFCSclxV10S\/K6mLkCSVDoYNMBPyReYXIRP8Dxc4WRLYiT\/TXI0V8n0bEU3qrLZbpK8laawI7sES5qsDsfgWHM1isj4BUe1tIJzVimtbwn6XkGCCZkpAOwkAuG0JCQGB9DRcYtqF3a5qU1YOVyT7EDVdWHWZxwVIEmgZ6Y8m0mqopm5G05luU1\/GctEFJYch9JmCFFpiNNMFBK7G+NATOUO\/UTlxmWrCCHp2fHsi9pdJ481Vzo4znQn8bodN206AJW955Uio3feB10IEgCWXkTgkQf8SYGUPlF0MZHwgsPERRxcvDqiaJyxRzxFx973zkOyFj3OcZaNIeeQoS+EcB\/8bjxyxHKeNI8roZ7qO5PhRyXKOhQdqGOWIfdUVEye+JHQAbcJesLS74GnibADdcW2OjMggttZgf3b91+FasAEgmYgNMWx3gZTyM6VO0qkSF6fccWdaTwxQbSeQ\/4ub+nZLTsUWAva3YNXrDeudkBVatQoNb78ox6WFMDJfcAAAAABJRU5ErkJggg==","width":25}
%---
%[text:image:6173]
%   data: {"align":"middle","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAABMCAYAAAAoVToVAAAEVElEQVR42u2c4ZG0IAyGrwRLoARLoIQtwQ7WEizBEiyBEiiBEiiBDjydifM5jiCQBPU+fuTX3e7iIyRvEuBnnuefamlWIVRoFVqFVqEx2\/f7FYtJMFGh\/QPTLPZZbFhML2YXmy\/Mwv8O8Nnmz0ODGdQvZiIAxZqB7xR\/ChrMCk0Iymfrb3xeDQ1ghZadW0zBclv9Vxv4Lrlbzgo+G1rGn1dBWx8+MLPWBxpDgBJ\/Zwy8GE3xO+zQYCb4HkAyzuou8KKGR0IDJ29KwzoZRx8IGOIx0MDfuJJ+xSNhxotA4SheINWyOA5OldRQMAaXEGW726B5gHVMUAaP2Ux50hWH5gG22kQchQ2jruuKQQMfFhrMQATMFRDEkh0aREkX4XDFC4BljTXngWKXy4CIgvZELnCCM2zQAsL1zARC721OvgeIssCMG8ihwZKZOWcZwodSWUsNTQd8wlHUNi+FpsmgQXXBm5ocwHXEKl+CWJ4L2YcKmvUAaw6+zuXMsl29TRequwWrw2hogaUhDjPC5fgyT7S82yQWmm9pjMfZQlxKutNUNjTwV+hok\/n97qLAODMLYJELrb\/44hEJTQcKlmK3fI+JuYbcd2SE1udCMxQhOuH7XWiwAEpcRHT2LOHKQc\/M0JodOBWbRUTmvxTWpEL7cEPbgWszxK69S7Nho9pI2F9Yl94E\/ipKvsD\/F89Hc6TGpe8h6iBtArq9Ua6oVGi+IKCwXZ0CFVnWYBB6MJZW3EPFrNcw0CSR75oKPrCjSPSzoRE6ezbf42uc7Pa5yZyXdjc0TvU+eAKKOZE3rtTyFATQOEs+OtBSbBN86nT8OwYaRUtOcVdcPQ0ZEeEm1C49k1TQLAG0vgC04TBrmoiAZEL1Q5TkeHggmMFfbT6rS2gSydDOAYy4NS+QHGpz9gnuYrzQkQaTRlHuz+AMCAbbCTs8t8Im7IZi2ycsIcUsalvE+CwmYZcXIV4QJOsWbNoKjFCSclxV10S\/K6mLkCSVDoYNMBPyReYXIRP8Dxc4WRLYiT\/TXI0V8n0bEU3qrLZbpK8laawI7sES5qsDsfgWHM1isj4BUe1tIJzVimtbwn6XkGCCZkpAOwkAuG0JCQGB9DRcYtqF3a5qU1YOVyT7EDVdWHWZxwVIEmgZ6Y8m0mqopm5G05luU1\/GctEFJYch9JmCFFpiNNMFBK7G+NATOUO\/UTlxmWrCCHp2fHsi9pdJ481Vzo4znQn8bodN206AJW955Uio3feB10IEgCWXkTgkQf8SYGUPlF0MZHwgsPERRxcvDqiaJyxRzxFx973zkOyFj3OcZaNIeeQoS+EcB\/8bjxyxHKeNI8roZ7qO5PhRyXKOhQdqGOWIfdUVEye+JHQAbcJesLS74GnibADdcW2OjMggttZgf3b91+FasAEgmYgNMWx3gZTyM6VO0qkSF6fccWdaTwxQbSeQ\/4ub+nZLTsUWAva3YNXrDeudkBVatQoNb78ox6WFMDJfcAAAAABJRU5ErkJggg==","width":25}
%---
%[control:button:3763]
%   data: {"label":"Show cog","run":"Section"}
%---
%[control:button:1585]
%   data: {"label":"Show cross-section","run":"Section"}
%---
%[control:checkbox:6beb]
%   data: {"defaultValue":false,"label":"Open in popup window? ","run":"Nothing"}
%---
%[control:button:2376]
%   data: {"label":"Plot solid of rotation","run":"Section"}
%---
%[text:image:49a1]
%   data: {"align":"middle","height":42,"src":"data:image\/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyMS4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9InN2Zy1pY29uIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjEwMiIgaGVpZ2h0PSIxMDIiIHZpZXdCb3g9IjAgMCAxMzYgMTM2IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxMzYgMTM2OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KLmljb24tc2hhcGV7ZmlsbDojNkY2RjZGO30NCjwvc3R5bGU+DQo8ZyBpZD0ic3ZnLWljb24iPg0KCTxwYXRoIGNsYXNzPSJpY29uLXNoYXBlIiBkPSJNNjgsMjUuM2MtMjQuMiwwLTQ0LDE5LjgtNDQsNDRzMTkuOCw0NCw0NCw0NHM0NC0xOS44LDQ0LTQ0UzkyLjIsMjUuMyw2OCwyNS4zeiBNNjgsMTA5LjQNCgljLTkuNywwLTE4LjUtMy40LTI1LjUtOS4yYzAuNC0xLjEsMS44LTIuNiwyLjMtNC4yYzAuNS0xLjktMC4xLTMuNy0wLjEtNC43YzAtMS4zLTEuMy0xLjktMi43LTIuNGMtMS41LTAuNS0zLjEtMC44LTMuNy0xLjUNCgljLTEuMy0xLjMsMC43LTQuMi0wLjYtNS41Yy0wLjYtMC42LTMuNS0yLjYtNS4yLTMuNGMtMS4xLTAuNS0zLjEtMC45LTMuOC0xLjFjLTAuMy0xLjMsMC41LTIuNiwwLjQtNHMtMS4yLTIuOC0xLjItNC4yDQoJYzAtMS4yLDAtMi4yLDAuMS0zLjRjMS40LTAuNywzLjctMS45LDUuNS0zYzEuOS0xLjEsMy40LTIuMiwzLjQtMi43YzAtMC43LDAuMi0zLjEtMC41LTUuMmMtMC42LTEuNy0yLjEtMy4zLTIuMS0zLjgNCgljMC0xLjMsMi42LTMuOSwzLjktMy45czEuMyw1LjIsMi42LDUuMmMwLjcsMCwxLjYtMi42LDIuOC01YzEtMS45LDIuMy0zLjUsMi4zLTQuMWMwLTAuNi0wLjctMS42LTEuNS0yLjZjLTAuOC0xLTEuNy0xLjktMi4xLTIuMw0KCWM3LTUuOCwxNS45LTkuMywyNS42LTkuM2M3LDAsMTMuNSwxLjgsMTkuMiw0LjljLTAuOCwwLjUtMS45LDEuMS0yLjksMS44Yy0yLDEuMi00LDIuNC00LjYsMi40Yy0wLjYsMC0yLDAtMy41LDANCgljLTEuNywwLTMuNiwwLTQuMywwYy0wLjYsMC0yLjQsMS4zLTMuOSwyLjdjLTEuNiwxLjUtMy4xLDMuMy0yLjYsMy43YzAuNiwwLjYsMS45LDAuMywzLjItMC4yYzEuMy0wLjUsMi42LTEuMSwzLjItMS4xDQoJYzEuMywwLDEuMywzLjksMCw1LjJjLTAuNiwwLjYtMi45LDEtNS4yLDEuMWMtMi4zLDAuMi00LjUsMC4yLTUuMiwwLjJjLTEuMywwLTMuOSw1LjItMy45LDYuNWMwLDEuMywxLjMsMi42LDIuNiwyLjYNCgljMC44LDAsMy40LTEuOCw1LjYtMy4zYzEuNS0xLDIuOS0xLjgsMy40LTEuOGMwLjYsMCwxLjYsMC42LDIuNSwxLjNjMSwwLjcsMiwxLjMsMi43LDEuM2MxLjMsMCw1LjItMy45LDYuNS0yLjYNCgljMS4zLDEuMy0zLjksMy45LTMuOSw1LjJzMS4zLDEuMywyLjYsMS4zYzEuMywwLDEuMywyLjYsMCwyLjZjLTAuOCwwLTMuMywwLTUuNSwwYy0xLjYsMC0zLDAtMy42LDBjLTEuMywwLTIuNi0yLjYtMy45LTIuNg0KCWMtMC42LDAtNC4yLDAuMy03LjYsMS44Yy0zLjQsMS41LTYuNiw0LjEtNi42LDQuN2MwLDAuNi0xLDItMSwzLjVjMCwxLjcsMSwzLjYsMSw0LjNjMCwwLjYsMS4xLDEuOCwyLjQsMi44YzEuNSwxLjIsMy4zLDIuNCw0LDIuNA0KCWMxLjMsMCwzLjktMS4zLDUuMi0xLjNjMC42LDAsMi44LDEuNCwzLjgsM2MxLjIsMS45LDEuMyw0LDEuMyw0LjdjMCwxLjMtMS4zLDIuNi0xLjMsMy45YzAsMC42LDAuMywxLjYsMC44LDIuNg0KCWMwLjUsMSwxLjEsMS45LDEuOCwyLjZjMS4zLDEuMywzLjksMi42LDUuMiwxLjNjMC40LTAuNCwxLjQtMS40LDIuNS0yLjVjMC41LTAuNiwyLjEtMC4yLDIuNy0wLjhjMC43LTAuOCwwLjQtMi41LDEtMy4yDQoJYzEtMS4xLDEuNi0yLjEsMS42LTIuNWMwLTEuMywwLTIuNiwwLTMuOWMwLTEuMyw0LjUtMy42LDMuOS01LjJjLTAuNC0wLjktMS42LTEtMi45LTIuM2MtMC41LTAuNS0xLjgtMS40LTItMy41DQoJYy0wLjMtMy4zLTAuMy03LjEtMC4zLTcuMXMyLjYsNy44LDMuOSw5LjFjMS4zLDEuMyw1LjItMi42LDUuMi0zLjljMC0xLjMtMi42LTYuNS0yLjYtNi41czEuMywxLjMsMi42LDIuNmMxLjMsMS4zLDIuNiwwLDMuOSwwDQoJYzAuNiwwLDEuNiwyLjMsMi42LDQuNWMxLDIuMywxLjksNC42LDIuNiw0LjZjMS4zLDAsMS4zLTIuOSwyLjYtNC4yYzAuOS0wLjksMy41LTIuMiw1LjItMi4zQzEwOC4xLDkxLjQsOTAuMSwxMDkuNCw2OCwxMDkuNHoiLz4NCjwvZz4NCjwvc3ZnPg0K","width":42}
%---
%[text:image:4db8]
%   data: {"align":"baseline","height":91,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQ4AAABbCAYAAACChWtVAAA0P2NhQlgAADQ\/anVtYgAAAB5qdW1kYzJwYQARABCAAACqADibcQNjMnBhAAAANBlqdW1iAAAAR2p1bWRjMm1hABEAEIAAAKoAOJtxA3Vybjp1dWlkOmVjOTczOTYyLWY0ZDQtNGE2Zi1iMTk1LTRjMjFjZjU3ZTQ1OQAAAAGzanVtYgAAAClqdW1kYzJhcwARABCAAACqADibcQNjMnBhLmFzc2VydGlvbnMAAAAA12p1bWIAAAAmanVtZGNib3IAEQAQgAAAqgA4m3EDYzJwYS5hY3Rpb25zAAAAAKljYm9yoWdhY3Rpb25zgaNmYWN0aW9ua2MycGEuZWRpdGVkbXNvZnR3YXJlQWdlbnRtQWRvYmUgRmlyZWZseXFkaWdpdGFsU291cmNlVHlwZXhTaHR0cDovL2N2LmlwdGMub3JnL25ld3Njb2Rlcy9kaWdpdGFsc291cmNldHlwZS9jb21wb3NpdGVXaXRoVHJhaW5lZEFsZ29yaXRobWljTWVkaWEAAACranVtYgAAAChqdW1kY2JvcgARABCAAACqADibcQNjMnBhLmhhc2guZGF0YQAAAAB7Y2JvcqVqZXhjbHVzaW9uc4GiZXN0YXJ0GCFmbGVuZ3RoGTRLZG5hbWVuanVtYmYgbWFuaWZlc3RjYWxnZnNoYTI1NmRoYXNoWCAhBGFuNu2bUE7sevJr8Bret79bTDodExmjKSpMnPgtXWNwYWRIAAAAAAAAAAAAAAIHanVtYgAAACRqdW1kYzJjbAARABCAAACqADibcQNjMnBhLmNsYWltAAAAAdtjYm9yqGhkYzp0aXRsZW9HZW5lcmF0ZWQgSW1hZ2VpZGM6Zm9ybWF0aWltYWdlL3BuZ2ppbnN0YW5jZUlEeCx4bXA6aWlkOjg3OGQzNDJlLWYwZjktNGY1Mi1iZGQxLWE5Y2E0ODEzOTNmMW9jbGFpbV9nZW5lcmF0b3J4NkFkb2JlX0lsbHVzdHJhdG9yLzI5LjIgYWRvYmVfYzJwYS8wLjcuNiBjMnBhLXJzLzAuMjUuMnRjbGFpbV9nZW5lcmF0b3JfaW5mb4G\/ZG5hbWVxQWRvYmUgSWxsdXN0cmF0b3JndmVyc2lvbmQyOS4y\/2lzaWduYXR1cmV4GXNlbGYjanVtYmY9YzJwYS5zaWduYXR1cmVqYXNzZXJ0aW9uc4KiY3VybHgnc2VsZiNqdW1iZj1jMnBhLmFzc2VydGlvbnMvYzJwYS5hY3Rpb25zZGhhc2hYIEppwb3\/qN5BMHi+JO3M+DE6wdFklTRWcaANawazN9SvomN1cmx4KXNlbGYjanVtYmY9YzJwYS5hc3NlcnRpb25zL2MycGEuaGFzaC5kYXRhZGhhc2hYINxlGjRFjRPYKKX\/E8NgVT364XkffoKvroKPb9XFcZyHY2FsZ2ZzaGEyNTYAADAQanVtYgAAAChqdW1kYzJjcwARABCAAACqADibcQNjMnBhLnNpZ25hdHVyZQAAAC\/gY2JvctKEWQzvogE4JBghglkGPTCCBjkwggQhoAMCAQICEBWN\/yesI9K4JUtOYzceHZ4wDQYJKoZIhvcNAQELBQAwdTELMAkGA1UEBhMCVVMxIzAhBgNVBAoTGkFkb2JlIFN5c3RlbXMgSW5jb3Jwb3JhdGVkMR0wGwYDVQQLExRBZG9iZSBUcnVzdCBTZXJ2aWNlczEiMCAGA1UEAxMZQWRvYmUgUHJvZHVjdCBTZXJ2aWNlcyBHMzAeFw0yNDEwMTUwMDAwMDBaFw0yNTEwMTUyMzU5NTlaMIGrMRMwEQYDVQQDDApBZG9iZSBDMlBBMSgwJgYDVQQLDB9Db250ZW50IEF1dGhlbnRpY2l0eSBJbml0aWF0aXZlMRMwEQYDVQQKDApBZG9iZSBJbmMuMREwDwYDVQQHDAhTYW4gSm9zZTETMBEGA1UECAwKQ2FsaWZvcm5pYTELMAkGA1UEBhMCVVMxIDAeBgkqhkiG9w0BCQEWEWNhaS1vcHNAYWRvYmUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwxDBgdB9PXLpMXPw5oNgYkFWDPP1aSfth9TZPINOtOQlhp1v4h+hMxZWFjkZ3RJRuoSBrsSSYBaEfiDMKisi\/sOxuFHKBV\/\/l1rv3SrjrixANXIlqjGdIYydaMaFa\/5ovFz\/m4+SUz0ccYzqw+vSAzuRySGnpgm8Gmj+SEJcL\/GIHzqU9bUy3NsizY2oY28yj32rbkOqeADSM51OqIJKloEBFFexzMunzpU+K2sLqheoR8FJMaR0fGXa\/gqRzhkiBFhwUhLPS9s6+TCnz09UZMlXbdG\/iFKj3UPFUDjqh0wtFgcz24DrUlaWeiltKHouymBHuirzvmOG0VtSPepxOQIDAQABo4IBjDCCAYgwDAYDVR0TAQH\/BAIwADAOBgNVHQ8BAf8EBAMCB4AwHgYDVR0lBBcwFQYJKoZIhvcvAQEMBggrBgEFBQcDBDCBjgYDVR0gBIGGMIGDMIGABgkqhkiG9y8BAgMwczBxBggrBgEFBQcCAjBlDGNZb3UgYXJlIG5vdCBwZXJtaXR0ZWQgdG8gdXNlIHRoaXMgTGljZW5zZSBDZXJ0aWZpY2F0ZSBleGNlcHQgYXMgcGVybWl0dGVkIGJ5IHRoZSBsaWNlbnNlIGFncmVlbWVudC4wXQYDVR0fBFYwVDBSoFCgToZMaHR0cDovL3BraS1jcmwuc3ltYXV0aC5jb20vY2FfN2E1YzNhMGM3MzExNzQwNmFkZDE5MzEyYmMxYmMyM2YvTGF0ZXN0Q1JMLmNybDA3BggrBgEFBQcBAQQrMCkwJwYIKwYBBQUHMAGGG2h0dHA6Ly9wa2ktb2NzcC5zeW1hdXRoLmNvbTAfBgNVHSMEGDAWgBRXKXoyTcz+5DVOwB8kc85zU6vfajANBgkqhkiG9w0BAQsFAAOCAgEAqrl6FLQ+c9LYaf0igyTgErNL9XmmieiT3ohKFevJ3BN7kWkZD1znbVw3XnX5tgQaKq+AiSCldNxYEKqU+Rq9Lr26GGglBSA0s\/Ds2kw+2LlnTmojAHCH3CvVRbhGHHrashmnfgwmF1TSkaWk7NxEhbt9wQoiEMkLSQeM4S4Cu+176FzEdy+zzkDkRWqeSOQO\/qG2WRto\/vIq30ECf6v6FtazJI1CWIqhBK5oJioSNbLsCVJhar3Uca9D11ujeZW4k2jPCsnzriTmFqVftd3k2SXUQg7wQcQcXfKBItWZt8ztn0IYoZzJa1x9l9dvXKAJvNsDoz4uDerS8z9rzLsEQvzL1yPbTp4+\/6mTTAWsoaDtmkZgm3X+sffPX3XzMFmfzIHiYfUja5nKK2bs4P71tit\/1U\/FD2xdlpzZSupRqCMGz+UTeXI8IrN5ZR\/+F8rSsmRAStjnggz\/wDucwcDlJbY4\/RKq3BrAi4LamLMIfwo\/dbL55TDlIOd7HCfmSgabc1WO0Kji3LW\/VZnP9VG8WiUG+WqtN1OQIAZmFUOWdXQGLag+I1OaZ1BXJDNsJiXcg2TGNBSEPo44Akfn9MzFGKyB5UurMN4NH0qlamhrhKiV0+b73Fjx330P\/frxBmzx5NpAQhNKksx+F4z1S8Ay1o2TBIkkeAFbDzy8f\/FxuytZBqUwggahMIIEiaADAgECAhAMqLZUe4nm0gaJdc2Lm4niMA0GCSqGSIb3DQEBCwUAMGwxCzAJBgNVBAYTAlVTMSMwIQYDVQQKExpBZG9iZSBTeXN0ZW1zIEluY29ycG9yYXRlZDEdMBsGA1UECxMUQWRvYmUgVHJ1c3QgU2VydmljZXMxGTAXBgNVBAMTEEFkb2JlIFJvb3QgQ0EgRzIwHhcNMTYxMTI5MDAwMDAwWhcNNDExMTI4MjM1OTU5WjB1MQswCQYDVQQGEwJVUzEjMCEGA1UEChMaQWRvYmUgU3lzdGVtcyBJbmNvcnBvcmF0ZWQxHTAbBgNVBAsTFEFkb2JlIFRydXN0IFNlcnZpY2VzMSIwIAYDVQQDExlBZG9iZSBQcm9kdWN0IFNlcnZpY2VzIEczMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtx8uvb0Js1xIbP4Mg65sAepReCWkgD6Jp7GyiGTa9ol2gfn5HfOV\/HiYjZiOz+TuHFU+DXNad86xEqgVeGVMlvIHGe\/EHcKBxvEDXdlTXB5zIEkfl0\/SGn7J6vTX8MNybfSi95eQDUOZ9fjCaq+PBFjS5ZfeNmzi\/yR+MsA0jKKoWarSRCFFFBpUFQWfAgLyXOyxOnXQOQudjxNj6Wu0X0IB13+IH11WcKcWEWXM4j4jh6hLy29Cd3EoVG3oxcVenMF\/EMgD2tXjx4NUbTNB1\/g9+MR6Nw5Mhp5k\/g3atNExAxhtugC+T3SDShSEJfs2quiiRUHtX3RhOcK1s1OJgT5s2s9xGy5\/uxVpcAIaK2KiDJXW3xxN8nXPmk1NSVu\/mxtfapr4TvSJbhrU7UA3qhQY9n4On2sbH1X1Tw+7LTek8KCA5ZDghOERPiIp\/Jt893qov1bE5rJkagcVg0Wqjh89NhCaBA8VyRt3ovlGyCKdNV2UL3bn5vdFsTk7qqmp9makz1\/SuVXYxIf6L6+8RXOatXWaPkmucuLE1TPOeP7S1N5JToFCs80l2D2EtxoQXGCR48K\/cTUR5zV\/fQ+hdIOzoo0nFn77Y8Ydd2k7\/x9BE78pmoeMnw6VXYfXCuWEgj6p7jpbLoxQMoWMCVzlg72WVNhJFlSw4aD8fc6ezeECAwEAAaOCATQwggEwMBIGA1UdEwEB\/wQIMAYBAf8CAQAwNQYDVR0fBC4wLDAqoCigJoYkaHR0cDovL2NybC5hZG9iZS5jb20vYWRvYmVyb290ZzIuY3JsMA4GA1UdDwEB\/wQEAwIBBjAUBgNVHSUEDTALBgkqhkiG9y8BAQcwVwYDVR0gBFAwTjBMBgkqhkiG9y8BAgMwPzA9BggrBgEFBQcCARYxaHR0cHM6Ly93d3cuYWRvYmUuY29tL21pc2MvcGtpL3Byb2Rfc3ZjZV9jcHMuaHRtbDAkBgNVHREEHTAbpBkwFzEVMBMGA1UEAxMMU1lNQy00MDk2LTMzMB0GA1UdDgQWBBRXKXoyTcz+5DVOwB8kc85zU6vfajAfBgNVHSMEGDAWgBSmHOFtVCRMqI9Icr9uqYzV5Owx1DANBgkqhkiG9w0BAQsFAAOCAgEAcc7lB4ym3C3cyOA7ZV4AkoGV65UgJK+faThdyXzxuNqlTQBlOyXBGFyevlm33BsGO1mDJfozuyLyT2+7IVxWFvW5yYMV+5S1NeChMXIZnCzWNXnuiIQSdmPD82TEVCkneQpFET4NDwSxo8\/ykfw6Hx8fhuKz0wjhjkWMXmK3dNZXIuYVcbynHLyJOzA+vWU3sH2T0jPtFp7FN39GZne4YG0aVMlnHhtHhxaXVCiv2RVoR4w1QtvKHQpzfPObR53Cl74iLStGVFKPwCLYRSpYRF7J6vVS\/XxW4LzvN2b6VEKOcvJmN3LhpxFRl3YYzW+dwnwtbuHW6WJlmjffbLm1MxLFGlG95aCz31X8wzqYNsvb9+5AXcv8Ll69tLXmO1OtsY\/3wILNUEp4VLZTE3wqm3n8hMnClZiiKyZCS7L4E0mClbx+BRSMH3eVo6jgve41\/fK3FQM4QCNIkpGs7FjjLy+ptC+JyyWqcfvORrFV\/GOgB5hD+G5ghJcIpeigD\/lHsCRYsOa5sFdqREhwIWLmSWtNwfLZdJ3dkCc7yRpm3gal6qRfTkYpxTNxxKyvKbkaJDoxR9vtWrC3iNrQd9VvxC3TXtuzoHbqumeqgcAqefWF9u6snQ4Q9FkXzeuJArNuSvPIhgBjVtggH0w0vm\/lmCQYiC\/Y12GeCxfgYlL33buiZnNpZ1RzdKFpdHN0VG9rZW5zgaFjdmFsWQ44MIIONDADAgEAMIIOKwYJKoZIhvcNAQcCoIIOHDCCDhgCAQMxDzANBglghkgBZQMEAgEFADCBggYLKoZIhvcNAQkQAQSgcwRxMG8CAQEGCWCGSAGG\/WwHATAxMA0GCWCGSAFlAwQCAQUABCCW5fLPMKpDTnRjMMWCbF80n4rBlfJ7HXQNA421mB\/w9gIQDpDNZUZsw+0O0lvNEvVUvBgPMjAyNTAyMjgyMTI3MTBaAgkAx4bzbTW0q5OgggvAMIIFCjCCAvKgAwIBAgIQDAsvx3p4z7rtZVZUwZokAzANBgkqhkiG9w0BAQsFADBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xOzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGltZVN0YW1waW5nIENBMB4XDTI0MTEyMDAwMDAwMFoXDTM2MDIxOTIzNTk1OVowWzELMAkGA1UEBhMCVVMxETAPBgNVBAoTCERpZ2lDZXJ0MTkwNwYDVQQDEzBFQ0MyNTZfU0hBMjU2X1RpbWVzdGFtcF9SZXNwb25kZXJfQWRvYmVfTk9WXzIwMjQwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAATQ\/B6F+IGYpiqQQLxOfqkUmeTmSRWZzxSCtwM82siW\/SbXazktRyEWmwIVs+8PJjhV9C4fUJ23IGRxsfzJM8leo4IBizCCAYcwDgYDVR0PAQH\/BAQDAgeAMAwGA1UdEwEB\/wQCMAAwFgYDVR0lAQH\/BAwwCgYIKwYBBQUHAwgwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcBMB8GA1UdIwQYMBaAFLoW2W1NhS9zKXaaL3WMaiCPnshvMB0GA1UdDgQWBBTs0RxvfOegTeQxP4cACNSt1H02uzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2VGltZVN0YW1waW5nQ0EuY3JsMIGQBggrBgEFBQcBAQSBgzCBgDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMFgGCCsGAQUFBzAChkxodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2VGltZVN0YW1waW5nQ0EuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQCi7MEg8nkvLauLI7cAj21DgnMErh0mntCt4c4tsW9yJQZdZv1n8E1dueayb6IiZ8mYambImrTeuVKwGqUSITZTiVhtFRP3zRD9DpFk+Ex4P010IStH\/eD1lgK6bVfaY0gvzcIRQP3CwIzqBZAE81c5QINjPs81cvJLOFKd\/cX7zOhoQvrziNDy15UNT5fuURe2fioANQsRNYOmVXAdg2TK7OktYD+EH\/D8gWr7nHQhRJMuD54GNjiZnNPnYXz6F3j7Bu2aVlirvQGAAsrW27Lqhg9ksW5+aL+g9\/lyqRoMrWLSy4KDQaztPB+PKskecO1R7dbJbw7UBFVl+GbGaUc4x6HvVLNNL5hHjiLrf9A4zxe52e9ZqpSU7kDu7dsRXvm+uLLMXjHFSx\/j0stIcxnQHwOL4A5RRuUH1Xw1wz2CiGvIHNcoYrkqfkb6TsKJU7ntDqNKFKZ349sBErTdXwVoId4zS\/cV\/A5rO1Kw5aNO\/zUTCtQkbcMg88XGWqImaYmIHhIvHaE1nRdPWCa0QhrxvioeP45p4\/zqd\/JrVbNsoEuEBSRIPB3+ViLaoFlimZRUePzwKYvyTrd6g72mVtF4Prbbvy1kqCUmsZDMFqn33DR0N8Qzqkzir3bufNyI5k95Rq3NXcbfNYDx9qZ8gjCu4NHtSxAdJKswzb9gi6jyFTCCBq4wggSWoAMCAQICEAc2N7ckVHzYR6z9KGYqXlswDQYJKoZIhvcNAQELBQAwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgVHJ1c3RlZCBSb290IEc0MB4XDTIyMDMyMzAwMDAwMFoXDTM3MDMyMjIzNTk1OVowYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVTdGFtcGluZyBDQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMaGNQZJs8E9cklRVcclA8TykTepl1Gh1tKD0Z5Mom2gsMyD+Vr2EaFEFUJfpIjzaPp985yJC3+dH54PMx9QEwsmc5Zt+FeoAn39Q7SE2hHxc7Gz7iuAhIoiGN\/r2j3EF3+rGSs+QtxnjupRPfDWVtTnKC3r07G1decfBmWNlCnT2exp39mQh0YAe9tEQYncfGpXevA3eZ9drMvohGS0UvJ2R\/dhgxndX7RUCyFobjchu0CsX7LeSn3O9TkSZ+8OpWNs5KbFHc02DVzV5huowWR0QKfAcsW6Th+xtVhNef7Xj3OTrCw54qVI1vCwMROpVymWJy71h6aPTnYVVSZwmCZ\/oBpHIEPjQ2OAe3VuJyWQmDo4EbP29p7mO1vsgd4iFNmCKseSv6De4z6ic\/rnH1pslPJSlRErWHRAKKtzQ87fSqEcazjFKfPKqpZzQmiftkaznTqj1QPgv\/CiPMpC3BhIfxQ0z9JMq++bPf4OuGQq+nUoJEHtQr8FnGZJUlD0UfM2SU2LINIsVzV5K6jzRWC8I41Y99xh3pP+OcD5sjClTNfpmEpYPtMDiP6zj9NeS3YSUZPJjAw7W4oiqMEmCPkUEBIDfV8ju2TjY+Cm4T72wnSyPx4JduyrXUZ14mCjWAkBKAAOhFTuzuldyF4wEr1GnrXTdrnSDmuZDNIztM2xAgMBAAGjggFdMIIBWTASBgNVHRMBAf8ECDAGAQH\/AgEAMB0GA1UdDgQWBBS6FtltTYUvcyl2mi91jGogj57IbzAfBgNVHSMEGDAWgBTs1+OC0nFdZEzfLmc\/57qYrhwPTzAOBgNVHQ8BAf8EBAMCAYYwEwYDVR0lBAwwCgYIKwYBBQUHAwgwdwYIKwYBBQUHAQEEazBpMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQQYIKwYBBQUHMAKGNWh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQuY3J0MEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQuY3JsMCAGA1UdIAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG\/WwHATANBgkqhkiG9w0BAQsFAAOCAgEAfVmOwJO2b5ipRCIBfmbW2CFC4bAYLhBNE88wU86\/GPvHUF3iSyn7cIoNqilp\/GnBzx0H6T5gyNgL5Vxb122H+oQgJTQxZ822EpZvxFBMYh0MCIKoFr2pVs8Vc40BIiXOlWk\/R3f7cnQU1\/+rT4osequFzUNf7WC2qk+RZp4snuCKrOX9jLxkJodskr2dfNBwCnzvqLx1T7pa96kQsl3p\/yhUifDVinF2ZdrM8HKjI\/rAJ4JErpknG6skHibBt94q6\/aesXmZgaNWhqsKRcnfxI2g55j7+6adcq\/Ex8HBanHZxhOACcS2n82HhyS7T6NJuXdmkfFynOlLAlKnN36TU6w7HQhJD5TNOXrd\/yVjmScsPT9rp\/Fmw0HNT7ZAmyEhQNC3EyTN3B14OuSereU0cZLXJmvkOHOrpgFPvT87eK1MrfvElXvtCl8zOYdBeHo46Zzh3SP9HSjTx\/no8Zhf+yvYfvJGnXUsHicsJttvFXseGYs2uJPU5vIXmVnKcPA3v5gA3yAWTyf7YGcWoWa63VXAOimGsJigK+2VQbc61RWYMbRiCQ8KvYHZE\/6\/pNHzV9m8BPqC3jLfBInwAM1dwvnQI38AC+R2AibZ8GV2QqYphwlHK+Z\/GqSFD\/yYlvZVVCsfgPrA8g4r5db7qS9EFUrnEw4d2zc4GqEr9u3WfPwxggG3MIIBswIBATB3MGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNIQTI1NiBUaW1lU3RhbXBpbmcgQ0ECEAwLL8d6eM+67WVWVMGaJAMwDQYJYIZIAWUDBAIBBQCggdEwGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMBwGCSqGSIb3DQEJBTEPFw0yNTAyMjgyMTI3MTBaMCsGCyqGSIb3DQEJEAIMMRwwGjAYMBYEFPcTAlRkG5zO0lEtYsW\/nymEjPz4MC8GCSqGSIb3DQEJBDEiBCC5RC0I3ilvIMLeyTzlvE4PGDMn63+AF8ctpU\/Oxf5odjA3BgsqhkiG9w0BCRACLzEoMCYwJDAiBCC5eiZoHRjpuXxjPvhIOWRVdZeW2lBDRCyPjM3lJ+AAqTAKBggqhkjOPQQDAgRGMEQCH2Q0kcdaZLC3vGWurhEEgOy4lr2DLG\/hf5fpA\/uNg1MCIQDf928a4SJA9Xt0Ckv8WhtToE73MIXgO+zO\/bGGb2IJ8GNwYWRZE4UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPZZAQBktJKZrAwIKwaWE2wDwEpKaJ+64S5x53bx5qVrwSra9dVeo3PZYLzdiiZYKm62UH+CRxJny29KzuV\/ekuz4dQIML3L2DbWXkI0ECn8V6c4pepoFtP1dIFP9DXxr3bMVLE9maOkFZJOdt6MmaOdpEXcVVKir2\/0VDEwbKis60yinA9ejwA\/N5lUnqWj65\/EjvZ5\/ZGqBH7QVOeH+YctRd8uhZzD97DXv2GWivt69pP4UAR02pqZKEyoVnwrFEf4IK1b7Dd\/uUgt3l2nXoW7aHig\/DdbmPZomgdGbUEj6rNtbpPFtJCFyGKfOe4zIhHilbg29G+hpxCvuRWp0ckoaKpdxOQyJwAAAAlwSFlzAAALEgAACxIB0t1+\/AAAIABJREFUeJzsfXl4U2Xa\/p02a9ucJE3atE3StKxt0w0Qu7CIMnRhE5VFVBQR0FFUxhFnEZTBXVFxRBTU6giMbCoCshSX2tKFvS207DRp0jX7SZt9+f1xmkPTFpXR+eab39f7urhozvqek5z7fZ77WQ4jEAhgEIMYxCBuBGH\/6QEMYhCD+O\/DIHEMYhCDuGEMEscgBjGIG8YgcQxiEIO4YQwSxyAGMYgbBvM\/PYBBDOL\/GhgMxqQ+i7IBCPssswCo7fVZHQgE1P\/GYd0QBoljEIP4DcBgMJIAJAFIksvl2VKpVKjRaLK5Pbh8+bKy9\/ZJSUkAAIvFAiaTiaioKLS3tyMyMhJyuRwOhwPx8fEAAIfD0dXQ0MBlMBhMLpfriouL0zEYjMsmk6nWarUeBFAbCAQs\/4OXC8ZgHscgBnFjYDAY2QCyk5OT7w4EAsPUavXQyMhIb2Zmpjc2NpabnZ0NAMjOzoZQKOz3t8Viwe7du6FWqwEAarWa\/ru2thYymSxgMpkY7e3tEIlE4PP5yMjIQFxcHFQqFUaNGoXa2lqo1WqcPHnSe+TIEaZUKm3l8XhlarV6ZyAQ2P1vvweDxDGIQQwMBoMhBJAtEAiKoqOjs10uV3Zra6s0ISHBPXbsWHZ2djYmTZoUQgplZWX0\/z6fGxcuXEJHp8Hv9frcbW1tXC6PBy6Xi7DwcD+Xw3EPdF673c71er3ostnAZrMDHR3tDKfTAafDAQDg8XhITk5GXl4eFi5ciPHjx6OsrAxlZWX48ssvfZcvX\/YplcrK8+fP\/\/3fRSKDxDGIQeCaFZGSkpLb1dU1yWAwJDmdTs748eO9Y8aMYSYlJSFIFBaLBbW1tTh9+hSqq6tx\/vxFr8tlZ6akDIVQQHiSkxWs653H7fZ2+Px+JwCQNjvT6\/V7A4EA12S2SQGgq9sJr9d33XGSpNVvMhjCbDYSXV02OB0OSKVSTJgwAWvXroVSqYRarcbu3buxdu1ar91u7\/b7\/R9YrdZXf0t3ZpA4BvF\/CkEtQiAQFEVGRo4HMKyvFRH8l5SUhNraWtTW1uLkyZOorq5Bk1rtZ7FYYaNHqXw3j80Mr6w6ZWtovMwHAA6HbZ04\/iZWcrI8AgDMJIluux0AEBkRARFBhIylw2ik\/2azWCHr3W5vh9fn85ot3V6LtUvpcnnQ1e3sdz0ej8dnNOjDu2wkzGYTRgwfjmeeeQbz5s0DQFk+q1evxrFjx9xisfh9nU63+rcgkEHiGMT\/t+iJXiQlJSVN8Xq9Y37KilCr1aitrcWp06dw6uQpNDQ0ekcMVzJHjEj2mS02xvETZ7oYDIYnWiJihrOY3m6ni3lr3mgBPyoCAGA0W+F0UZ6HLC6m31hsXXYEt6WX2bphNFlgNF57jjPSR4DNHthgCQQCDluX02A0kVFmS5doICIBAKNBD6vFjOVPPoHly5cDoAhk1apV3oaGhm6z2bzw17owg8QxiP963KgVUVZWhtraWmiaNdBoNH6z1RIWHx\/nj4iIQlVllcditnIA4Obcsa6hw4ZwAMDv95Nbd31FAEC0kOiYcHOWVBYXgyuaFnvliXp7V7dDAgARPB5uL7oN8bESnKo\/4zh3WW3o0JsUABAeHu665\/YpHH5UBMp+PIaLl9Qh1xEfH4PCKeNp4rBYuwEATGY4oiK5Idu63R6YLFYSgXB3a7tJMhCJuFzOgNthZ3z44SYEBdvdu3fj\/vvv9\/P5\/G9aW1vv\/1etj0HiGMR\/FW7EighGHk6dPoXTp2tx8sRJr9PlYnK5PO+QocmMnLybwwHqIaw9VWu4cvmqBABYLJY5NSONJ5GIuZGRkYiKpCwFv9\/v9PtcDL\/bydEbTI6xN4+3S2KkjNP19TYASFYmhg1JSlYEx3rh0iXD1wf2S6QxMY64WInZZTcnBK0RtaaFtjS8Hi8EQj4IIgoJ8bEAgP3lde0Op9sVG00whygTxK+9+IqTIATctW+8yN2z92CHWtMiBYCli+cCAFwuj0Gj00cajCSvr0ZCktbAzTeNZrz80ksQCoWwWCyYNWsWGhoatAaDYWYgEKjFDWKQOAbxvxI3YkUIhUJai2hobMDRo8e9Go2GyeFw\/EwmK2zylFvBYrNRe6qu3d5t9yXI4pkjRg6XRkZFAqCI4\/Kly+YAg8EzkyS302CktYmU4cMwdlQWzGYLaiprOi0WaywAjBgxwvD73z8iiYgIdT\/sdjscDgfEYjG9rFmr7Sj5R4nU4bAb\/vjkHxwCgcDPZLIIgMF75ZVXuVqtFgCQn5eHvLxsiKOFsNjRKhSJPQDgsNvDOOEM0YYN7ztbW1slADD5ttu0RcWFknvvuYdnMhk0ABAREUUwmUzuzi++dH++bYegq6srZGxGQ6f\/nbffCps0aRIAYPny5di0aZPb4XDk3Ch5DBLHIP7juFErora2FqdOnUBlVaWvWathhIUjTCgUeu+6ax6TzyfQ0tLmvnThspckyfDIqAhn1qhMAQBcvdKE7u5udHd1o7u7G8lDkjFkaDK6uu2ob2jEFbWGHpM0JgZZqlRIYykLoburG5cuXjZz2BzP3LlzY3sTAwBcvHgRBoMRUVGR4HK5EIvFEIvFcDgdxrIfy7oS4hO8WZlZQ\/te+7ChQ\/XR0SK\/VCqV9l1HkiRWrXq+ZffXX0d7PB4ei8VyLF26xH1zbo6gtr4eZxobQZIkHl60CMUFBSH7XlWrnefPXejasvWfkvaODnq5jbQGljz0IGPp0qUAgE8\/\/RSPPvroDZPHIHEM4n8MN2JFAFQyVEXFEZyuPY2mq01ei8XKFIqEvgceXBCu1Wk8LTqdxRfw+\/l8odRmd3bGSeO8c26\/QxQIBMIuXbno1xv0PIfTCa\/HAxtpw3eHf6DHIlfIkJOXAzabhW1f7YHH44E0JgYSkRB2W5epvbWd4fF4RBwO2zZn3hy+Uqm0SsQxgtP1dThdXw+73YGICB4W3bcAETweqqqq8d1330Gn09HnWLnyWSgUChiNRhiNRtTV1Xf4fD7nLbdMFKWnpxNVNTWoPXum\/dKVK64mjUapTEy0Hv\/xR0Fw\/+xRo52dnXouweebF9y\/IOzxZY8J9peW4okVK+hzEHw+3l27FsUFBTjb2Ihtu3Zhf2kp5s+ejRU9wmhlVXXHexs+kAYJxN7dHRg2NImxZfNmAMC6devwl7\/8xeV0OuN+qeYxSByD+LfgRq2IsrIyHDt+HI0Njf5OvZ4xpWBywO8PBL779ofwvse++565iImRoOrYcdfRk6c5weUT8vIMC++5VwIAh787bCmrOBLwer2i6GiRIWfsGInFbMGli5dtLbpWu8PhkKampnqKpxV6mUy2icthe8+fuxBZW1snAYDY2FjH8OHDTCkpqUyhUCA1mIxY\/eqrcPQkYQHAyGHDsWzpUlRXVWHHjp0hY5w8+TbMnTsXBw8eNH\/11W5RcLlKpcL+\/fvsLCYz4oGHHzYcKC2VAMCYUaO0jy1ZIp5eXBzq+wyAypoa+u9xubkAgDfWrUNlTQ3S09KQnpaGu2fPxrkL5yBLkIHgE\/B6vfadX3zpCbowLpcrcOvEcYwXX3wRALBw4UIcOnSooa2tLf0XfL2DxDGIX4cbjWgAVIp1MInqUOkhv9fnY9RUH\/WHhYW7RdEimzIpUTh02FB2jEQMvd6AC+cvdPh9fqfL7WZKpDGymBgJ5AkJcLncOHPuQieHxYqQJ8iipDGUW6FUKi3vbHjPxuWww0QiYbRCLuMBQIu21RzBi8Tw4cO6UlJSJEwmk\/dLr9PucOB0fR0MRhNShg+HWBwNSTTlrtjtduh0Omi1Wly+fMUcFyeNePLJJw1ymczv8bhBkmRYeXmFNys7K8zpdiuCD7uVJPHPz7fh2NGjIEkSALDu7behUMgBACvXrMHZxkZUHT0KuUyGU0eOoKW1BX\/f+C5aWltw7ORxAMAdM2bhtb+9CtJG4su9X+HLPV\/h\/MXzAIDfTZqMDW+9R1+H1+t1BDWQzo6OwB+eXMaYN28eLBYLMjMz\/Xa7faXBYHjl5+7HYJHbIH4xBrIiAPSzIrKzs1FbW8v+\/vvvoWlW48TJY363x+01Go1sp8sFTbPOr0pLC5s6tdifmZ0ZBgCqdFX4qfozvNP1Z3itp2thtduRN3YMYmIkcHnc0rIj1XC5XfAzw8HmcCFPADgcNvLHjon9\/rsyjaG90xwXF8fOysqUhoWFBQxWC8doNMUCQOHkye65s+5gAxBVVVWjqUktOnSoFGKxGHPnzkFvgbNZp8OFS5dQebQG2pYWPP+nPyNRLkcEj4dxObk4cuSI45OPS7rNZrNEJBIZHnvsUUl2djYOHz5s27\/\/AB+A6E9\/esaVka6SBY\/ZaTBgT+kh\/PmFNQCAeXfdhXfXrsWO7TvwwpoX6HPn5eVCICBCxhLc\/uFFiwAAL619Gd+WfUdv87tJk7HwngcAAPctuZ8mjJQRKbhz5h24c8YdId8hk8nkzZ83l+fz+Vwln\/yDs+bFlwM5OTmMpKQkfPbZZ2HFxcXPMxiM93\/OZRm0OAbRDzdiRQQthyZ1E06ePA6jyeAXS8Rh0SKhl8PlhExMTCbT0Hj+MiNJmSROGTky5JwbPv4UHA4bozIzMCw5GS6XCzESakYnbTYYzWZoda0dPr\/fGRUZQYzJyhINGzpcG8GLUBhMRhiNJgCAoucht9vt1iM1Nc6oqEhv\/s05MoASMLdv34GRI0cgOzsbI0aMAEBZE1\/v\/wan6+thNJmgkMkwcvhwJMTHo7a+Xutyu3nPPPGk5Msvv7IeOnRIAFAux9N\/fKqjsLCgn6jZF9t27cITK1ZAlZqKcbm5WLF8OQQEAZIkceDgIdjtdnR0tuPy1SvQNDcDAD76YCOUiUocKC3F2cZGAMDds2dDIZfj6IljIPh8pI5MRUPjWSjkChCEAOcvXsCW7Z+jWdsKrU6HhnPnoEpNxWebNkEhp6wYj8fjfOmV1\/zlFUdotgx43fjhh+8BAJMmTcKVK1fe0Wq1y3\/yNzJIHP+38Uu1iKSkJKjVahw+fBiNZ8+AExnhdTqdTLfX4\/f5\/WGBQAAcNss7bGiy3uVy+l0ut\/9UbV2Y0WhixMfHhxdOmSLl8SJwpUmNy01qkDYbACBGIsakcfloaWtHs64FjRcugLRRYcShyUmYWVSAw2XlhrPnzkt6j3vRffdhVGYW1m\/ahAuXL9HL83Ny8NB9CwAAx04ch1qjRkNjA6YVT8PNN40FAGi1WtTUHO04e\/asl8lkclatWilp1ungdDnR3W1HeVWltvH8eYnX5+MBwIP33ee+feo0dntbW4sySenPzMiQsFgsXl19PcqPlOPxR5dRx9XpsLGkBJU1NWg4dw4AsOLJJ7Fi+XJU1tTQJNA7CqJp1uDm\/FxYSRICgsCM6TOw6q\/PQpmoxMaSEqx64QX6uv6xaRMEvdLSV7+wCiWffIg\/PPk0Zt91N26dOpW+r73vR+\/9tvzzc1dHe4d\/yJDkzpEjR4bx+VE4UnFEnpqawsjOzkZZWRnuvPNOq8lk6tsfJPR3M0gc\/zdwI1ZEsMxbo9Ggo6PTb3fY0W2xhrU0N3njZHKfKjuTExEVhZpjx3CotBQAwOFwkJ2VhaKCAjidTnxYUtLFDA\/vLi4qkiYpqVYUV5rUaLhwETFiMWIlYhB8Pm1VfLzlnzRhABRpTMjNwZCkZMcPRyoNDefP+6Mio8LiYmLC4mJiZH6vD6NGj8JHmz+DtqUFI4cNhyQ6GmOzszF06FA8\/8LziJHEoqigANnZo5CWmqpputrEeXL5H4RGo5Gbn5eHW2+dZCMEBKfTZPLvP3SIPNPYGNv3vrFZLIfu4kVaCymvqMC7G9ajvKIcSqUSjz+6DAvuvQ8AMCwzE6TNBoLPR35uLqYWFODu2bMBALPuvhvFPZ8FfWpWyisqAAATJ0wIWX62sREHSktRXFCA9LS0ft+pTqeFVqdFXm4+rCSJTSUl9LqgSBq0NPqioaEBJZ98avhm3zfhpM0mmn\/3PLz55loAgFwu97a0tIz9qfDsIHH8f4gbiWjs3r0bjefOQdvcjAAYPolEHK5QKLwJCbIQN2Pf3q+tZ842klqtVuLz+Xnh4eGuR5c9zAGAhvMXcUWthsvlAgAU3DoJVqsVLe0dOF1\/Bi63G7k3jcHozAxwOOwBx6xrbUVTsw66ltZOk8XCdrvdwmkFhbY7Z8zgAwgJd8rlcuTn5yE7OxtisRiffbbZcPTo0Uiv18tTKOR4\/bXXTDk5N3u4XK60qrqaPkd+Xh4AQKvV4eDBg6iqroZCocCav62mt9myfbtjzSuvuC1WqwAA3nr1Vcd98+aFiKjvbPoAAgGBqMhIjL85D3GxoXxjJUnavQCuRT5I0oqGxgZ6eV5uPgCEWCNBBK2SYHj1bGMjdC0ttD4CAAdKS\/H5rl0gSZJ2gYLnr6qpoaMvLz73HIBrZHHoUCnXZDJFEXy+OVosJtVqtTJaJPSePXuGCVCJYV988cVPuiuD4uh\/Ma5nRYwcOdKRkpLC6x3N6NEimKSNRHlFOX4o+x7z5t8ViE+I97\/wt9fCMzIyASAY+gz5XVhJK46fOBXmcDr9UXx+p0goDBs9JlsBUA986Q9lAAAOm43C2ybhiloNXWsbYsRizCwugDwhod\/YrzSpAVCuCsHng8Pm4MTpWowcPjz2tom3aNJSUrpFQgEXAJ30NXnyZGRnZ4WImVqtFgG\/X\/LIIw+bCwsLDGNGj1YAiAaoByVdpQLRa4Z\/88238OZbb9OfFy9+iP77jvnzDZU1NRIAvDGjRmmX3H+\/gskM5+3ZtxfKRCWyMjMBAHUNZ1B34iQ62towKnsU9n5J1YtpdTrcv3QprS2My83FuNxcVNdU4e133kDN0WskJpPJUV1xAgCwsaQEBw8fBsHn01bJuNxc3L90KQ4ePkzvUzRlCi2SanU6PPDwwwCApQ8+iKU9yzeWlOBAjxWYnpZGb19VXQ2tVoe77rpTsvzJJ6FQyHHw4CHRylXP+QDA7fF4g997dnY2tm\/f\/rt+X1ovDFoc\/yUYyIoIDw8PHzVqFMaMGcMMEkQw\/fpsQwOamzXweD1eDofDrCiv9AYCYP5uym321LSUCJfLhZJPPgAAFPyu2Hr7zNkCAOju7up37vDwcBiMenezTssO6hOkrQujM9MhT0hAw\/mL4HLYiBVLoNPpkJqWErI\/abNB29IGAFCljICrp4q0r\/UhEkY7ZAnyfiHS2tpafPHFF5rOTn1I+72iokKUfPwR\/dnaE9IMugLBmTc4kxcXFIC0WtFwtgGqdFU\/UgnO0OlpaRAQBDTNGigTQ05Jo66+HlarFZmZmRAKqJwtrU6Hs42NyM\/NDXFHEofE0X+npaow5655mDN7HghC0O+49Q1nUdfYgGatFrOmToPFYg0ZU18Ex5wol9NuiZUkcaC0FPt7COTdtWvpfUmSxGefbTa\/t+H9MGuPVUWNK8X97beH2QB+kc4xaHH8L8MvsSKCtQYAUPZjGTo7O7Huvfe8V9VqJofL9TKYTGZ4WJj3iYcXMwEwXS4XLl++anDYnb4ofpQQoDSJ1BSV4dz5BgmPF+EHgIZzZ1yBQIDTb1AAqo+fZNecOEl\/5rDZUI2kohLCqEicazyP\/Xv2Iys7E6kALYLqWlvhcrkxNDkJozMzqH0HcFe4HC5GDB9p6e7u7kccI0aMgM\/n4wOUu5GUnOSYMHGCCeHhkpVr1nB6i5H5OTm0Kd9XLExPS0NxQQHy8\/JQ33AW7360CXsOHcCCOfOwbPFSjMvNRVV1NaqrrlkGIqEIJGmFVqcFQRBQpVH5UUHrQ9OsQX19PSZOmACCILC\/tBQbe7QGgiDw8KJFOFt7AQ2NDcjLzafJZWPJJ\/R4AGDvoQNY8ocnQdpIEHwCM4uKIE9IABHFx7Zdu\/DGunWwkiQazp1Dfk4OxuXmYmNJCa2pvLt2LRRyObQ6HW6\/+27oWlqoMfD5IHuEVwD43ZRCk06ni2axWI7Jt92mnTTplhiNRuP5avdufvCaJ02aBLPZ3J\/VemGQOP6DGMiKiIyM7GdFAIBareY1nmtE47lz\/ppjRxlisYTB4XADYeFhjLi4WLQaDExuVBTQ851Gi0QWABK9wYhOgxHieGmc3mDEj9VHcV9PgtGkSb+T3HxzviVlpErk9rhxPdIAgFiJGLk3jYHNSqKzrd2skMs8MWJxbM91gMvjuoaPGGZSqzVuvV7PyR2XG6dKGYERQ4cg4PXB7\/O3LH\/8yQA\/Kspnd9jDNpWUhO\/et89n6+pih4czpWUHDlhlCQnxTqezw+12u0+eOsX++3vrndEiEfH7hx\/h1FRXBSIjI1FZU4ONJSW8JU88Ies9vqIpUzB86FBwORx61i8uKIBWp0N6WhpSRo4EQRDQ6nQgCD72HjoIAUFgx8efQimnClqrqquRrlKBJK04VHoAhw4fwNJHH0BaqgoPPbgUhQVF0DRrUF5RgR8rylFeUYFmbTOW\/f4xTJwwASRJorKmhn5oVampAACCECAtLR2z7r4bVUePUsv4fFp7AIBMVToeX7wUE\/LyMTEvn16+cs0L2P7FF5DLZBiXm4t3165Feloa3li3Dg8vWoT0tLQQC4cgCMzvEWR7E1MQn5R8FK3V6pCfn8d7d\/17xJoXXgx4PB4+QFkavSeln8Kgq\/I\/gBuxIiwWC+rq6nDh4gWUlZX7nE5nuEQi8d01585wBoOB5mYdHA4XfWyRSIDoaCFqGxo1tq4urt3hYDPDw0VOpwv6Xh2m5Anx4HA4yLtpDB3JaO\/oQG1dHdLTVJbUlFSmrYuM6jt2NputYYYzwy5fuhK2e\/fX0T6fnwcAPB7PPG5cPmvYsCGODz\/8OCq4HAAkEolh9JhsSUVFpd1hd0QUFRWiuLioZc7s2TIAcLvdTtXYsdz0tDSMGTXKvOzhh8OEAsreN1ss1o0fbuKeOn2Kc\/uMmS2\/u20yRyqVSgDg8aefxvYvvqDHlp+Tg+KCAkwtLMT9S5bQVkfRlCn4bNMmWEkSK9esCdln6YMPYs6sWXjxlZdQXlFOh0E7dJQr9fY7a\/H2O2vp7XNz8pCXO67n73wkJMig0TTT6\/tGQq4HrU6HZ9esgdfjgTg6GkIiChw2G8pEJR2VIUkS27fvAEmSUKlUKCoq7HccnU4LeQ\/RBV0SrU6HZp2O1kZ6yBVVNTUgbTY6JBzE+x9sdL766msBj8fDAwCCzzdnZmbw77lnPnPWrFkAqMkgEAgwrnc9gxbHvwkMBmOSXC7\/oK8VceXKFdTXn8EPP\/wAtVrNO3nyJHbv\/tq\/\/r0NSE9XMQqLCxhsHhvK5CSkG002p9MZ2d3dzTrXeB45uWOhUqXA5XJDbzRA29KGhksXoTcYQNq6lDE9FZtejxd6oxEziwowNDmJHlNHRyda29oQHh6OaJEQcVIpUlNSHR6vN1yZmBTl9rjhcVP6Q2QkzSFKAIiTJsBqtXX4fL7OlJSRyuzsbJHRaERrWwsyMjMMbDaL39XdHe73+Ukej8tMSlYiKSkpIowRZvF4vLbGhkY2WUCCIAiw2WzuiYqKoPYgYjCu\/T5FQqHgzyuegVarg1anlW3ZshVyhQLz5s7BM8uX0+HNYKQCoB4gRY+PPy43l95Gq9PRpCGXyej958yfh73f7AMAzJg2nc7DCILPJ2CzUXpJzdFqWtRc9OASrF71AoRCEbbt2gWtToejJ0+CIAg6zBoMiwbdlR\/274dCLoff70ObrhkVRyqQqEhEVmYmJk6YgExKlIZWq8ODix5CY48es3jxQyHEcaj0AADQrpJWpwtxxfJzcmir44758+n98nNyQkK5j\/z+0a6DBw8xlUqlae6c2RG33jpJNHz4cF7RHXcwn\/rTn3yzZs0Kr62thUgksg7ws6YxaHH8xmAwGMKEhITPrFZr8YsvvsicNWtWyDs0hg0fEWCzOQMyOYfDwdJHKJWfJG34\/J\/b4Xa5weawMXHieKSmpWDPwVI6IhEEwY9C2siR0LW2hiyfNC6fti6OnzyN8xcuAgAyM1TIykiHWqPBPzZvRpw0TvPu238fWAXsA6qk\/ZT73LnzfoIgumbPuYPB5xNRb65922u32yMBgMfj2nLzc\/nlZRUOX08SFQC8+urL5P0LFhAr16zBpk8+oY\/ZO8R48OAhrH3zLfoBAqhU7C927aQtiMqaGpAkSVeFAlQ0YWNJCXQtLSD4fOzeto1+YMorKlB+pBwAMHH8RNpK6L182aPLaJEToLSLixcvICEhgX5YgzhQWopn16yhz5Xf40IICAJvrFuHjSUleHjRIixdtIh+mOvq61F\/htJCBhJcH1z0EA4dKoVcLseav60e0NroDStJYtuuXQAoEjUZjRAIBLT28kvg9ngcGz\/+2P33998XWK1WvzAiAhcbG8PKysqwYMGCC1qtNuV6+w5aHL8hJBLJX7hc7vNTpkzhrF69Gmq1Gp9++inKyspw4sQJr8PhYErjEhgxMRIUTy3U9N6XyWJymUymtEXXAplcBoLgo6Dwd9B3GkBarSBJambJu2kMYsRi9BYqR2Vm9AiPYwBQwmSnwUhnaIqEQpo0AMryQAaQpFTigQULwGZzfjJLMAij0YiIiAhMmDCBPX78eIjFYm6wL8Xbb7\/F0Wq1IG0khg8fzmez2BidPZrX2alHQ0OD2Wg0dus79WwARLNOh\/ycHACUH97bjNZqtRAICOTl5aKosBBFRUV00deB0lLagsjPyYFCLoeVJPH400\/TYUuCz6d9f02zBlOKi9CspVyLREUiZkybgbr6esyZPy9k+YJ774NQIIDFasXTf1oBTXMznfbdF8UFBTRhBcXOoAC5dNEi3D1nDiqrq7GppITWGbIyM5GVmYnyigq88PJLqD9TD41Ggw8\/2IRbJt6C22fNQtKwoYiIiMCRY0fxzy+\/oMko6HoEr\/H7b75BeloaIjhsvLthPZ5c\/jgyMzKw4N77Qojj\/MWLHZtKSogmjWbAYr7KmhoeAF4+Oa+VAAAgAElEQVTA74ezqytMTGlkKCsrA5PJPDnQPkEMEsdvhMxhcbuNRuPtt9xyC5quXgkkJyczBAKBOTIy8khra+uXAMriE+RJAH4AAIFQoHS5XGjRtUKna0GLrhUGgwEyWQLupKQA1FQdg8FgAADIZAkAxsLldkHX2gqCH4WhyUkYlpxE50k0nL+IHyur4OpxNwh+FGIl+TCbzfQ4IyMjQ7IJJTGxLl1bh+BE7WnXTdmjaHHUauvCt9U1HU0tLaK\/LF3MZrGY0GrteP\/9D6x2u10AACwWy71+\/btsAPjyy6+sR4\/WOC0Wq1QulxtWrVopuXr1arCkXMRms3lFRYVcAPhs06br3sclSxZjyZLF0Gp1qKquxo4dOzB37lwoFHLahycIAgKCwLZdu3D\/0qXQtbRAlZqKu2fPDsnMFAiEePyxx2C1WjFj2oxreRj19bj\/vvtgtZKIioxCVEQkunqyVoUCAT764Nr46urrsXnrFuzZtxc7P9+OrMxMnG1shLanAE0hl\/cTIG8tLqZdiKUPPkivr6uvR8G0IgAUWT3+2DJMnDARAoLApatXUHbkCLQ6HfJzc\/FMTz3L2cbGENdj3l13QSGXo66+Hp9t3YIF996HmdNn9CO4hnPnDA3nznkf\/\/3vO10uF3fvgQPSrZ9vtYujBXrS1h1rsdpoMmGEhUEsjcXUImpsX375pU+tVof2CeiDQVflN8KZ52SNNU2uVI3Riyw5G2nxrBbV31pC8n0TZIpJ6CGOx598FC6XCwa9gV4fERnlFIkEdFdavd4At8sFj9cLFpMJSUwMTtWfobcPIAAuhwOXyw0Ohw0OmwPSZgOHw4YiIYF2UwDKyuiy2ajuVNFi\/PlPfyZ5PB5hJUmsfvllQ1tbW9i9c+ZGx8XFISIysnXL7q8TbF3dmJyfZxyRpBSrVGkwmUyG9e9tcBw5UonEJGVsUnISJyudCrEuW\/a4y+PxcO65Z75j\/vy7zaq0tHC93iDV6qi2eFbSisiISCiVifSPXKvTYX9pKQ6UloIgCLy\/7m38UFmGnTu\/wOFvqNl17pw5WLNmdUi+RTCbMqMnrTo\/Nxc\/lv+IuffcTW8zY9p07Px8O\/15z769AKgwqjJRieeeX42PPvqYXr948UN0BqmmWYPNW7fgsy1b0Kxtxoxp07HyL8\/+YjcgmFvRqdcjNiYGAoKg3aa6+noolcoQt+jnoNXp0NLaijN19aiqrgZJkliyeDHtzlhJEv\/YutV84PDhrocXLeLOmj6dbrN+8PDhjtfXrZPaSLMjWzWin+XRbXdo2CyWoLNDT2xYvzEMAJKTkwFA9FMVsoPE8RvAuV65GsDzfZdzl2lCtIzexHH\/A\/dqBEKBssvWZTh27ETk5UtXeAAwanS2a+zNYzgARRzf7D0Al9uFoUOSMeGW8eBwKKPgSpMaew6WguBH9VSUJoHgU6F4vcFIz3jyhARcvnTZ8WNZOYKRD4IgcP4clfo8c+7c9prjx+MA4KvPPw8RHQdCRVWV865776XJTRYfbz20ezfpcDrD9uzbI9uzbx+yMjKx8q\/PAgCe\/tMKbPnnVgBUYtaHH2zCqOxRdIalXCbD\/NmzoUofiW1fbYfdQfX6zB2Tg5zsHEwYN55O4f6psVmsVtTX19OfgzpGXX09NM0aTJwwMeRhffPNtxC8F\/n5eVCpVABAEcbWLVAmJuKWCRORnZ0Ns8mM8iPlUGs0uP\/eBf0iKeUVFdA0a+joSFDnCH4HqtRU\/LB\/f8g+mmYNXnj5pRDrZs++vXh3A9U7Y+2rr9NEpdXqMGVKAZ2zUVRURJNpRWVl9\/xFi8LdbjdXlhBv3vzhRyJJtKil\/MiPnBffeEvS3qlHfKwEN2WlOdweG8\/t7oLP54ZImESf1+\/3e6wmG2vXrq+wevVqfPbZZ4euXr1adN2bjUHi+NVwrlcmAWi6zmoRd5mGZu0EmUIIwAwAqvQ0h8Vi5cXFSc0JsvgucXQ0X683CPU9FohcTrkfJGlDTGwMXE4n2BwOYmKoIlG9gQq19rYqXC43dK2tiJGIYTJRZeZxUimiRWIbP5JvAgBlkjJs7NixUQSfLwKo2ox333+\/Uxoby9n80UdxA2Un9kZlTQ3umD8fWRkZunE5OTFTJk\/mpKelIRAIQKPRhMzKwZn7wkVKX1EmJoLL5WLBvffB1tUNhVxOuxU\/VJZBb9AjRhKDm0eNhclkxv7SUlTW1KCqpgYrli\/Hw4sW9asDASidRK1W9wuxlu4\/9IusBJIkUVVV3U+QrKquwqebN6NJ3YRbekTNGdNnhBBQXX09hEJBiKsQbMCTnpaGcT35JL2xZ99ebN66BY8\/uiyEhObMnweL1YqZ0\/tHeqqqq9Gs1bZ3ORyu4oKCSFl8vAQAnluzCmfOngEDYeBxuNZLFy93jRg5RMaLCH2dgsFE\/QwjeFxE8K6ts9u6O9p1rbELHlzCWLhwYbDAbUogECj7qXs2SBy\/Es71yknosSIGwK3cZZqy3gsSZIoAAKSmpeB3U24DAJT\/eAR1tddmSz6fj2kzimEjbSj\/8QhsPTOXRCLB\/Hvn0tvpDUY0XLiAK01qEHw+ZhROwe49ezouXLwoBSiz\/P31G4yjs0eJAWpWLq+goghBk91itWLO\/HmoOFIRks9wPZxtbMTr69aF1FC8sGoVXROx+2sqzJmdlQkracGc+fMgFAroaEbfmX8g\/NSD17d+Qy6T4ett23C69jQ9W98yYQIW3HsffX3rN6yHWqOhBcnS\/YcQLYpGQwNldRECgi6AA6492Hu\/2Ycd\/9yGIUOG4kBpKZp7ksmC17pn3148\/adnaJF15V\/+ipV\/oSytYEo6gBD3DABOnjqlPXSoNOqHH8pEDQ0NOH3qRIdUKpW2trYa3np7XWRFRQXPaiWx+vnnzLdNnkTa7Q7unPsf4Guam+kinc6mJrS3t1ln3n57l8FgYjqdLikAhIWFOSbdmsfjRXDR1mlAc0sH2jsNEPCjoJBJER8rQQSPC7fL3WFs75Q67Q4YzFZ\/bf3ZsE8\/\/RSrVq36yWhKEIPE8SvxM8TxB+4yzbreCxJkijIAt8jkMtx51+0AgNrTdSBJGzgcDuTyBMjklDh6tOY4WnQtIAg+4hLiIRIKwCcIaFvbUHPiBEhbF2LEYsRIxLhlXD4y0lTODr3ePHTIEG90tJjn8XolAoKAyWiExWqBUCDsZ2ZrmjVY\/AhVLHX\/vffR5naT+irVEdzejdiYWCQnDQGAkOzHYNFV0IUI1lUIhRQxDOTPD1T\/ESwrrztTh6yMrAGTqi41fI8uUo845Vhcbe4EAIiEQljMZijkCjryQpIkzjY0oLqqGnn5eUhLS8PmrZthtVoxcfxEsNlM8Pl8OsTau2JVIVcgik9g\/Yb1EAgEYIQxUbJlCwCqFgRASC8NqTweVpJEZkYGZk6fQYd06+rrkTOeIqJERSLWvvY6phYVO7797pD7qaf+zLVYLBwA4PG4hgSZlFVUVCC4cuUyKsprNAAQGRkRFhcfK4mLj+WxWFT8wu5wUv+67bBaSCiVMng8XtRUnaLvkTQupkOlGiENWhunzpyHJFoISbQwxMowdRqcVqOZCwBuj8f\/2JN\/DCssLERiYqLfZrNN\/jlrAxgkjl8N53ol7X4MgHe4yzQhpckJMsWnAB7onbPR3d3dYbN1uTs6Ov0AkK5Ki0oekiy2dzuwffsOg0bd7Ovu7pYCwKjRWR3jJ4yTulxulFfXGNTNzb6ubrv0peefb5l7552yTSUl+HzXrpBahcv19SBJKz7+5EPs2LUNLS068PkEGuooF2LxI0uhaW6GUCDA2tdev25hVxBBV8BKWlHX0AAhQSBTdS3XQdOsQV19PWZOn0HP+HX19bQbUfrNQUycMAFTphah4ghFGpkZGVAmKkNEyD379qK8ogJD5SyMzhiKxGE3g82VYN78B0LyPP62+nksWbIYDQ0NuOuuObQW8Mc\/PoX8cbmoqalC9dEqVNdUwWYjkZuThx2ff0U3wpHJ5CgsKMbiB5dCLlf0q\/cIZl5qdTr8WFnpMJlMzttuuUXUO7GqSaPR8Lhcblyf1xyQJGk5XXuasfeb3QKr1QyH3Qm7w4EIHg+8CC4MJgtYLCYE\/GtJu22dBhhMFpC2bohFAqQMS4LH48XJ4\/UwGqmfmlwRj6zsNPp4BMFHR7seTBYTYrEIHe16GI3U+aLFQowYSRG\/oa3TYbNYaZHUx2Dih7IfsXz5cmzdurVOr9dn\/+SX34PBcOyvBHeZxuJcr9SgJ8OyDwb6EtQA4HK58O47G\/D88891BHwM9uFD30mLiopAEASmT59mG9nT1m7m9Bk+s9mCsPCwTr3RGAtAGhcbo208fwHyxCS\/w+EI43I4ncrERNnjTz8NkiQxtaCAVvLze6yB1S+swq4vdoDPJ1AwpQhz7pr3i64vGHrsXQ9RXl1JF2TdN2cunn1qRYgbpExUYub0GQCAvfv24scei2LBvQswc\/oM2qI4vP\/gdc9rsVohFAix8q\/PhlgsWq0O6SoVBAICKpUKKSkjMWE8dTyFQoGSTz5Gk1qDpOQkAEBNTRUOHT6AvNxxKJxSjLzcfDplGwA+\/OATFBYU9zv\/uNxcus7l7jlzcP\/SpR0HDx+WslksTBw\/vmvMqFEigMrS7ImiKNlsVtf982a7bp9+u3Hz5q3cb7\/9LpokSSEAxMXHmsbclBEdYABunw\/uri5YurogiRaCxaQew+aWdpw9fwUerxcApUcMUVLWp8PhgNFoBpPFhEIRj+EjKCJgspgg27tQd5oi0oyMFHz\/XSW8HuoYPB4XckU8AMrS6E0a7Z2GwJHqo4yysjJs3LjR5XQ6Z133C+mDQYvjN4DzvaRvEAhMBQAGk6kBg8FkcDheMJlO9n11If5igkwxC8BXwc+tLVqQNps5JSWNbqGvUMix9o3XrRMmTBCcbWzE408\/TddhAFQCkEIu71eHEYyKBBu8BGsV\/rFxI4oLCuh8hL3f7ENmRgaOVV5rsx90F4L+eLAkfaAuUpt3bkezVos7pk6D2WINKekOCqJ19fUQCARY+9ob9INvsVqxeSv1Lo8F9y6AUCCARqdFfcNZ1Ddca3Dz7FNPX\/deV1VX48MPP0J1VTVImw2FhQUoKirCvLlzAITWswQ7gwfPu2ffPjrl+2LDtfup1elQ2dP4JpgrAlCW1d\/ff9+68eOP2W6Ph6dMTLR+u3evIEigf3\/vbXy5Z6\/Z5fa4FQlSaW+roTeCVoFYTH\/FIEkb2tv0AIDkIYlgsZho6zTASnaBxWJCEi2EgB8Fg8kCSXT\/\/DyrrQsCfhTa2\/VgsZhwOd3gcNkIujYejxcEwac\/d9u6TJ26tujg\/nqjCf\/Y8jmSkpKgUCh8UVFRT7S1tW247o3vg0GL4zdAeGzsJQabLhUPsTy8X48XMm8\/0jseru693uPxOCJ4PPa3hw9dMJlMURcuXhJazObI8+cvCCZMmACtTgcBQaBoyhSM62lHp5DL6eKmYIl1sL3cgdJSusGLXCajyshzc+n6DCp7cjqtZQDAi6+8hBdfeRnAtfwHAUH0iwYEMUqVgbffeRcXzl\/EuNxc2v+vq69HwdRCzJg+g05MCi5\/d8N6bPnnVggIAo8\/RmkBhXPuQEXNtRL2jDQVli1eSn8OkoqFJDGzsAgCQoAd26m8pL+t+RuKiwpD8jsAYGpBAU1kwZqVJY8s7VebotXp8HrPu0iCqePFBQVgMpl44bXXrAcPH+66dOWKDABt7miamwWqm25yZKan2x5b+hD7zJk6oVQsEtntTji6HXB0U+TAYjHh8XjR2HAR7e16RPC4EEtEIAgqXF5X24iOdj09ZkLAh1hyjVQMJiu0LR2w2rpojQKgdI7mlnZoWzvg8XiROyodpNUGnbYNDgf10umgC9MbfUnDbncEHnviD4ykpCRMnDjRRxDE\/paWll9MGsCgxfGbwPv1+OUA3r7O6lsL1kfVgnJbkgAknW9soHM+yn\/8oWXYsGGy5cufwo6d15L1eickAaC7OvV+mPs2xw3qGcGsy+qqamh1WqhUKqz522ranag\/Q0VwgmKexWrF4cOH8dnWLZg7e3YIqQTR2t6ChLiQSvaQ0GjvJKe+CFozQGg16ead26lmOKp0ZKlUEBACOprycwheo67nvat5+XnIz8ujk8PInsK3Z5Yvp\/tUVNbU0P8\/vGgRCIKAXq9Ha3s7uru7UVlTg+KCAozLpZoHG00m9++XL\/d7PB4uAISFMRyxEjGZkTJUGsHjor1dDwHBR9\/QJ0BZGVbSRhNJECRpQ+NZqrkyL4JyI8RiETxeL66or70FTkBEQcCPokVNg8mCC1c0YDKZkAgJkBYSrbp2enu5Ih4jRgzpN5aBSGPhkkcYS5cuxcKFC7Fnzx61yWRK\/tkb3geDFsdvg+s2df2wknMAQMi3yeFy4XJSM8R33\/\/AHDZsGIqKCqFQyEEQBLKysxARGUlvX1lTQ2sMdfX1tHj47Jo1dMu5oilTMH\/27H6t8QoLCzBv7hzs2bcXSx5ZSnfJ6l2fIRQIsKnkI1QcqcDIESOw4F5q3+O1x\/F95Xc4XnsMKcNS8OKfXqbH88a6dXR0RZWaSteHAKFhX+Ba6FfTrKEzOJWJSiyYQ+ksZxsb8ca6d7Bt1y7k5+bSKelBkbXvce6aPQfV1dfcrLy8XMydOxdnGxtDX4\/Y01EcfSpJ5TIZbbW98c47Id9XcUEBBATfsPbt16MOfl8e8PsDPB6XYxg5VBmZEBfDY\/V6iVNcXAw8Hi+armppMVIaF4ObxlLfT0e7Ho1nL9LWwPARyRgxcgikcTHQaVth1Jqh01Lh76zsNFoE7WjXo0XTinqjGV6PF7n5oyERiyCJFqKx4SLOn6VEbR6Pi+QhiRBLRGi62owTx+tAkl201TGQe\/LYE3+gSeObb77Rms3mUfgXMGhx\/Iu4bUpR0ILIThT5iz66154z0HaHzzPxxrehs4BO24yuYFahSoUNf38b3XY79h7+1vqPrVv9pM0mYrNYjoYTJ3gCgsCLr7xEpz8HcfRINZKTlNi5azuqj1aBJKlQaJw0HnfPWwB1k5oWCNNVKjSp1dj7zV5wuFzYHS66b2ewgnPz1i3QNGuw8i\/P9giTArS2t4DssiFlWGhYf1hmJu0KBF2nIAbq2B0kgN59O4MI9sjsWxJfXlFx3WrPDz\/8CCRJotvhACeCh7CwMOT39PcEKGILDw+Hz+ejLaEDpaWwkiTd\/bv3uYPLigsKUF1dYf3iq52CYPhTQETB4\/HC7nCiXW\/sCPgDTolYqIyPpRLxThyvp6MZcXEx9KxfU3WKjoCIxSLIFfG0SHno4I+0eCmNi0FcXAzkinjotG1oaLhIrwOA5CEKDB8xBCwWk7ZWosVC8PmRYHPYiODx8P13lfT2PB4XWaPSwGWzQkjDYDIH1r27gTFp0iSaNAwGQ+YvfVdsXwwSxy\/AbVOKJoFyNYJkcUvfbUqX9e\/VCQD1LeF4+qvQEgGDvhMG\/TUfd8l984yK5GTn1Xa9FwB+PHKEefNNN3FW\/\/WvErVajYKphbSlMGH8BDqzsLqGIgyCEEAhV9DRgr51GMGy9AOlpXj86adDZt6vt22DQi6HxWrF3n178e6G9dj5+fafDckGXYKgAAtQoq1cJuuJpJRD09yMxx99jNY6gGt9QIFQt6u8ogIWK\/Ub7r09cK0CNbj9QILx0gcfxIrly3G9cPT2HTvx5ptvQafT9RNUAaqm49k1a6T2blt7waT8uMgooavDYLJaSZvA5\/NzmnU6urAtLCzMNWPKBA4AtHd0orHxgtFksXodDoc0NjaWXLLoAYLHpSaLJnWz9fSpWvrhDA8PE6akDhO0t+thMppBWqnfTe8warRYSJFVtwOMMAZUqhHgRXB7rJtmNDVp+xGP3e4AIeAjLi4mJE\/D7\/f7uhxuxqaPPg5LSkrCwoULUVlZ+atIAxh0VUJw25QiIShymIRrRPGL+lRcNYRhiMTfb3mmzNdvWUREJIBrxLHyxVciWCyWGACsVqt16cKFluMnTqCmuqajsLBAGszmDHaq1mm10Gp1dHv93tA0a0IKoHpnRCrkctq3j4rkYYhSCZK0AJBj797dOHbiOO6YOR1dXbZ+x+0NrU4X4hLIZTI8vGgR+FGRGKlKCSG5IAEFZ\/ze1aS9XZqBMkqDoeC+Faivr1sXQhr5OTlYsXw57XrIZTIUTZmCqb3K3wFg3bq3Qu5HEOcvXuzQtbY6i6dM6fR7naI7Zt7eNfamnCgA\/d6zsuOLHZ79B\/bQVcQnT9db0lXp4jECIRYtfFB726RbJexrQjkWPbRYoG7SCrhcTkdMrDhckRgvaLqqRWPDtTYHPB4XaekjEBcXA7FEiBPH6mn3pnckpq+oKhaLMGJkMi26+n1+a5tGJ3DaHVwA6LY7AkOGjwx\/b8P7sFgsmDhxoq+tre2swWCY9GtIA\/g\/bHHcNqUoCUD20KFDH2EwGOlcLlfa2trKDNZ43CjW3uEYkCQA4PfbInDFEEZ\/9ng8uHLp2g+ntUUbsv2ihxZjzOjR1qVLl7BZLBYvmNhECATIz8tDUVEh8vPzQBBEyEwNhD6AvTWCrMxMiIRCvPXOWuzctZ3ucDX7rrl46MGlKJ5+rRt+MEHqp3C2sRHffX8YZrORzu+Yc9c8XO1pMtQ3zRoAXXcCUMVlfd2c4DZB9yL4QqLKmhr6PaovPfccigsKcLaxEVaSBDOcCZ\/XMyAhDISBupP37obeu5tX33Fpe6yO3hGbgWCxWjpMJqO78Vwjr+STj+g30LFYTBAEn7YcfD4\/mMxwBAIBiCUiiMUiOnRL3SMqnNrerqf1lGBflt6EAgBOu8PQoWuV+H3U5NXeaQisWr2GMW\/ePOzevRsLFizwSSSS7U1NTff+ohv1M\/iPWxy1dWcmZWdllP07z9GjR\/T9JwCA2F4v04mJicG\/Shx1LeHXJQ4p4Q8hDhaLBRaLBY\/HAwBIkFEuxrRpU+2PPPKwseTjjxToFQZUqVQ4fLiUTqumz1lfH\/IAANdeERDUCHqb\/U+teAK7vtiB3Jw8yOUKzLnrbtpqefP1d6DrIbC+yWE1R39AZCQ1q2Wk3wQAWPLw\/WhpuRYFkMnkyM3Jx8QJE\/DuhvWYM38u1bGrp36jb41J8L0j1l69LQAgPzcXZxsbMXr8eNrd6L0Pi8nChx9+hIOHDtECKcHno+STj2ny+PjTD3FV3YSoyEjMmDoT6aoMaJo1mDN\/HjQaDfWaRSWVWNa3khWg0suD5NS3Lid4vt7EYbFaOv75+WdSg9EALaVDSQGgseEitNq2EM0iTTUCLBYzJIQqFosQF09VwvMiuOBFcEGStpBMUIAinlOXqIhMJoZBKo6G3+e3duhaBU67QwJQVoZEGs848vU3DKFQiOXLl2PTpk3u2NjYRU1NTVvxG+E\/bnHU1p3Jzs7KuG5U4kYxAEn00yN6IzMzE5E9EQyXy4VTp0791ObXxZ1ZHjwywTXgus3H2Nh8LPSVAL0F0nvume9YtfJZt6CnYe\/nn28zlHzyqWTW7TOtjz32aIj93lvXCLbbDyYvBVvqXa6vp3tdBJcBoFvoB9HQeBY6nZbOnHx3w3q6MKtvK72+qK6pAgA0Np7F5auXMWzIsOu+KwQA3VAXAN2bs3eZfDC0fLaxEQWTJyMrI4NexwwPR31tHbbv2BmSai6Xy7Fk8UPIzMqEz0eR9rBhQ\/F92XcwW6zo6qYezOKCAvCjIlFeURFS3Rqs9A2ib+3NgV6vOgBAF931zqLV6ztN69\/\/u1er1Th8fn9Yu96oSIiVWAIBCJuuNsNktIAQRIHJZCIuPgYEwYdO2wa73QEWi4W4uJh+IVSPxwuvxztgmDeIQCBgJ00Wj8VoEvh9fvj9fr\/RTDLeWf8eY9KkSSgrK8MTTzzh0+v159vb26cHAgH1dQ\/2L+A\/Thy\/Br9EtPw5qPq8lOf48ePwer0\/scfAyJL58MYdjgHX\/ZxAumvnDnNCQjx55erVsKarTYrkIcnaybfdRudFk6SVflDzcvPph7PvDzsYlbCSJG6bNo1eHnwgMtJS6eMAVOPb3unXvWtHLpxt\/EmBlCSteGrFkyg9fC1tPDUlFQvmzsHp+nq89xGVITo+72bcNb0A7Xojjp+5hBM9VcAEn4\/q775Dl82MEydP4rFn\/nptXD39K0iSxNo33woRegk+H5MnT4bZYsbly1eg6yGjtLQ0fFLyMZpbdHj86adDrJVg1\/MggjkuVpJEYXEROvV6dOr1tKbS+3WKA8Fut5utpJVs1jZz\/75hndRkMuPiVa3W1mVXAMDthQP\/DLu6uxHVK8wOUGnmbZ1GtHcaMHXyOLCYTFhtXWjrMKC90wirrQuj0kciUXbtpU52W3eHsUMv9fZYrC3tnYFFi5cyVqxYAYvFgtWrV2PTpk3uiIiI1QaD4ZXrXsivwH8NcfQhiWwAWb\/FcRUKBeS9Z+GGBnqGvhFEcQL4ckn3gOu63QzcsSn0B2Pv7kazRt0zBjmWP\/mkYdr0aeEEny8KNp8BruUukKQVb72zFodKD9AuwoF930IhV2D1C6ug02lRc7QauTl5+ONTf4bXR32vwdBjVa9ckJ9CeUUFurq7oEpL+0nieG\/969h3gCKN8PBwCAg+bsrOApfDhslswbmLV5CUKIcsnqr5OnPhKlweyv92u5xIG66EsEfUkyYk4Yq2gx5vUNA8ePAQPvyIelNbfl4eXf6u1epCluf1NOIJPvgr16wBabPRHb5XLF+OhoYGvPnmW6iuroFcLkdRUSGWLF6M\/YdL6TfCBxFMVQeAZq2m4\/Mdn\/NtXbaIYMVwX3h9Ply43NzK43LDU4YpQ1LPu7q70dGhB5vNQmRkJKJFVBaowWTBFU0LvF4vxCIBEmVxdLJXMPUcQGjmaFe31mo0K5x2aoLSG82B4ukzGH\/+818gFAqxbt06rFq1ykcQRE1ra+t9v7WV0Rv\/ceKorTuzEDxS6cQAACAASURBVJS1sC47K8MC\/PtIYiDExMRg2LBh9GedTgetVvsTe1wfXy3tRiR74Pu54LMIdJBhIcvO95Rz7\/l6t\/+mm8aEAVSkwWq19HtoPy7ZhL+9+Bz4fAJ5ufkonFKMObPnQafT4qkVTwCgXvwTXA5cyzYFQkOfNceO0NunpVxzCcorKuiemL17SwyELZ9uQNWJ0zhQVoXubju9fPrkCRiblQoLaUN757X3uiQpqMZEl9Q6mkCGJMrw4MLFSJAlYvuOnTh48CAaGhpBWq344oudUKlU0Gp1ePPNt0Kyao\/WVIMQEPSLlYOZs\/k5Odi9bRsAyqo4ePAQ3XOjd6SpN3oLtgBFXKrUlDar1eK9cvVy+Bdf7Qz4fD6xx+fj+nw+mK02CPiR\/Y7jcnsc9Q2XnR6vV8ThsJ1Fk\/Ku72f0QKdtQ3u7no6UpKlGIHmIImQbr8drsJkt4aTFKgq6JG2dBsbtd9xJE8ann36KlStXel0uV5vBYLj\/l5TF\/1r8x4nj8207\/5CamvLWt99+d3j\/wYOx+DeSxEAgCIJuGwcAer0ely9f\/peO9VORldX7uai6GqpFN129ApfTCYIgMG3aVOerr7wc+H\/tfXl0U4eZ709X+75YsmwtWLZsFtvYAmwIJoBDCJCU18A0Szunaehp6HQ609OQTpu+NJMwM21n3nl5nUxn2vQNISVd0jahKSS0jyV1REIMYYnlgDds2TK2ZEmWte\/r++PqXku2IdhASFv9zuEcuJLulYz1u9\/3+37f97HZbDqnoTatU6JfoXUbQJFBirJ\/d545c03Vn6oKzAV\/IIB9L70Il9uNL35hF72JbC4kEnHol04\/LhQKsKpxGda1LIdtzAGZVIwKVVnRa35zpAO9l8mfLeUhQQ74zAMP0ikHQPpOnv930v1Kjcxbu\/YONDQ04OGHHkRDQ8OsSWCFu1X37XsRz+79J\/oxiVhME1EhYrGYLxDwR493dDD\/ePKdCsovolTIPOtam5WFz02l02NX7E6e1TaeZDKZ0ip9haiQQNKZDGxXJrwatYpfpassyktTqTRtBqMs6u+efB\/BfFRRaAIDgGw26wv5AkTQF5BS6UgkGstlcozcY1\/+G+LLXyb7eQ4cOIBnnnkmGw6HQ1wu96n5NKndKD5W4th0zzZTJBzenE6n72AymbUisbhZoZDj6aeewrHjJ3Cs4A75cWJtQSnvRgTSv12fwM7m1JyPzSWQupxO+LzkXflzn\/ts8v889785Y2Pj9F2SKrkC0w1k1OCYpuVN+MenvgOZTF60HkCn1dIlSwBF4ihAVi1yuRxt0nrn3XeLOkVrm5oQDIWKwvUDv3kFXZemhyQvr6kCIxlFMBRC39AVePxB+AJBVGkrUKVRoUJVhq6eIQyOjoMgCJTJJHhg+xbYXR5M+qJoWLYMTju5A4bD4SCZn8ru8\/tBEAR6enogkUjw05emtQ1qvN+p994b7enp4X7jiT3iO++8c\/atH2S6uW8f+dq1bWuxadNd8Xg8Pjk+PkpMOB2C4WGrfGz8CqJRMlJ66533A5FYXMrjclxqlYLZsMSopFrdE8mkNxSJKAq\/J4FQBNFoDJXqIm7Bpf7hQDAUkTKZRGr75vVs6vjUlG9W+ZTCkHUkFggEg8sb69UcDvkSv8cL3+RUXvAMMBqbmhnf\/NaTMJlM8Pv9OHDgAJ577rl0MBgMCIXCZz5OwqBwy8qxlE8C04aqjQCQzeUw4SCFK2PdYni9JBPXGo04dqvezEcgkUjQQ4C5XC5YLNaCBNKZqUghmrUZ\/HzGMR5vOprt6upib9h4V3LlihWcbdu2Ytu2rUilUjEAfIDUOlzjE3jjyJt0k1r3hx+CzSHf9ze\/\/nWsX7cOttHpdS1Uw1ihrtH94Yf47r9+D9Q5Z862pETB5uXL6YE9d66ern7kclkouEyMjYfxwwOvFqUpfB4PaoUE\/mAIl0eugJn\/8k16\/eByeWAzgAMvvlR0vfr6evzDN57A44\/voUuiErEYu3c\/BoBsZnvm2WddHR1vS\/IrC6vq6+s9VVUGIQB0nj7tefbZf1L29PRg27at+Nfvf9dbt7hOsHb9Ov8fjh+vePp730XgyW\/xWk31ZRq1SoA5sHnDGqoUpAaAVDpNt62HIhGh0z0VC0eikUAoystkMgSfxw1WqsskAIrOV71IIx1zuCebltWqCo9fjTQ+sFwM9PT2SwkGAxXq8ik+h8ONR6LC8XEHQ19lwAMPPkzs2LEDMpkMFosFu3btwsGDB9NisXjA6XT+\/ceRklwNN4U45nBctqPAh1AIqkcCIAVCqUwGq3U4vzfk9qCQOADyPS5EIC30asyEUTXbVVrYyNbfP8AAwBkaGsKrr70GPp8PPp\/Hf\/LJb4Ue+fznxQCKVhcCpDOTGobzq4MH6Yatb37963SbPQAEQyHf4NBQWCgUcpqbmtS\/fPnn8W8\/80zuh\/\/9Ir\/jVCd279rle3DnTh6LxeKPjY\/TW9aoyVe11TWora6hrxsKBvD2OydRrlRiUZMagWAImYLAVSYRY+v6VgxaxzDp8YHN5WLYOgiJVEanHDwuFwKhEA888BkE\/H7s3v0YmTY2NtCpWTQaCezb\/4J0wjnOffjhh6LNTU3Ehg0buHq9ThmNRn37f\/piZv\/+l2IARg3VekxOTVQ9\/ey3FQAQCIUrUqk0GpdUQyoRgc1i0b94E25P0QAdgBQrqQE6bBaLFiTT6awvFk8wlGVytdGgQyQaRyKRFARC4dFwJMbSV6rlBJMhAAChgIeGxQYVQTBi2VwuQzAYcw\/oyIPNZGartZqsVCjiXBmy8ZY3mxiPfOVLaG9vh0wmoxd6Pffcc+mpqamMVCp9JRKJ\/HM4HLZd67wfBxZMHHkBcwdIkrhuXYLJZNJ\/j8fjkAKwO+wwGmvA5\/MRi81d0ryViEQiRSVZoVB404lDyMlBLckWRSWFRjCtVgO7fXqFYywWQywWw8sv\/1y8csUKNDQ04On\/+R06QigcuHOptxfL8x6D+7ZsAZfLsZ989yTr\/Add6n\/\/8QuBZDIpl4rF0foldZKN69fjwgddGBwZmdBWVrDFAp6y8\/QpeTIRiz76+S9AKpGgbc0aSArmcbzw05fxi1cPIpyvKHzlr3dAU16Gx3d\/AU99\/weIRKejjsaG5WDzFfjPf\/sxdDod9Hod2tauxd2b70JT8wqIZFrs2\/ci7cfo7u7GT1\/aX6Q\/pFKp2Kn33okdeuO3img0Cv2iStmEezR2+XAv97XDv6aeJgcAtVYV4LI5UrGoOGsprGwEQmFEY3FUlivpGReFpAGQ1QtquA6bzaaJo0JVVpFMphK2McdY78CIMpfL8QGAIAj1qqalWbWqTDBZYBpks9kxPo8XJBiMohGCAJBOZzJ+fyAXCUdYqWQqo6nQyj+z40Hcc889MJnIYXGHDh3C3r17cfDgwfTU1FTGYDB02u32H+ZyuUNX+926HZg3ceRTkOcB3L\/Qi1Jt5dEo+Ytoz+881Wo0GLJaF3raBSORKDZuFUYf80E4wYArxIBaPLduZFRmZ6UzXB4PqVQKMpkcS5YsjXV0dBQJa729vdi3bz+ef\/4HUCgUcDjJGQy9\/QMgCCb0Oh2++fjjiMVigQ7z29mf\/eJncq\/PSw\/O2PmpbVKXexJO96S2f8iKSCyG5oZ63unzF8rCkYjUPuFE7+Uh\/OB\/PUcAxdWX9\/ITwDQVarSuMCEUDuOu9Xfi\/nu3QpxfF7jI2EALsvfmRxYCwGOP\/c2sz9\/T04M9e54AQKYoDz\/0IB5+eHpq+x87OsZ++ctX9EePHuPf0baST4X46UwG4UiEIRYKweVwEIpEvIlkUpHOZGC5NChgMZkBLofNLFcqRNQQHaqM6fH6IeDzQHWzzjWlKxaN43TnBbpJTF1RlGlAKhFxQW5v57NZLJ9BX0nU1SySUuTD43LBZrHsXA5H+cGFixnnxKR6yVJjOpfLsNgsdkanW8TU6xZh06ZNTJlMRpEEEyDXLR46dAhf+9rX0qdOnWKp1WoHgGMul+tntzMV+SjMSxzddM+2vQAex1XSkKtBq9FAoVBAk19VePjQ72Cz2QAAS+sbUGs04qt\/+5XbJpDOrKwEg0FaoJwvrlVZmUsg9Xqn4HY6odfr8P6Z03TLOECa0xxOJ3Q6bXTL5s2CwoqI0+VyOd3uSE9vD9fldGgp8k2mUvD5\/BAKhRizO9DdQ97ZFTIZ5DIpli2ug0gogNM1GY8mkrxVK1b4HtixI7l08WI1gKIJYoXlzUIUvo+Zo\/wAslw60x5fiGAo5BscHAx3W7qzkWiEnUiGNRaLBR6PNxYMht0Siahcv0hDE2gwHPZms9mIWCTSp9PpaDAcZgDgczkcl1AgUCcSSVhHx+F0T0GvUcNo0NERBRVtAKAH41At89SQ4FTeEl44cGcuBEJh9A2OjE1O+ZTZbI4vEQkDd61rkQLAxIQLoUAoc+WKgykRi7Fnzx7s2rWr6PU2mw0WiwVmsxknTpxI9vb2ctRqtYPP55vzKxfNN9p89nFhvhHHrG1lc0GhkKOxoRHLGxthNNbMenx42EoTRzQSoaMMhWJuEelWI1oQagOgLegLwbV6VuYSSMlOWVIEPHbsuHv37sfKAeDg66\/H9n7\/e8lgMChtbmqa2rJ5s0Cv0+GHP\/lJ8D9feEESCAbVALCx7Y7oIp0W3T29sI6M0mmDXqtB+7q1UClk6B8YwKTHg8H+Hpw904m\/\/+pX0dTckJnyTTlPvvdW4uR7b0GlLHe+sv8XFfdu2QL3SPF+KapMKZFI6MlalNvggQfIiEEiFmPr1i3Yvfsx6PU6JFOp2LYdO\/hUybRMLnXeudpUcfLtM\/ZwOKJFPtXQL9J4mpqXgS\/gIU8Ws1xnAj5fkUylGP5AIAwgJ+Dxsjwej88kCHUgFMbZrh7oNWq0t60qSkGo1ZlUtAGQX35zJ7lPWacpR3vbKoRC0ZmXnIVoLI53Tn+QzuZyegaQTkSjUFSWi9NJYOOGdrS3t8NgMDALX2M2m2E2m2GxWHDu3Lmkw+Hg6HS6AQBHx8fHDwGwOJ3OPwmimImbWlVRKOTYumULWltarvm85qYmvPnGGwCAeCIOgVAIh8MBhVxxzdfdKqTTaWQyGVp\/YTKZC66szFcgLays7Nv3Ynnd4lrHSwdexuuHD2sIgoBcLnN+attW1qu\/fS02ODjI7xsYkKxZSebDbA4bCplMAAA+fwCivDNRr9VAr9XA7nDg0OHD9Pmrq6vR3NSEK\/YreOP4m0IAQgAoV5W7VjavoN9Ih\/ntwOkzp6XfePwJH4\/Hk+sLhhHPhMM+hv7+AVdnZ2dcLBGzylUqYnjEmn7l17\/US4VsrGsl5S+lQlYBAKvXmLSDl0c8kUiUyyAY4mgkpqS6P6+GTCYTBQAGgynyBYJYpBWDSZA\/Z6lYhDUrGjFqn8DZrh54vH5UlCuxZkUD2CwW0sk0xq44Ys4JtyeRSIqXNdTJ1rU2Y01rPdgsFtzuq222IOF2TWbdbg8hk8qyd7W1sda0tMBkMrFMJhNkMhn9n02lHBRJUNGEQCC4ODIy8msAllwud9N6sm43bhpxtLa2YOf99xd9Ea6GtrbpORLUCD2vz4fGGQadjxMzBdJbUVmZSyAlryVENBpB5+nT+NFPfqwJ+AOoVJdjatLDH7ls5X\/rm99GdY0Bd7StgVAohM9P3qSSqRREQiFc7kkkk6R\/JJlMwToyCuvIKNpWt2DH\/feDIAikM1k43ZPw+PyoX1KHNr4Ayxubp5qXN0dtV65k8xvvpel0OvH7\/\/d7KQB0X\/wws6Z19Ud+5hf375e88sqv1AAdQVQCQCSegdsbQjqdwQd9dqw1GZHLpDDhdCvTqTQ9NUsqESOdzsA96YV7khQaTU1L6PPHE0nBpX6rwOP10xEEFVlMuD042zWdVgr4PFTrKvFhd59n0j2ViccTaj6fF6msLOc0Ll8qoxrHrNZpIRoAPB5v2uf1sbhcXloilrKWLlmKVataYDAYiLwmUUQSBw4cKCIJjUbj4nK5lmAweHJqaur0J1mfuBmYL3GcxByNZK2tLfjcw9e3p4MCFfbG88RhtzvQ2NAArUZDi6UfJ25WZcUVJBBJMq5qPZ9LIBUIBbRQDAAn336X7okoV6tQXVONGmM1eDweQpEI9FoNvH4\/HE6XL5FI8BQKOZ\/DYdPkoS5XwmgwYMzugNVmg88fgFAgQEW5CsbqKrBZbIhFEux\/+edcZdmRMADc0dqqHh4egnXYSivD73WeUl4PcXz\/e99lvPXW8TFpmUwfjsUTnec\/DLS1NEm15TKIheQXVSLkIZVMASw2mk31EAh4kEjE0wuF2CxoKlXQVM6OPN472w02mwW9Rg11mRzjVxxIp9NgsVhQa8qxxEhmN\/FoPOl1TwXPnelSAlDet\/UuTzgajdpGx3LpTFoy5fUiNh4DckiLRGJCpSon9LpFWLlyJQwGAytPEPR3wu\/3w2KxYO\/evbDZbDhz5kxsYGCA\/5dGEnNhvsRhwwzi4PP52Hn\/\/AssSpUKwWCQjjisViuAe6BQKG4LccysrLBYCw\/GrJPEVXUOozKLzuHiY1xecefsp3duJ88zNOxxTriUWq02vHrVmqRAIFC8+rvXp35\/\/I9EKpWSI68TrG1tCbatbpH0XR6cfg82G6RiMVpNzZDLZeCwSVeiyz0Jr98PhUyGNS0rRJFIVMRhs2EbHUUgEIBIOO2z8fquHcbT1xoZDjn8Ab3DH4BQwJe2tTSJAIDFYkIs4JKzNC0O1C2pIcfcxWIYGR4jd4KwWNDpK+kpVlRnKAAsrTUAAO67ex2czkl0W3oxYbMXTcwCgGgoGv+wuy+dTqdFAJQAUKaQg2ASsgvnu1lZgPuFRx5hPvroF2AwGIA5fu8tFgudapjNZgwMDMSdTifPYDBYGQzG0MjIyFGQ6Yb5un4of+ZYCHEUobWl5brSk5kw1tRgOC+KxuNxmiw0Gg0uXro07\/PdKGZ2Pc7c1zEfXEsgndMIljfFCUVCRCIRr1AoVAwPjSSWLl6KRx95NMZisega4vZt95blAFcmkxllMpn8JXV17IpyVbTz\/dOSvstD9HAguUyKClMzhPlUhoK6XAUOmw2v3w8OmwOFdvayHwqb2jcF8BEVtDPnzjk\/\/dBDdM93JBoT\/fHU2diGO1byqdInl8eBSqvG6IQbUokYZzo\/gLpChWZT\/Sxto7CUWgjbMNl4SE0KB4B0OpO1jzuIwYERtkIu4yjKFKitrYWmshJ5DYL13\/sOAPnSJwVKsLTZbDh79mz89OnTPB6Pl5DJZEMymexUf3\/\/GfyZaRI3G\/MlDsPMA7W1xgVd2GQy4US+vyIRjyMWiyEej9826\/nMiONGcE2BVDmbUJhMJthsNiLhCPp7Lit27tw5ZjTU6t988wj3tdcO0qa4p5\/+DvR6PZbU1XG4HM5TLpcj6\/d5fur3eeQKmQyf3fnpOa8pEgroMq3P54dcLoNCNv3FdLvcdJqj05MWEOvQcOzNw29K2+5Ym+TxeHQNOZ1OxzyeSW9vX08aAPoGBlg1i7SjYxMuWSqVlgKAWCiMCPhkGDXh9tBrDdksFvgCHj71P+6mG796ey5jyuODRCpGs6kejFwO\/X3Wsfd9AbpNdP3G1TDU6CES8jMTEy7mhN2dXWFaSdx992YiTxBFxEDhalEEJVp6vV5LIBA4CsASi8X+JKsbtws3TBz8GWH29aK+YOlOKkU2OdntjttWkp1JHDcScVyLONTiHETcHMIJRtFxygj2jW88AQD6zs7T6O7uBkBOurr77rtRWVkZ6Om7xD505E15Mpnav+WuDdd8H2N2B8bsDjjd5DwIo8EAvVZDpy2RcAQ+nx\/l6nJQDVYUCILIPfy5z07xeLyiFtdgKBihSIPP57P+7it\/pzVWGwK\/\/d1r0oIFynT9kyINpUKGxqXkTSYYDOHyAFnylUhEdAoTDIao7ev6XDabicfjTKWyLJ2MZ1nt6zdh1apVzPb2dqBAqARIf4TNZoPZbIbNZqMFS7lcHuByueOlKOLmY77EcfW4dp4oXOodjUQBFTBktWKr8Z6bdYl5IxgM3hBhULgegbTbXnyT5PF4CIdC8Pl8HrlcrmxrW4u2NrJn44\/mt92H\/3Ck\/K2THZwNd7bxk8kUvH4\/rLZRhPNiKRVBJFMpnO\/qxhW7AxXlKui1GhhrDHC63BizO3De0o32dWuh12ogFAkhFAnzIuooOGw22laTpXRfOJx6ZPfusrNmc0gul4up96mQK5Sb7tqsPHjwdbxtfgOL65Zh891bOY9+6Uv2bC6XBoBVK5qq9Doycrnv7nWzPr9EIkYOvHhf3zhbp8tmlkmEnEsXe7MyqRyf+asdxKpVq2AwGCiSKBIrC9OMCxcupLu6uhCJRFg6nW5AIpFc6u3tPQVyQZbF6\/WWoohbhBuOOIas1jlNXtcDlUqFyclJOuLw+shSXK3R+ImwnlOVn4Wg285EW\/XcPpAmbYYijpP5Q2YGg+ABePJHP\/qx8okn9gQEAoHU5XZ5R0aHFUwmyte0rgI\/H94Zq6vAsZMRQoVKVZR2+Hx+6LUatKxoRt\/lQXRf6qVNYUZDFVpXbEYymUQ4EoVIKEDn2fMQCgUkwRimvVcGvU762K4veuXyuc013R9+iPvuuxdlZQoA4Dc3m7Tnzp931VRX8dTls7YKIBFPpL0+P2vK44VSqUxXqlW8bfe0Y9u2LcyZngiA1CGef\/75WQRBiZUFaYbtVk66KmFuzJc4LJhRVXHcQAVESRMHmV877NMC6SeBOG4E1kkCbVfZyPnQyuSvvvi9jr8uPKbR6mUAnhwbG8OePU9IhSIhqqoWMaqNBrtEItGmUylM+PyoMVbDaKhCOBJB9yXSlblscR2WLSanmMnlMpzv6ob5PXIIkFAgwIrljWBz2Bi0DuPI8bcAAG2rWyASVkFdriIjjpFRdJ49j6aGZWhuqIdCLgOHhWwoFPSJxZJZ+eO\/\/PPeon8fOvh69ul\/\/Lby8uAg8\/LAYFapVGV5XD5r6ZKlMBprYTAYWAaDYVZVgzJOUakGpUNoNBoXgCGCIM6Pj4+bQRJEKc34hOCGy7EXL11CPB5fUGVFp9WiL29JjkYidGXldukcgUCgaP7odWIU5M+F+mMB4H9kdRIA3p7rBVwWZm1VdtjH\/BqtPiAUCaVb770nnE6lRcPDI\/Jz75+Xu12TKFersGTptCkqEomidUUz9DPGEXSePQ+vzw9jtQFVOi20lRXo7umF44oLHDYHTQ3LUKlWQ8Dno+\/yEM5bSB1FKBDQKQyFbz\/1D8yDv\/2N\/DevvD7rM4TD4eyFCxeIrq6ujMfjYWq1WuLT2\/8KBdHDrAiC0iBKBPGnj\/kSxyEAj848ePKdd7F1y\/y1icLKSiZLlimt1mFoNdprveyW4RoRRzcAPwBz\/t9mAP6OE0ev+QueOLwBGQaBDIhYisF0Z0AQaQYzmwVj0VU+oSUSjmycdHsiOr1WtLypEQAQi8VczglXWiQScpH3KTQ11KPv8iD6Lg\/BNTmJLe0bIJfLkEgmnbF4XGodsfGtIzYs0mm9G9vuUCQXp3CpbyAwMGglRkbHGIuN1axFOh0vmUqCxxNg0hsa6xkcz7q9IeGq5UuUAMDl8rLr2tYnAXB6e3sz586dYzocjiyLxSLq6uoIk8mEjRs30mINZZiaS4MoEcSfF+ZLHOa5Dh47fhy1RuO8tY6qqumcOhGPQSwWw+vzfmSvyy3CyUQi4Z+ampKlUilHMpnsCAaDb3WcOGpb6Ak9TPH7OTDWgJziVdS8NX5ku0m3\/cjML44ZwMYPLnSpxWKRyzYyyhkdvSLnsNlqNocDrU7jkuWnZFOOUA6HFDTV5aQfwli1SMpmsTxev58Ti8XVV8btiiPH3\/LE4wmRskwR39y+Xl2kiQSTLs\/opBqAnsdi5AzaJbnxsXH4fb7sIm2NbMLuYh44cAAmk4n56KOPAgBBVTGoFOMaGsQZlAjizxLzIo6OE0f9m+7Z1o05Bvf86IUXsOP+TxdtKb8aHA4H7A5HkY5B6Rx2uwOtLWS6Qo0VvEkIgEwjbDP+WDpOHL0l6nsOjDMA5txiD3JS2swvlA0gy6Tnz32gXla\/dGx5cyOPIAh+KBQeFQoFtOrY3FCPZF0KI8Mj6Om6iEmHE3e0rUFtTTVfLBLpL\/UPWBOJpCSbzfJ9\/oASAOwTTvj8fhfBIIRqlZJToVIymbmkms9IZ7\/4+c8Ra1avZgBg5LUIwmKx0JUMs9mMy5cvx0+fPs0DgJJI+ZeNhfiqLbjKxK9Dh9\/AseMnUGs00rM3KHh9Xvi8vlmiJzXUJ5U3IFFiq0KuWAhxUHqDBWRqYQGZUpjne6KbhGvdaQ1Xe37tYuNU6+qWslQqJervG0hOOJx8sVhUXlNb41Eqy2hj1ED\/AKKRGMqUiokaY3UldfzMhQ\/cwVCYduYxgHQyHmchm+WUS6WqFc3NxF0bN8JkMsFkMsFsNhOU9mCxWNDf3x8bGBjgUz4IhULRX1jm\/FOZGVHCrcNCiMN2rQdjsRguXrp03bZxXp44KFACqfHqJdkF6Q23Cdd6T+0zDzjsYxaNVo8Jh7Ps6O+PoW5JXabKsChX37AMINOdoqUbI1abNxKJKABUupyuTLNpOdPtnoS+XFUW5Auyi+vqCKoNXCaTwe\/3E5T+sH\/\/\/ln6g0QiuZQ3StlKPRklXAsLIY6berchCFJbo7pkY7EYQqFQvK6u1n\/s+PH\/i+nIwXYjesPtgG77Ecv4ke1zpnaYO+IAgG4Om9287VNbAUB59sy5mNPpglwuQ6WmImCoNghYLBY74A+ks9m0gs\/nZdbfuY65a9cuJrUz1O\/3MymR8tVXX43v2bOHx+PxEhUVFeMz0gt\/SX8oYSGY916V\/MzRkY963keA1huGhwbb+QLhWwTBuKSuqDzQceKo39J98RAAmal5efsNXue2Y\/zIdhPIqGiuZjG5bvuRIiLWaPWHOBz2BFqWzgAAAWxJREFU\/csalgUmHE7ppNudTiQSrFwul61ftgyNyxsJLocDWV7g9Pv9uHDhQnpoaChNlTeTyaRTqVSeoaIHlNKLEm4yFrSQKU8eu67xlHZMi3+U3mAGgOvRGyzdFx8HYL6ZW+xvJ8aPbDcAOMRMJ5uJdAqcaNDFTkSTGRbnK9Ivdv+h8LkarX4vgGdTqRTWtZH7TAwGAywWC5xOZ2xgYIDP4\/ESSqXSxmazbaXooYTbgdu+AvIvBd6ft1bxg57jjFx2MXXs3aHEv2z5D1eHVCrdJhQK7wRQ63K51QKBAIlkAprKSmsymXQWeB\/8Je2hhE8CSsTxMSP+X1UHkDfRrf+PcMybFnriycyVPDlQ5eJSalHCJxol4rgNiP9X1V4A7b4k8co7Hv6rD3+\/t0QSJfxJoUQcJZRQwrxx9YkzJZRQQglXQYk4SiihhHmjRBwllFDCvFEijhJKKGHeKBFHCSWUMG+UiKOEEkqYN\/4\/ki0e0g3UkhkAAAAASUVORK5CYII=","width":270}
%---
%[text:image:0a05]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:6335]
%   data: {"label":"Show shape","run":"Section"}
%---
%[control:dropdown:56f2]
%   data: {"defaultValue":"\"default\"","itemLabels":["??","Cartesian","Spherical","Polar","Cylindrical"],"items":["\"default\"","\"Cartesian\"","\"Spherical\"","\"Polar\"","\"Cylindrical\""],"label":"Which coordinate system would be easiest?","run":"Section"}
%---
%[control:button:506c]
%   data: {"label":"Show shape","run":"Section"}
%---
%[control:dropdown:215b]
%   data: {"defaultValue":"\"default\"","itemLabels":["??","Cartesian","Spherical","Polar","Cylindrical"],"items":["\"default\"","\"Cartesian\"","\"Spherical\"","\"Polar\"","\"Cylindrical\""],"label":"Which coordinate system would be easiest?","run":"Section"}
%---
%[control:button:0e4e]
%   data: {"label":"Show shape","run":"Section"}
%---
%[control:dropdown:30ec]
%   data: {"defaultValue":"\"default\"","itemLabels":["??","Cartesian","Spherical","Polar","Cylindrical"],"items":["\"default\"","\"Cartesian\"","\"Spherical\"","\"Polar\"","\"Cylindrical\""],"label":"Which coordinate system would be easiest?","run":"Section"}
%---
%[control:button:211c]
%   data: {"label":"Show shape","run":"Section"}
%---
%[control:dropdown:2c5f]
%   data: {"defaultValue":"\"default\"","itemLabels":["??","Cartesian","Spherical","Polar","Cylindrical"],"items":["\"default\"","\"Cartesian\"","\"Spherical\"","\"Polar\"","\"Cylindrical\""],"label":"Which coordinate system would be easiest?","run":"Section"}
%---
%[text:image:4074]
%   data: {"align":"baseline","height":136,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAP4AAACICAYAAADH7VaNAAAACXBIWXMAAAsSAAALEgHS3X78AAAP90lEQVR4nO3dXXRU5bnA8f+0rnNxRCbLmxaR8GUnfNXqEgr1aAXkREgohCWWJCgLpCQGj1aFRlgaCEQNAqKHyldCSoIlCR9pQsgQiBCTUiUhYg7Ur8ypmkw4gOdCZ0P1LK\/2uRgmTCaTycxkZu+ZvZ\/fWnPh2pnZ78I8ed\/9vM+8j0VVVYQQ5vIjvQcghNCeBL4QJiSBL4QJSeALYUK3DHBdMn9CGJDM+EKYkAS+ECYkgW8if\/ugBYvFQlLSODq7nH2uZ2QsxmKxUFxSqv3ghKYk8E3kgfunsfoPL+JwdFBYuKnXteKSUiory0lPz2TF8qW6jE9oxzJA5Z4k9wzGpShM\/eVUHI4OKg4eIf23j3Lx75\/wi7snAXDh4sfc\/fOJOo9SRJvM+CaTYLVSsq8UgPV5L9HZ5WTHjh0AFO3dJ0FvEj\/Oz88PdD3gRRGfEkfcyY9+\/C9UHTnE11f\/l7KyfWRl57B+3Ut6D01oRJb6JuVSFDIzFlNfb8dmS+JkQwOjRibqPSyhEVnqm5TLpfDFF\/8AwOHo4NL\/XNZ5REJLEvgmtXbNWhyODlb\/4UUAli9biktRdB6V0IoEvgl5tu6ysnPYsnkTWdk5OBwdvPpqod5DExqRZ3yT8bd119nl5JHkZByODuz1J0mZnazzKEW0yYxvMoWvvQbAG29u79m6GzUykdW5awB4\/vfPypLfBCTwTcS7Ou+F557pdW3F8qWkp2ficHSwffsOfQYoNCNLfSFMSGZ8IUxIAl8IE5LAF8KEJPCFMKGBztyLmB27inhr29agfnby5Cn86623RnlEQoTuhx9+oP54HTMf\/neGDh2q93D6lZI6l0cXzOv3umaBf\/XKZW655RZeXBv4G2CHD1byyJwUxiXZNBqZEMHbv38\/33zzDd9\/9x2rVq3SezgA2O12Dvz5HQBeWJ3LvN+kkjjizoDv0Szwv\/\/+\/xgxIpGlSxYH\/Lkzf21mXJKNaVOnaDQyIYKjKNfYtfNtAPLWrdP1d1RRrvHOgQpqa6oB2PLGm8yaOR2rNbhViGaB73R2YU1I0Op2QkTcqcYmABY+tki3oHd2X6K4eC8H\/vwOM2Y+zMaCgrDGolngCxHvrly5AsBD02dofu+W1jaKi4t5r\/E0ix9\/gqbm5gGX84FIVl8Y0saC17BYLFgsFlJS5lJ5qGrQn9n+0XkAhg0bNujPCoaiXKOqupbk5Nmsy8vjwV8\/RHt7OwUb8wcV9BB4xpd1uYg7LkUh56mVDLVa+dblIsFqpbiklIxFC7l+fV9EThAefkd0A9\/ZfYnyioMU7d7JjJkPk52zMmCGPhyBAv+eiN5JCA28+mohH310ntZzrSRYrYD7C0iOjs\/J+t0ypv5yStgHit5xxx0AfN7hiMozfktrG3a7nVcKNvBy3nqO1dUxccL4iN8HZKkvDOTi3z9h65bXmT5jZk\/Qe8xPSwPoOVE4HD\/5qXumv3r1aviD9KOqupbHfptOZkY6P\/npMFwuhYKN+VELepDAFwbSeq4NgKRxfQPmgfunYbMlUbRnl98uQsGw2X4GwPkP28If5A2Kco23d+5hzJixVFaUk56RyZdffsF\/rMwOektuMDQN\/COHD\/YkXPp7\/amkWMshCQP5sO0cALfddpvf62PH3gW4l9ThmDplMuD+PXZ2XwrrMz759DPy1uWTkGDlH\/\/toLyiksOHKiP+DD8QzQJ\/6NChnG05h6qqA76keEeEo+m9RqD\/wLfeWP5fv349rM+3Wofyct56AIqL94b03oZTjSz\/XRa\/mTuXW4fcRpezm7fefEO333VZ6gvDyVi00O9qsrKyHAg\/8AFSU1MBeKVgw4ArB0W5Run+AyQnz2br5s2kpM6lvb2dNbmrBr0dN1gS+MIQXIqCw9EBQMXBI35XkjZb0qDvM23qFApfd3\/ZLDMjnU8+\/azPzzi7L5G3Lp97772XM39tZnVuLg0NJ3h0wTxNnt+DIYEvDCHBau0J7IFm9P4eBYKVk72ChY8t4quvvmTSxAnkrcun4VQjLa1tPPf8KkYmjgCgqbmZkr1FJM+aOaj7RYOU7ArDGDv2rp5Z35f3imCwgW+1DmVvcRH3TZ7C2hdX80rBBm6\/\/Xbuu28K89IW4HIpMTOz90cCXxjGtF\/dT329nSuX+7YDczpvZuEjkVBTrl1jyJAhDB8+nAkTJjFm7Fh274qf04llqS8MY\/KN7baWsx\/0ufbpZ58DkJ6eOajmoC2tbeSty2dk4gi+vnqFI1XVNDSciKugB5nxhYGkzE4mKzuHoj27OH6ioVdHoKPVfwHg6Wee6e\/tAVVV13LcXsd7jad5YXUuXc5u3TPzgyGBLwxl7do1dDudvL19O3cOH87dP5\/Y00ikaO8+Hrh\/WtCf5XvYRXbOSkr2FkVr6JqSpb4wlFEjEymvOMDESZP4xd2TsFgsNJ56l4qDR4L+Zp5nO85TXbexoKBnO84AjgIzZMYXhpNgtbJl8ya2bN4U0vsaTjVysLKy57CLeF\/O+ygD8oFOkKW+MDlFucapxib27NoJQObjT7Dtja0xvx0XJAV468bL5X1BAl+Yku9hF6tzc2Oy0CZMXbhn9xp8At5DnvGFqXhX1333z+scq6uL2eq6MDQDy4BRQCn9BD3IjC9Moqq6lsqKchSXK26q60JwFPdyvinYN0jgC8PybMdt27qZ+yZPIT0j0yiZeXA\/v9fglbALhSz1heF4H3bx9dUruh12ESUKsAH3cn4pYQQ9yIwvDMS7ui7rqZVG247zJOxKI\/FhFlVV+7s2HXgvEjcBsFgsRnuuEjFAUa5RffQY5Td6x2XnrAyplVQcaMb9\/F4TyQ\/VdMY30P8MobNItZKKYWW4Z\/emaHy4LPVFXIl0K6kYM6iEXSgk8EXM862um5e2wEjVdRCgwi5aJPBFzHJ2X6L2mJ1tWzdHrZWUziKasAtFoO08aaEldOF72IWnus5AQd8MLOBmhZ3mpGmmiBme6rrzH7YZ4rALP6KasAtF0AU8GRmLsVgsFJeU+r2+7a0\/YrFYyH5qZaTGJkzA00oqOXl2n1ZSBgl6BXfAj8ZdcNOk52A8gg78KVPdJ5dUVx3xe\/1Uw0kAZsx8OALDEkbn20pqY0GBkarrIEIVdlEToJVVvurlq84uFVAB9cz7Z70vqRcufqwCqs2WpH7rcqn+uG8lzO7ku6fVJ5evUEePHqMWvr5V7XJ26z2kSOtUVXWpGkSrOD1fQc\/4o0YmkpWdA0Dj6cZe107d+O9589P6tCcWwreV1IO\/fihmWklFkO4Ju5AE+KvQa8ZXVVU98\/7Znpnd25w5qX5XAt6QGd90upzdauHrW9XRo8eoTy5foZ5897TeQ4qGUlVVp6sxMIuH8gop8FX1ZpDb60+qqnpzmT9nTmrAfx0JfPM423JO\/f1zL6iA+nLeeiMu512qO+BHqTEQxOG8Qi7gmZX8CPX1do7W1JAyO7lnmT8r+ZHILUNEXKqqru1VXWfAL2VpXmEXNQH+Kvid8b2TfN+6XD0rgK86uwL+iURmfEPqcnarf9yxWx09eoy68LFF6pG\/HNV7SNHQqcZBwi6UV8gHcXgn+f60bz\/19XaysnMG1ZZIxB\/Pdpynus5gh114xFfCLgRh1eo\/sWQJRXt2ser5ZwGYn5YW0UGJ2GW0VlL9KMO9nP8vvQcSLYEO4sgH1vd3MSlpHA5HBzZbEh0dnw98I4uFAPcSMcxfKymDHXYB7uf3UtwB36nrSDQQ9rfzps+YicPRQXbO05Ecj4gh3oddzJufZsTDLsD9DblSjJCwC0FYgd\/Z5aRozy5stiSeXLYk0mMSOvNtJWWwwy48dPtKbCwIK\/DXrlkLQHbO01KpZxAGbyXlrRl3wDfpOwydBUj599nOu3DxYzU9PVMF1PT0zJD2Q5DtvJjkW11n0O04VXUX3NyjxsBWWiy8gp7x\/\/ZBCw\/+268AmDMnlcJNhVH6UyS00NLaht1u55WCDbyct55jdXVMnDBe72FFmqkSdqEIOvAnTRyPzZbE4seX8OyzssSPV76HXRiwug5MmrALRdCBn2C1BrVtJ2KPv1ZShw9V6j2saDB1wi4U0kLLwAzeSspbMzADA1bYRYsmp+w6uy8xevQYLW4l6L0dZ8BWUt4MX2EXLZoE\/uXLV+RIrijz10rKoNtxkrCLADlXP875tpJanZtL8qyZeg8rGiRhF0ES+HGqpbWNyspKao\/WGLm6DiRhFxUS+HHEXyup9vZ2Iy7nQSrsokoCPw6YoJWUN0nYaSDQdp500tGZbyup8opKo7WS8lCA\/+Rm0wkJ+igLNONL7zydROOwi5SUuQAcP17H8RMNvFNWhqIoHD9eF4khh0sSdjqRpX6M8HfYRcneooh9fn29HZsticpDVWQsWhixzw3TBdzBXqrzOExLKvd05uy+1KeVVEPDiags5x2ODtbnvURWdg5n3j\/LhYsfR\/weA\/BU2N2DBL2uZMbXiV7VdWPH3sWe3Tujfh8fZbgz9J1a31j4J4GvId\/qOj0Ou1jwqGbLfM8Z9KVIwMccCXwNOLsvUV5xkKLdO3Wvrhs\/fly0b9HFzYCXhF2Mkmf8KGppbeO551cxMnEE3\/3zOsfq6ijZW2TUktoLwDLc35CTLH2Mkxk\/CjyHXSgul1FbSXmTCrs4JIEfId7VdZ7DLgxYaONNEnZxTJb6g2SSVlIeCrCBmxV2nXoORoRPZvwweVfXGfywC5CEneFI4Icgng+7mDMnlfp6e6hvkwo7g5LAD4LvYRfx2EoqxJp8SdgZnAR+AC2tbRQXFxu9lZQ3SdiZhAS+DxO1kvKQCjsTksC\/wbe6zuCHXYAk7EzN9Nt53oddeFfXGTjopcJOmHfG920lZfDtOJCEnfBiqsD3PuzCmpBg5FZS3iRhJ\/owxVLfu5WU57ALA1fXgVTYiQFoMuN\/eP4jfmZL0uJWvZiolZSH5wz6GuTZXQSg2VJ\/yJAhmtwnnqvrBqEZd3a+VN9hiHhhmGf8WDrsQkNHcWfmm3Qeh4gzcf+M73vYRVNzs5EPu\/Aow\/38noYEvQhD3M74VdW1vVpJGfywC7hZYSd772LQ4irwTdZKykMSdiLi4mKpb6JWUt6auVlhV4oEvYigQDP+KK0G0Z9otJKKA5KwE1EXKPBHajYKL\/5aSZlgOw6kwk5oKGae8b0Pu5g3Py0uD7sIgyTshC50D3zv6jqTHHYBkrATOtMl8E142IWHVNiJmKBp4Ju0ug4kYSdijGbbebU11WZpJeVNKuxETNJkxh82bBjz0hZw+PAhMyznJWEnYp5FVdX+rvV7QfglCTsRN3TP6huAJOxE3JHAD18Z7mBv0ncYQoROAj80Cu6lfD5SYSfimAR+cCRhJwxFAj8wT8KuVN9hCBFZEvj+NeOe3Wv0HogQ0SCB35sk7IQpSOBLwk6YkJkDXxJ2wrTMGPiSsBOmZ6bAl4SdEDeYIfAlYSeED6MGviTshAjg\/wGhp+etzUF4tQAAAABJRU5ErkJggg==","width":254}
%---
%[text:image:0a3f]
%   data: {"align":"baseline","height":299,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZEAAAErCAYAAAAfcL5EAAAACXBIWXMAAAsSAAALEgHS3X78AAAgAElEQVR4nO3du66kSNYv8LWP2q+KbX3etNjeOF9pSL96JPDHIR+BtMcCb9oEb1x4BHiERKpqH6TuBwBVO6NzHOg3iGPsWVEByTUyc2fm7v9P2prqvMACIljELedJSvkzEf2LAKDnp59+ol9++YWIiL58+UI\/\/fTTbQMCuD+\/\/J9bRwAAAI8LSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIw9XBLJ85zCMKTn52d6enrq\/e33e4rj+NYhrhLHMR0OB9rv97cO5aLyPD+5LvzH12a3242+\/\/z8fOPoH0sYhuS67sl5fHl5oTAMqWmaW4e4qGkaCsOQdrsdVVV163Auak1deBeklD\/LB1DXtXQcRxKRDIJAtm3bez+KImnbtiQiaVmWzLLsRpHOC4JAEpH68zzv1iFdRZZl6hijKBr9jH697tHnz5\/VMXz58uXW4ShRFEkiko7jyCRJeu+VZSl937\/78tW2ba8eEJEsy\/LWYV3FmrrwwL4+RBIpy1IKIaRlWbKu69nP6hXoni8Yx+n7\/q1DWRRFkbQs6yRxzynLUl2HqYTueZ4kImnb9qVCvah7TCJ8zoIgmP1cWZbSsix1frdcu7dU17U6x0t1+9bqupae5y2e+6E1deGBfb377qyu68h1Xeq6jrIsI8uyZj+fJAk5jkNEr839e20iCyF6\/3uvuPuw67q7j\/W9C8OQ8jwnz\/MoiqLZz9q2TUmSEBFRVVV0OBzeIsTN9DJ17+Vrv99Tnud3H+dbu\/skcjgcqOs68jyPbNte9Z0sy9SFfld9jzewlLSnrKloqIzrVVWlynIQBKu+4ziO+mye53f7QPUorlkXHtldJ5Gu66goCiIi1bpYQwihEk5RFNR13VXig2lIIpeV5zkRvd7I1j5MEfXrDW8D3tZ7L+d3nUTyPFcJYEvFIfpeebqu6z2B8YyWMAxH98czv6YSTxiGvVkW3FKaE4Yhvby89GaRzT0V6jFWVdWbgTPc19p44jhWx0ZElKZpb4ab67p4Ur1jnABM6gHfxPTru1TW5+oJf18vl7vdjtI0XTyG\/X7fm0U211MwjDGOY\/XdYVxr4+HZYK7rUhzHqrtcnyGI3ouN5B0PrPMsFCLaPDCoz4jIskwNSPKfPjg2NlNkuL8sy6Rt22oGiT5bbGpgOIoiKYToDfAnSaJmJQ3jGMboOI76bhAEUgixOR79HBKRFEJI3\/fVAF\/btup7Qoje4GYQBGpwdvi3NAiqn9OpwUSeqYaB9WVCiFUD6mO4vHF5mSvrw9mDY\/vzPK83IUQvY8PZYlJ+L5uO46hy07ZtbxKMHscwRi6zdV3Luq6lZVm9OrU2Hj6Hev3Sv5ckifqM\/vrY\/YP\/1kyMWVMXHth9z87SC\/TWmRvDJML4hjk2c0svvMMkYtv2SQVp21YVuuPx2HuPK8jUDDF9uvLUe\/rU17Zte\/+9NR69Yg2nUurfG8bL50RPYGsgiVyOfi5NZvPpSYQdj8fZ6zo1CyzLstEp2XwtHcfpvV7XtZpZOfYgqNfT4fsc4zAZBEGgyunWeKT8nkzGpj\/z98bOC5+TrbM+33sSuevuLL0v8ZyFU1tngAghRj83HJcRQqjBNr1LoGkaStOUhBDk+\/7oPua6Jfg9fX9CCKrr2iieoeEAof49dGndH708vmU9mPrc2Pgkl9lhueMuI8\/zVm9ruM3h56Io6k0u2BKPbmygXP8e6sI6P9w6gDl6oauqatPgOhceIcTq783NvijLkoi+z3Lpuq7X56oXVu6\/nkpGa819d0s88PiEEMY3Ni4LW+rPVF3wPI88zyMiUuMSRVGouIblTp8QcI6purA1Hri8u26J6IWeZ2mtxYVoS8WZw4N6PCjOLYOxJx49gV3Llnjg8ekTRbbUhaZpVOvlEnWhaRo1EM0D0J7nUZZlKj7Wdd3V68KWeOA67rolYlkWeZ5HeZ6rp4u1s1O4oq2dUz+HZzYJIeh4PK6OYa7r4ZzCbRrPGpeq7GuODxV8Pd\/3VUszTdPVCYFbAlvWWc1xXZeapundqPX9TJmqC+eWAdN41njLuvDI7rolQtRPAmtX3cZxTE3TUBRFmyrOVEHnhLS2IurjElPdD+f0bW+NZwskke++ffum\/v3x48fbBUKvffXcbZPn+eJ0WpamKVmWpVavrzVWPouiUK8vrZgnWjfWdm492BLPVkgi69x9ErFtWxUQXjMxh+eWB0Ew2wqZqiRznx0WqqZpRguI7\/uq8ozNOa+qarZLYqlibY1ni\/de4Lf4\/fff1b8\/ffp0w0heJUmiHhr4J1DmcF05Ho+TN8Su607K29TDj\/654famkgRPLJlaMT+XDNfWgy3xbIG6sM7dJxGi19YI\/5RJURSji5SqqqL9fk+Hw4GSJJl8MuFKmOe5qoRd1\/UWAA4rlv4dfj1N09kKwPvnBVZcIPkpkp8q5yrrVKIxiUc3VzmGFZcrZ9d16nytaRHqsU\/dDPjYH+Eny++BEILKsiTHcVSZHVu4Gscxvby8ENHrBIypWUj8un490zQl13XVe2P1gPdB9Fou+LfVxgRBoLre9vt9r4weDofeNoflXd\/3WF0wiUe39JmpusCxrG0RrqkLD03e8TqRMVEUqXUU+p\/neavnb\/MiQP6u4zgyy7LRRU5MX2xk27aa760vHKTBXPeyLHuxCiHUfPexxY9TC5rm5qwvxTNcbDgV63Ahlr4+QF+ERSNrUHT6vP\/hH1+fYYxzx3lLemz3pixLtQBVj9OyLBkEwaqfVdcXqA6v+7AsDtdl8Ou8bmV43YfrS8bqXNu2o4sfx14bxsG2xDM8V2OxjtUXrif6wlw+hjlr6sI78PVJSvkzEf1rOs3cJ34SK4qCbNtWPzb33n+nBt7O09OT+reU8oaRzEvTVD19+75Ptm1Prk8CuLBfHjKJ8LjHWNOQE4o+LgFg4hGSCP88+RiuA5eYoQgw4ZeHGBMZStOUoigiKSXVdU1BEKj+Uf7JbP0HD\/HrpfAexXFMQgiSUpKUkqIo6rVAuIWi\/yghwKU9ZEtkDrdQ8jxXzXo07cHEI7REpvBsKJ584fs+RVGE7l64tMfszgJ4C4+cRADeyGN2ZwEAwH1AEgEAAGNIIgAAYAxJBAAAjCGJAACAMSQRAAAwhiQCAADGkEQAAMAYkggAABhDEgEAAGNIIgAAYAxJBAAAjCGJAACAMSQRAAAwhiQCAADGkEQAAMAYkggAABhDEgEAAGNIIgAAYAxJBAAAjCGJAACAMSQRAAAwhiQCAADGkEQAAMAYkggAABhDEgEAAGNIIgAAYAxJBAAAjCGJAACAMSQRAAAwhiQCAADGkEQAAMAYkggAABhDEgEAAGNIIgAAYAxJBAAAjCGJAACAMSQRAAAwhiQCAADGkEQAAMAYkggAABhDEgEAAGNIIgAAYAxJ5J0Lw5CKorjItna7HYVhuOk7cRxTnucX2T+A67oX2U7XdfT8\/Ly5bB4OB2qa5iIxvBd3mUTiOKY0TYmIKE1Ten5+pqenJ3p6eqI4jm8c3eMIw5C6riPHcc7eVlEUVFUVeZ636XtBEFw0kS2J41iVlefn57srL13Xkeu6Kj4u57DMdd3N5W9KmqYkhNi8Pd\/3yXVd6rruInFc0s3um1LKn+WdcRxHSillkiTS8zz1ehRFkohkFEW3Cu1svu\/3julasiyTlmXJtm0vsj3P89R1uUUsdV1L3\/dnr73nedKyLFnXtZTy9VyfU16ISP1dim3b6jwej8eHLs91XUvHcd4k\/iAIjMvfGMuyjOO+RCxZlknHcWRZlmdtR3ej++bXu0siZVlK3\/ellK8Xa8hxHCmEeOuwLqJtW0lEb5JELMsaPX8m2raVQgiZZZnxNmzbNoqHKxsRzVY6viEnSdJ7XQhhXF4unUS4Mh+PR\/Wa7\/tSCHGxZP+Wsix7kyRYlqUkorPKny7LsrPO+Tn1IYoiadu2JCLp+\/7FrvsN75tf7647qygK1f0SRdHJ++d0zTRNQ4fD4eZdHEKIq24\/z3NqmuYi3VhE5k1\/ned5lKbp6m6AOI5pt9vRfr8ny7Korms6Ho9k2\/bo56uqIiI6ed+2beq6Tr1\/S3we9evC8ZmMG+V5Tq7r3vzY3qI8n1v+httzHMc4biEE2ba96T4ShqHqXnUch6SUlCTJxc7dNe+bi+SVWyJ1XavMO\/Y3fCpfaiYGQSBt294cA3d1LD01RVEkLcuajK+ua9Wc5ScaPcNzt4t+jFmWqaa\/\/rr+vaX9Zlkmfd+XQRCo\/fI2hk\/f\/HTL+ElO\/2vb9uT1qXMzdd6SJBl9LwgCSUS9VsNUS2EoCAJ1bFtaLp7nqeMai8XkqVE\/N+fiVuiw7PLTPD9FrsGtMy6Dc\/vk45+6xnq54paSXvb0liARqe5C7qLUt811d81+oyhS8fN++fwMW5uWZfXuC\/rn9XM6fH2s1VrX9UlrUN+uEOLke7ZtnzzF876463SMfi\/Y2n12D\/fNla7fneX7vqzrWiZJok5iEASjleZ4PC7eOJYqjq4sS+l5nrRte9UFjKKot22uPByTXjG4Odu2rbqAnAj0Qqj3GfONZHiMS\/vlGyRXGP5sWZaqIuuVwrKs0QJj27a0LOvkdSHEaKWScr7pHwTByf6Px+PJOZDye+Wdu1ny+TVpdnOFu9ckwgl7eF349TVdnEmSrEoeTO8u0W9K\/F39JmXbtkoOerlzHOdkG3ytOQEOY1naLz8k8HHzjThJkpPrz+VmWGe4S2l43rj8TXUTTd1M+eGQb\/j8fU52w+1xrHMPRXzcJt3Xt7xvbnTdJNK2rTrJURSpk8FPPkO+788ONJVluWpAiz9n2\/bik+8cLsB6IeDXhjdjvhmMPektJZE1+5262XDB1\/crhBg9T2N98sNBuCHP82bfr+taCiHUTYj\/d2jteJBpS+RRkwi30ObOS5IkakD+nIFYvvHpZYVfG96cxsqKlK\/nk2OYSiJr9js12MvXkfcxVa+kfC2bwweOpckXSy0C\/Xwcj8fJ+82a8SDTlsit7puGzMZEqqpSU8fm\/ohep8QRvU5ttCxL\/XusL7Bpmsk+b6LXfvIsy2Zj4750y7KoLEu1\/7XyPKcwDMl1XXp5eVFxMY57GD9PYeVjZJ7nURAEZ+93ra7rJs9vEAQkhOj1vxdFMdnX3DQN5Xk+ew4ty6IkSaiqKnJdl7IsOzkHw23OiaKI2ralKIqoKAp6enpaNTd\/qW95Lqa3MLV\/HiOait91XTocDuT7\/uyY0JQ4jikMQ9rtdnQ4HHr71Pc73P\/UGFMURatiWNrvWnPX3fd96rquN026KIrJ8spjcnP10fd9CoKA0jSlOI7peDzOxjd3TFw3pJTkeR7FcUzPz8+La62EEG9+3zyHURKxbZuklIt\/+gFXVaX+e+zE82DXlMPhQFEULd4sgiCgLMuoaRp6eXnZNPi13+9pv9+rtRVt267+LjO58V9iv1zQhBAkhJiMw\/M8yvOcuq6jpmmoaZrJJJKmKdm2vTgo5zgOWZZFTdMsrgdZezMPgoDKsuxdy7lBZN7u8P2madRA6C0JIdQ50vF\/T8V3PB4piiJK05Rc1109AN91He12O1X+uV5stbU8X2q\/fD31G+gQlzt9bYTneZP3iDRNVz1UcnmvqurshxfGD0dBEPQejpYS61vdN8\/xZrOzqqqavYHkeT55M+MnsbU3IM\/z6Hg8UpZlVBTFqmRSVZV66k6SZFXrQcc3gTWVXC8M5+53jBBisnB6nqee3ubOOdH8NWG8eC7LMnIch8IwnK14WwszX8u6rsmyrMkkxed\/mESqqrruzJQN+MlZj5FvEnPnmRMqP82uSSZpmlJVVRRFEUVRtHlmk2l5Pne\/Q3M3UKLXc1pVlapHU\/vjzyzFU1UVhWFIZVmSEIL2+\/2q+NYaPhwtJam3vG+aepMkEsexehIjen264Iqk39zHDtZ1XXIcp\/ek1jTNqhaGbdt0PB7peDxSVVWzK5i5kHJcXdepZqdegPnfw0LNMXK3Dr+f5\/lJRdRvIlv3O0V\/33Gcyc\/z01ue55Sm6WTSWtP05wTieR7Ztq0SyVjFm+oeWYu7Bqbi8X2fbNtWNzGi7yv2x6Y83kIQBGTbtrq+XDbWPin6vq+6aNM0pd1ut7jinW9SfJMlWleefd8nIYTqlmJxHE+2prbsdwl\/1rKs0RYc4xso1+up8pWm6cl9ZIjrbpIkqjwLIVR3nI7jMX1A4YejpW6oW9w3N5NXnp3FA6r6oFJZllIIoaYL6jMQdMMpsfqfyQDj0qpnfWpuEAQqdv4bTt2lmYFu\/hvuiwfuSBvMXNrv2Hng49f3x4O2POg3NeOKBzXnZkotLQ6cmrIq5fcpmfo14umT11xUN5xGfe5AtH6+rxGjZVlnTfyYW\/XMswaJvk8D53LB121sCqleXnlqPL83Fq9edpMkWbVffXYWf47pMemzIudm7PH+ps7lmsWBHOOwzOsTWvSyyxN3ruWe7psLrjs7C25nLgnw7K+pAsUV55IFznTF+i1dI4nAdktJgNcrTeGp928Vz5\/M\/a1Yh8vgGSZjXQg8gH9O038LHsi\/xHgP\/PnwbKW5rui5AfO1A+prxXFMtm1fbAX9w5NoibxbU4uTPM+bbGVc4ylLX6D2SAgtkbviOM5ol9Vct9K5v5M1VNf1RX\/Y9B1AS+Q9i6KIuq7rzWjiQc65Vsglf6cojmMKguBuZkjB48qy7GQiQRiGizMMz\/mdrCFeO3Lt3wt7JE9Syp+J6F+3DgSuy3Vd9SNtPOsE5vGCWSIiKeUNI4Gh5+dn1UV6L7Pv\/qR++eHWEcDbWFp5C\/BITBbkwnWgOwsAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQRgxLdv39S\/\/\/KXv9wuEIA7hyQCMEJPIj\/++OPN4gC4d0giAABgDEkEAACMIYkAAIAxJBEAADCGJAIAAMaQRAAAwBiSCAAAGEMSAQAAY0giAABgDEkEAACMIYkAAIAxJBEAADCGJAIAAMaQRAAAwBiSCAAAGEMSAQAAY0giAABgDEkEAACMIYkAAIAxJBEAADCGJAIAAMaQRAAAwBiSCAAAGEMSAQAAY0giAABgDEkEAACMIYkAAICxH9I0\/fE\/\/\/nPreO4G7\/++iv98ccftw4DbkwvA7\/99hv99NNPJ+\/\/9ttvbxwVmPjw4QN9+vTp1mHcpWG53urDhw\/\/8+R53tc8zz9fJiQAAPiz+Nvf\/vYHurMAAMDYD47jfPvrX\/+Klojm06dP9PHjx1uHATf066+\/0j\/\/+U8iIvrf\/\/1f+ve\/\/z36OZSV+\/bt2zf69u3brcO4S3\/88Qf9+uuvZ23jw4cP\/+8H3\/e\/XSYkgPfp48ePZ\/cdw238+OOP9OOPP946jLv1j3\/849xN\/F90ZwEAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkkTvluu5FttN1HT0\/P1Oe55u+dzgcqGmai8QAcK9Qz853tSRSVRXtdjt6enqi3W5HVVVda1fvjuu65HneRbaVpikJITZvz\/d9cl2Xuq67SByXFMcxpWlKRK\/H9\/z8TE9PT\/T09ERxHN84uuvb7\/fqxhOGoTr2l5eXzTexP7M\/Wz3ruo72+70qL7vd7iLl5SpJpGkacl2XHMchKSV5nkeu6z5sIuHjeYsbVBiGRPRauC4hTVOjbdm2TZ7n0X6\/P2v\/eZ5f\/NoXRUG+71OaplQUBbVtS1JKiqKIwjB814mEbzaWZdHhcCAhBEkpSUpJlmXRfr+noihuHKUZ1DNzS\/Ws6zqVrKSU1LYtCSEuU16klD\/LC\/M8Twoheq9ZliVt2770rt5ElmWSiGQURVfdT1mWkohklmUX2V6WZVIIIdu2Nfp+27ZSCGEUTxRF0rZtSUTS933jGIbKspS+70sppQyC4OR9x3FOyp6JL1++SCKSRCQ\/f\/589vYuJYoimSSJ+veQEEI6jvPWYV0E6tn16lkURZKIZF3X6rXj8SiJ6Nzy8vXiLZGmaSjPc7Jtu\/e64zhUVZVR\/18cxxfruzyHEOKq28\/z3KhJPLc9x3GM4xZCkG3bm54MwzCk5+dniuNYtUSTJLnYuSuKghzHISKiKIpO3uf33quqqlT5CILg5P1hvdviGq1GE6hny7bWs6IoSAhBlmWp1zjms6+3vHBLhJ8mhk+JQRBIIlJPUWtEUSQty5Ke5\/Uy6FDbtmr7\/Dd8msmyTPq+L4MgUFnZ87ze+47jqO9bliXrupZZlknLsnrb5sy9Zr9RFEnHcWSWZWq\/RCRt25ZlWfY+a1lW76lA\/zx\/Z+z14XaklLKua0lE8ng8jp5XIcTJ92zbPnmKH3uCGduX7\/vqvG15kqzrWj1Jjf3p10hKufjUFATBRVq8b9US4afYqePXz2Vd1yfnY8i27dEW2lIMjuOocjoF9exx65kQYrRecN07o6fg68WTCJ+MYUHm19ccOCcP3\/dnTyrTm3H6TYkrhH6Tsm1bFVqO0fM86TjOyTa4YHBiHFawpf3qNwc9ESZJIomoV5C4MA7PGzd1hzeP4\/EoLcuavPhTN9O6rlWF1L\/PlXC4PY51LvnzcS\/d4MbwNU6SRJWNIAhUl5XueDwu3iCXboRrvVUS4ZuZ7\/uqvNm2PXq+oyhaPLYt3SpJkqxKHgz17NQj1LO2bXvJcWyb5ySRu5riG8cxPT8\/U9M0VJYlJUnSa35N0ZtxlmWpAS7uOuNtEb029y3LIs\/zKIoiiuOY8jynIAh621jTPF3ab9u2qsuF90v0Ophn2zZ1XaeakjxgOtynEIIcxzkZ\/MrznHzfn4wxz\/PR5rplWRRFESVJQk3TUBiGVBQFFUVBx+NxdP96fGOyLCPf9ynPc3p5eVndLO+6Tp0Xfftd140e19QxMT6Xl+qmuLY8z1X50I956viLopg9tjiOe+V4SpqmamZOFEV0PB5XnTPUs1OPUM+u7YdLb3Dqpj918djz8zN1XUd1Xa9KHENxHFPXdVQUxUmB0fc73D9\/dtiXPNbfbrLftebGirjg6DNAiqKgsixHP5+mKXVdN9pnrm+zaRqK45iapqHj8Tgb39wxWZZFSZJQkiRqdlQcx+T7\/ux5FEKo4+GEwv8eKwNN08z2+cdxTFmWzR7HW+Dp7Ut4hgzR67HxMY8df1VVs\/WiaRpqmkbdxKe4rktFUVCSJEaziVDPvnukejaXqJfeX3LxlggXkuHF4v+eGvhs25aCIKDdbtebB7+k6zra7XYqKwdBYHQj2Trgf6n98o1Bv4EMOY5DlmX11kZ4njd54ddON+RrsWbCw9pCFkWRupZFUdDT0xMdDofFCl9V1ezTGA9eTjkcDhRF0dUHZdewbVtNu53702NtmmY29rlWWNd1FIbhYgIhIjoejxRFEaVpSq7rrl4ngHp26pHqmRBidN9LD2ZrXDyJcBN1OOJfVVWvqTmGT4xt26uTSZqmVFUVRVFEURRt7srgE7imMukX6Nz9Di01Z33fp6qqqKqq2RsKf2YpnqqqKAxDKstSzRdfE99aQRBQWZaUZZl6Sl6KZ65szB3z4XAg3\/eNWrD3gGfOzKmqajSJdl1Hh8NhVQJhfG08z1MzH5fKP+pZ36PVM8dxVEtOj63rurNnNF5lTCRJEvV0RPQ6Ha3rutVPEEEQqGTiuu6qaYd88vjiE\/ULCv97WHi4vzOOYxUvEanm59g+tux3ib54zLKsyULAhZWfyKaeHtI0JcdxZp8uqqoi13UpSRKybZuyLCMhBB0Oh5PPLrUgl3ieR8fjcbEbSp9+aFmWut56v+9YkuBFrfr2ufvgUfA0TSaEUN02vKBy7Pw3TUP7\/f6kBZbn+aqbte\/7VJalWri52+3UU\/gU1LNXj1bPeCyKuwWJXu\/Ltm3PdsetIq+w2FBK2Zuy5zjO6PS4tXhGw5i2bdWUQSGETJJEzfKg\/85IGJtCOjZ1kt+zLOtklgRPraP\/zqBYs9\/h1E19logeE88UCYJgdqEc729qBseaRUtTU7B5AZbneb2ZGo7jXHWRKM8c0a9HWZZSCKGmf+ozt3T6VNHh3znlTcq3neJLgymiPJNRn7k1PJ66rk+mxOrl1zSWqbqKetY\/F49Wzzgm\/XwMYzB0+Sm+YG6pcCZJMnuD4KnRbxXPe3avK9bhfKhnF3VfU3z\/7Hi20lRXTNd1swN5pr\/fMyWOY\/XbPgDvBerZhUm0RO6O4zijTem55u65v98zxN0ll9reo0FL5P1DPbsItETuUZZlJwOcYRjOPqmc+\/s9Q3Ecjy6KAngvUM8u40lK+TMR\/evWgcA4XoQZBMHqhVlwvq9fv9Lf\/\/53IiL6\/Pkzff369bYBwVWhnhn75eIr1uGy2ra9dQgA7x7qmTl0ZwEAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMJoxVJoAAAn9SURBVIYkAgAAxpBEAADAGJIIAAAYQxIBAABjSCIAAGAMSQQAAIwhiQAAgDEkEQAAMIYkAgAAxpBEAADAGJIIAAAYQxIBAABjd59EwjAk13Xp6emp9\/fy8kJhGFLTNLcOcVHTNBSGIe12O6qq6tbhXFSe5yfXhv\/iOD77fdgmz3MKw5Cen59Pzud+v3+YcxrHMR0OB9rv97cO5eJ2u91oeX9+fp6tD3men2xrv9+ffC4Mw7c9ICnlz\/IORVEkiUg6jiOTJOm9V5al9H1fEpEkIul53o2inNe2rYqR\/8qyvHVYV5FlmTrGKIou\/v5b+\/Lli4rn8+fPtw5nUV3X0nEcSUQyCALZtm3v\/SiKpG3bkoikZVkyy7IbRTovCIJefbnXun0J+vUY8jxv0z3D8zwphDi57m\/g610mET6BQRDMfq4sS2lZliQiadv2LU7gKnVdqwJR1\/Wtw5lV17X0PG\/x3A+VZamOcewGde77b+2RkkhZllIIIS3LWixf+sPXPSTrKRyn7\/u3DmVRFEXSsqzN9x++z9m2ffKeXh\/WXCfHcTbX2Qv5enfdWWEYUp7n5HkeRVE0+1nbtilJEiIiqqqKDofDW4S4mRBi9N\/3aL\/fU57ndx8nvOq6jlzXpa7rKMsysixr9vNJkpDjOET0WtfutXuVy9+9l0PuPuy67qKx2rZNnuepfczpuo6qqiLf9y+2\/y3uKolUVaX6bIMgWPUdx3HUZ\/M8v9tK8SiWbkJTlirQue\/DuMPhQF3Xked5ZNv2qu9kWabO96OMkdwr0\/pCtFzmOYlUVTV7X0vTlBzHOSuWc9xVEuGMa1nW6gpBROrJSt8GvC0kkbfXdR0VRUFE\/TqwRAih6ldRFNR13VXig3lrkggnhjRNJz\/HPTe3cpdJZEsCIXqtQHxB9Iytz1QZqyg882tqNkOe572ZYbvdbvZi8nf0GRMvLy+zT3vDGOM4npxlsTYeng3mui7Fcay6PPRZIHgCfXx5nqtybVJniL53hbC5OrFUn\/j7+kwhbinNCcOQXl5eerPI5p689RirquqV7eG+1sYTx7E6NqLXm7Y+w8113Zv0cix1aVVVpVqiNyPvaGBdCLFqQH0Mz3Swbbs3KMV\/+qDXcAbI2P48z+sN6vFsMSI6mS0m5ffZMY7jqMHNtm17A5l6HMMYhRDS931Z17Ws61paltUbUFsbD59D\/nMcp\/e9JEnUZ\/TXsyzrzQjR\/9YMbuoz0cYGxs99\/609wsC6Xga2Durqs+HGrr1eJ8ZmGQ73l2WZqntS9meLjQ0cc\/xCiF45T5JE1eVhHMMYHcdR3w2CQAohNsejn0O9HnIZbNtWfU8I0Zu4EASBmtgz\/FszgYbvQ1Pnh+Oeu+\/4vn\/rCRL3MztLL6gmMzL0JMKOx6O6+GOmZoFlWTY67Y4vuuM4vdfrulazY8Yqs15hh+9zjMNCEgSBKhxb45HyezIZmyLJ3xs7L3xOthZMJJG3pz8MbZ31N0wijG+YY9dff\/AZlmPbtk9ucm3bqnJ4PB577\/HD1VQ506crT72n14m2bXv\/vTUePZkMp9Tq3xvGy+dk6h4zZ00SkfL78U7V8xvPSr2f2VlCCNUldc4CQpOZUGOfG+tj5i6DYXOYu4w8z1u9reE2h5+Loqg3uWBLPLqxwTb9e5iI8Lj0svaWdUavq7phGRVCqPKnl9GmaShNUxJCTM4omuue4\/f0\/QkhqK5ro3iGhnVG\/94tu7SKouhd5ziOe135t\/LDTfc+IIQwvrFxodgywDg1m8HzPHXhuG+4KAoV17AA6hMCzjFVGLbGA38OenmpqmpT2ecyI4RY\/b258l2WJRF9nyHZdV1vvE4vo1xfppLRWnPf3RLPvfN9n+I4VsmXlz7keb64DOIt3E1LhKg\/2MezTtZomkZl6C0VaW57PFjHA9Ce51GWZSo+1nVdr0Jew5Z44DI+fvyo\/v3t27fbBTJDL+tb6gvR9yfqS9QXIlITQnhQnFsGY63la9eXrfE8guEAOyfGS12\/c9xVS8T3ffW0wHOf1+ATu2Wu\/BzXdalpmt6NWt\/PlKkuhXMLrGk8a1yqIi8d47nvv7VPnz6pf\/\/+++83jGSaZVnkeR7lea5apmvLPyedteux5vDMJiEEHY\/H1THMdcGdUx5M41njkolvyzF6nqdaI9y6utXiwqG7aokMV2kuTadlaZqSZVlq9fpaY4VY73dc01Rc0196Tn\/11ni2QhJ5bHoSWPuLDXwziqJo0w12qhxzQlr7EKePS1yrzmyJZ4tbJRHbttVDNd8bkUQmJEmiLjz\/BMoc13WJiOh4PE5e4K7rTgrlVAHWPzfc3lSB54s5tWJ+LhkuVRaTeLbAzfux2batHi54zcQcXusRBMFsK2TqAWvus8Py2TTNaPnyfV8lkrH1SlVVzXbPra0za+PZ4pb1RX\/AvocBdXZ3SUQIQWVZkuM41HUd7ff70cVHcRzTy8sLEb0Ook3NQuLX9ae0NE3JdV31nl4o9ScXLuBd16nfxxkTBIF6Stjv972kcTgcetscVg5932MVxyQe3dJnhhWSCybHsrZFqMe+dAMyeR+mBUGgfsqkKIrRBa5VVdF+v6fD4UBJkky2arm85XmuHuC4HuoTOcbqTJ7n6vU0TWfLjT44vN\/vVTnl8qb\/5McQ72Mq0ZjEo5urM1P1pes6db7Wtgj52NaWd9\/31f5uurhwSN7JOpExZVmqRUSkLeSxLEsGQbDqJ5L1RUb8x3PPh4uXhusy+HVet6LPraeROey8eIrfdxxHtm07uvhx7LVhHGxLPMNzNRbrcIEVafP+9cVVfAxzhjEMj+Pc929Jj+VRRFF0Ut7pv+uF1p7PsXKcZdnoAlmm1yXbttXaE33hoF7OpHyt33qsQgi1tmNs8ePUYti59U5L8YzVhbFYh\/VKr0\/6Al4aWYMyNIxh7jiGfN83WpNyRV+fpJQ\/E9G\/xhLMPUnTVD19+75Ptm3fTZ8gvE9PT0\/q31LKG0ayHbceiqJQ\/elBENxNFwi8G788RBLhnycfw\/2rl5hlAqB71CTC4x5j3SScUPRxCYAz\/HJ3YyJDcRyTEIKklCSlpCiKei0QbqHoP0oI8GfGC9KklFTXNQVBoMYJ+P9uQf\/BQ\/zyNZzjIVoiU3g2FA+g+b5PURShyQ4X8agtkTncQsnzXHUJo1sYzvAY3VkAt\/AekwjAhd1\/dxYAANwvJBEAADCGJAIAAMaQRAAAwBiSCAAAGEMSAQAAY0giAABgDEkEAACMIYkAAIAxJBEAADCGJAIAAMaQRAAAwBiSCAAAGEMSAQAAY0giAABgDEkEAACMIYkAAIAxJBEAADCGJAIAAMaQRAAAwBiSCAAAGEMSAQAAY0giAABgDEkEYMKHDx\/Uv799+3a7QADuGJIIwIRPnz6pfyOJAIxDEgEAAGP\/H45glBIkswaJAAAAAElFTkSuQmCC","width":401}
%---
%[text:image:5ea2]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:dropdown:8b16]
%   data: {"defaultValue":"\"math\"","itemLabels":["math","navigation","physics"],"items":["\"math\"","\"navigation\"","\"physics\""],"label":"Convention","run":"Nothing"}
%---
%[control:button:477e]
%   data: {"label":"Create problem","run":"Section"}
%---
%[text:image:49b9]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:8b63]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:editfield:6706]
%   data: {"defaultValue":"\"(x,y,z)\"","label":"The new coordinates are: ","run":"Nothing","valueType":"String"}
%---
%[control:button:637c]
%   data: {"label":"Submit","run":"Section"}
%---
%[text:image:99f3]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:editfield:8745]
%   data: {"defaultValue":42.28,"label":"Latitude = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:5b6d]
%   data: {"defaultValue":-71.35,"label":"Longitude = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:4b73]
%   data: {"defaultValue":48.86,"label":"Latitude = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:9dfa]
%   data: {"defaultValue":2.35,"label":"Longitude = ","run":"Nothing","valueType":"Double"}
%---
%[control:button:58e8]
%   data: {"label":"Plot these geographical locations","run":"Section"}
%---
%[control:button:130c]
%   data: {"label":"Plot the great circle path and rhumb line path","run":"Section"}
%---
%[control:dropdown:16ad]
%   data: {"defaultValue":"\"satellite\"","itemLabels":["satellite","bluegreen","streets-light","grayterrain","grayland"],"items":["\"satellite\"","\"bluegreen\"","\"streets-light\"","\"grayterrain\"","\"grayland\""],"label":"Map option: ","run":"AllSections"}
%---
%[text:image:367f]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
