clear; clc;

// 1. Khoi tao truc thoi gian n va chieu dai
n = -4:8;
len = length(n);

// 2. Khoi tao cac mang chua gia tri 0
x = zeros(1, len);
y = zeros(1, len);
y_delayed = zeros(1, len);
x2 = zeros(1, len);
y2 = zeros(1, len);

// 3. Tinh toan tung tin hieu qua vong lap for
for i = 1:len
    // (1) Dau vao x(n): Bang 1 khi 0 <= n <= 3
    if n(i) >= 0 & n(i) <= 3 then
        x(i) = 1;
    end
    
    // (2) Dap ung y(n) = x(n^2): Bang 1 khi 0 <= n^2 <= 3
    if (n(i)^2) >= 0 & (n(i)^2) <= 3 then
        y(i) = 1;
    end
    
    // (3) Dau ra bi tre y'(n) = y(n-2) = x((n-2)^2)
    if ((n(i)-2)^2) >= 0 & ((n(i)-2)^2) <= 3 then
        y_delayed(i) = 1;
    end
    
    // (4) Dau vao bi tre x2(n) = x(n-2)
    if (n(i)-2) >= 0 & (n(i)-2) <= 3 then
        x2(i) = 1;
    end
    
    // (5) Dap ung voi dau vao tre y2(n) = x2(n^2) = x(n^2 - 2)
    if ((n(i)^2)-2) >= 0 & ((n(i)^2)-2) <= 3 then
        y2(i) = 1;
    end
end

// 4. Ve 5 do thi tren cac cua so rieng biet
figure(1); clf;
plot2d3(n, x, 2);         // Ve duong thang dung (mau xanh duong)
plot2d(n, x, -9);         // Ve cham tron tren dinh
xtitle("(1) Dau vao x(n)");
xgrid(1);                 // Ve luoi toa do

figure(2); clf;
plot2d3(n, y, 5);         // Mau do
plot2d(n, y, -9);
xtitle("(2) Dap ung y(n) = x(n^2)");
xgrid(1);

figure(3); clf;
plot2d3(n, y_delayed, 3); // Mau xanh la
plot2d(n, y_delayed, -9);
xtitle("(3) Dau ra bi tre y(n-2)");
xgrid(1);

figure(4); clf;
plot2d3(n, x2, 6);        // Mau cyan
plot2d(n, x2, -9);
xtitle("(4) Dau vao bi tre x2(n) = x(n-2)");
xgrid(1);

figure(5); clf;
plot2d3(n, y2, 13);       // Mau cam
plot2d(n, y2, -9);
xtitle("(5) Dap ung voi vao tre y2(n)");
xgrid(1);

// 5. Kiem tra va in ket luan ra man hinh Console
disp("===== KIEM TRA TINH BAT BIEN =====");
if isequal(y_delayed, y2) then
    disp("y(n-2) GIONG y2(n) -> He thong BAT BIEN (Time-Invariant)");
else
    disp("y(n-2) KHAC y2(n) -> He thong THAY DOI THEO THOI GIAN (Time-Variant)");
end
