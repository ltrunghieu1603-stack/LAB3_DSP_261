clear; clc;

// 1. Khoi tao truc thoi gian n rong hon de de quan sat
n = -5:5; 

// Khoi tao mang x toan so 0 voi chieu dai bang mang n
x = zeros(1, length(n));

// Dua cac gia tri {2, 3, 4, 5, 6} vao dung cac vi tri n = -2, -1, 0, 1, 2
x(find(n >= -2 & n <= 2)) = [2, 3, 4, 5, 6];

// 2. Tinh toan tin hieu gap va cac thanh phan
// Do truc n da doi xung (-5 den 5), phep gap thoi gian x(-n) chinh la dao chieu truc tiep mang x
x_minus_n = x($:-1:1); 

// Tinh thanh phan chan (Even) va le (Odd)
x_e = 0.5 * (x + x_minus_n); 
x_o = 0.5 * (x - x_minus_n); 

// 3. Ve do thi minh hoa tung y tren cac hinh rieng biet
figure(0);
plot2d3(n, x, 2); plot2d(n, x, -9);
xtitle("Tin hieu goc x(n)", "n", "Bien do"); xgrid(1);

figure(1);
plot2d3(n, x_e, 7); plot2d(n, x_e, -9);
xtitle("Thanh phan chan x_e(n)", "n", "Bien do"); xgrid(1);

figure(2);
plot2d3(n, x_o, 12); plot2d(n, x_o, -9);
xtitle("Thanh phan le x_o(n)", "n", "Bien do"); xgrid(1);
