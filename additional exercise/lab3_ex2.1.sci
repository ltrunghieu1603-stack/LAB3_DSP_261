clear; clc;

// --- 1. Tao truc thoi gian n va tin hieu x(n) ---
n = -10:10; 
x = zeros(1, length(n));

for i = 1:length(n)
    if n(i) >= -3 & n(i) <= -1 then
        x(i) = 1 + n(i)/3;
    elseif n(i) >= 0 & n(i) <= 3 then
        x(i) = 1;
    else
        x(i) = 0;
    end
end

// --- Ve do thi (a): Tin hieu x(n) ---
figure(1);
plot2d3(n, x, 2);      
plot2d(n, x, -9);      
xtitle("Cau (a): Tin hieu x(n)", "n", "Bien do");
xgrid(1);

// --- 2. Tao tin hieu y1(n) = x(-n + 4) cho cau (b.1) va (c) ---
y1 = zeros(1, length(n));
for i = 1:length(n)
    idx = -n(i) + 4; 
    pos = find(n == idx); 
    if ~isempty(pos) then
        y1(i) = x(pos);
    end
end

// --- Ve do thi (b.1) & (c): x(-n + 4) ---
figure(2);
plot2d3(n, y1, 5);     
plot2d(n, y1, -9);
xtitle("Cau (b.1) va (c): Tin hieu x(-n + 4)", "n", "Bien do");
xgrid(1);

// --- 3. Tao tin hieu y2(n) = x(-n - 4) cho cau (b.2) ---
y2 = zeros(1, length(n));
for i = 1:length(n)
    idx = -n(i) - 4; 
    pos = find(n == idx);
    if ~isempty(pos) then
        y2(i) = x(pos);
    end
end

// --- Ve do thi (b.2): x(-n - 4) ---
figure(3);
plot2d3(n, y2, 3);     
plot2d(n, y2, -9);
xtitle("Cau (b.2): Tin hieu x(-n - 4)", "n", "Bien do");
xgrid(1);
