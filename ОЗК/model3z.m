%Кинематическая модель манипулятора
function [L,initialPose_left,baseL, R,initialPose_right,baseR] =model3z


% Левая рука
initialPose_left = deg2rad([0 0 0]);

L(1) = Revolute('d',  0.2, 'alpha',  pi/2, 'qlim', initialPose_left(1)+deg2rad([-90 +90]) );
L(2) = Revolute('d',  0, 'alpha',  0,       'a', 0.4,  'qlim', initialPose_left(2)+deg2rad([-20 +90]));  
L(3) = Revolute('d',  0,   'alpha',  0,  'a', 0.4, 'qlim', initialPose_left(2)+deg2rad([-90 +90]));
% -178 +178
baseL = [1 0 0 -0; 
        0 1 0 0; 
        0 0 1 0; 
        0 0 0 1];
% baseL = [0 0 -1 -0.2; 0 1 0 0; 1 0 0 0; 0 0 0 1];


% Правая рука
initialPose_right = deg2rad([0 0 0]);

R(1) = Revolute('d',  0.2, 'alpha',  pi/2, 'qlim', initialPose_right(1)+deg2rad([-60 +120]) );
R(2) = Revolute('d',  0, 'alpha',  0,       'a', 0.4,  'qlim', initialPose_right(2)+deg2rad([-90 +90]));  
R(3) = Revolute('d',  0,   'alpha',  0,  'a', 0.4, 'qlim', initialPose_right(2)+deg2rad([-90 +90]));

baseR = [1 0 0 0; 
        0 1 0 0; 
        0 0 1 0; 
        0 0 0 1];   
    
% baseR = [0 0 -1 0.2; 0 1 0 0; 1 0 0 0; 0 0 0 1];

end