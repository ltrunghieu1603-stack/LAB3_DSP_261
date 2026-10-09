clear; clc;

// 1. Dinh nghia ham bieu dien tin hieu goc x(n)
function val = x_func(n_vec)
    val = zeros(1, length(n_vec));
    for i = 1:length(n_vec)
        if n_vec(i) >= -2 & n_vec(i) <= 1 then
            val(i) = 1;
        elseif n_vec(i) == 2 | n_vec(i) == 3 then
            val(i) = 0.5;
        else
            val(i) = 0;
        end
    end
endfunction

// Khoi tao truc thoi gian n
n = -6:7; 

// 2. Tinh toan cac tin hieu
x_n = x_func(n);             // Goc
ya  = x_func(n - 2);         // (a)
yb  = x_func(4 - n);         // (b)
yc  = x_func(n + 2);         // (c)

// (d) x(n)*u(2-n)
u = zeros(1, length(n));
u(find(n <= 2)) = 1;         
yd = x_n .* u;

// (e) x(n-1)*delta(n-3)
delta = zeros(1, length(n));
delta(find(n == 3)) = 1;     
ye = x_func(n - 1) .* delta;

// (f) x(n^2)
yf = x_func(n.^2);

// (g) Hiep phan chan & (h) Hiep phan le
x_minus_n = x_func(-n);
yg = 0.5 * (x_n + x_minus_n);
yh = 0.5 * (x_n - x_minus_n);

// 3. Ve hinh doc lap va tu dong xuat ra file PNG
// Cac file anh se duoc tu dong luu de ban chen vao LaTeX

figure(0);
plot2d3(n, x_n, 2); plot2d(n, x_n, -9);
xtitle("Tin hieu goc: x(n)", "n", "Bien do"); xgrid(1);
xs2png(0, "bai2_2_goc.png");

figure(1);
plot2d3(n, ya, 5); plot2d(n, ya, -9);
xtitle("Cau (a): x(n-2)", "n", "Bien do"); xgrid(1);
xs2png(1, "bai2_2_a.png");

figure(2);
plot2d3(n, yb, 3); plot2d(n, yb, -9);
xtitle("Cau (b): x(4-n)", "n", "Bien do"); xgrid(1);
xs2png(2, "bai2_2_b.png");

figure(3);
plot2d3(n, yc, 6); plot2d(n, yc, -9);
xtitle("Cau (c): x(n+2)", "n", "Bien do"); xgrid(1);
xs2png(3, "bai2_2_c.png");

figure(4);
plot2d3(n, yd, 13); plot2d(n, yd, -9);
xtitle("Cau (d): x(n)u(2-n)", "n", "Bien do"); xgrid(1);
xs2png(4, "bai2_2_d.png");

figure(5);
plot2d3(n, ye, 9); plot2d(n, ye, -9);
xtitle("Cau (e): x(n-1)delta(n-3)", "n", "Bien do"); xgrid(1);
xs2png(5, "bai2_2_e.png");

figure(6);
plot2d3(n, yf, 10); plot2d(n, yf, -9);
xtitle("Cau (f): x(n^2)", "n", "Bien do"); xgrid(1);
xs2png(6, "bai2_2_f.png");

figure(7);
plot2d3(n, yg, 7); plot2d(n, yg, -9);
xtitle("Cau (g): Phan chan x_e(n)", "n", "Bien do"); xgrid(1);
xs2png(7, "bai2_2_g.png");

figure(8);
plot2d3(n, yh, 12); plot2d(n, yh, -9);
xtitle("Cau (h): Phan le x_o(n)", "n", "Bien do"); xgrid(1);
xs2png(8, "bai2_2_h.png");
