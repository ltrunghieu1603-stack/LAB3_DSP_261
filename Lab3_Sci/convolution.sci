function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    xn = matrix(xn, 1, -1);
    hn = matrix(hn, 1, -1);
    Lx = length(xn);
    Lh = length(hn);

    yn = zeros(1, Lx + Lh - 1);
    for i = 1:Lx
        yn(i : i + Lh - 1) = yn(i : i + Lh - 1) + xn(i) * hn;
    end
    yorigin = xorigin + horigin - 1;

    n_x = time_axis(xn, xorigin);
    n_h = time_axis(hn, horigin);
    n_y = time_axis(yn, yorigin);
    lim = [min([n_x(1), n_h(1), n_y(1)]) - 1, max([n_x($), n_h($), n_y($)]) + 1];

    scf();                             // new graphic window
    subplot(3, 1, 1);
    plot_stem(n_x, xn, 2, "Tín hiệu x(n)", "Biên độ", lim);
    subplot(3, 1, 2);
    plot_stem(n_h, hn, 5, "Hàm đặc trưng h(n)", "Biên độ", lim);
    subplot(3, 1, 3);
    plot_stem(n_y, yn, 3, "Tín hiệu tích chập y(n) = x(n) * h(n)", "Biên độ", lim);
endfunction
