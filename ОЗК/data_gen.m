close all;
N = 3000;
[L,initialPose_left,baseL, R,initialPose_right,baseR] =model3z;
leftArm = SerialLink(L, 'name', '3Z', 'base', baseL);

leftArm.plot(initialPose_left);
 hold on
 grid on
%Получаем минимальное и максимальное возможное положение сервоприводов
% t1_min = L(1).qlim(1); t1_max = L(1).qlim(2); 
% t2_min = L(2).qlim(1); t2_max = L(2).qlim(2);
% t3_min = L(3).qlim(1); t3_max = L(3).qlim(2);
% 
% % массив случайных положений сервоприводов
% t1 = t1_min + (t1_max-t1_min)*rand(N,1);
% t2 = t2_min + (t2_max-t2_min)*rand(N,1);
% t3 = t3_min + (t3_max-t3_min)*rand(N,1);
% Y = horzcat(t1, t2, t3); 

% массив матриц преобразований 4x4
% T = zeros(4, 4, N);
% T(:, :, :) = leftArm.fkine(Y); % прямая задача, получаем координаты положения по углам сервопривода
% 
% %R = tr2rpy(T(1:3, 1:3, :), 'arm'); % получаем тангаж рыскание и крен
% R = tr2eul(T(1:3, 1:3, :)); % получаем тангаж рыскание и крен
% Tx = reshape(T(1, 4, :), [N 1]); % все Х-ы
% Ty = reshape(T(2, 4, :), [N 1]);
% Tz = reshape(T(3, 4, :), [N 1]);
%  scatter3(Tx,Ty,Tz,'.','r');
% 
% X = horzcat(Tx, Ty, Tz, R); % массив координат
% csvwrite('X1.csv',X);
% csvwrite('Y1.csv',Y);
