%% ѕроверка решений нейронной сети, движение по кругу
M=[-178:10:178]; % массив изменений первого узла от -178 градусов до +178 градусов с шагом 10
M_size=length(M);
first_q=zeros(M_size, 3);
T33 = zeros(4, 4, M_size);
T34 = zeros(4, 4, M_size);
first_q(:,1)=[deg2rad(M)]; % подготавливаем q
T33(:, :, :) = leftArm.fkine(first_q);% получаем координаты куда должен прийти робот, круговое движение

R = tr2rpy(T33(1:3, 1:3, :), 'arm'); % получаем тангаж рыскание и крен
Tx = reshape(T33(1, 4, :), [M_size 1]); % все ’-ы
Ty = reshape(T33(2, 4, :), [M_size 1]);
Tz = reshape(T33(3, 4, :), [M_size 1]);
plot3(Tx,Ty,Tz)
axis([-1 1 -1 1 -1 1]);hold on;grid on;
XX = horzcat(Tx, Ty, Tz, R); % массив координат в формате дл€ нейронной сети

T34(:, :, :) = leftArm.fkine(q_new); % по результатам решений нейронной сети, получаем координаты
Tx2 = reshape(T34(1, 4, :), [M_size 1]); % все ’-ы
Ty2 = reshape(T34(2, 4, :), [M_size 1]);
Tz2 = reshape(T34(3, 4, :), [M_size 1]);
plot3(Tx2,Ty2,Tz2,'.')
axis([-1 1 -1 1 -1 1])