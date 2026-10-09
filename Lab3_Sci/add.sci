function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    x1n = matrix(x1n, 1, -1);
    x2n = matrix(x2n, 1, -1);

    [y1, y2, n, yorigin] = align_signals(x1n, x1origin, x2n, x2origin);
    yn = y1 + y2;

    n1  = time_axis(x1n, x1origin);
    n2  = time_axis(x2n, x2origin);
    lim = [n(1) - 1, n($) + 1];

    scf();                             // new graphic window
    subplot(3, 1, 1);
    plot_stem(n1, x1n, 5, "Tín hiệu x1(n)", "Biên độ", lim);
    subplot(3, 1, 2);
    plot_stem(n2, x2n, 2, "Tín hiệu x2(n)", "Biên độ", lim);
    subplot(3, 1, 3);
    plot_stem(n, yn, 3, "Tín hiệu tổng y(n) = x1(n) + x2(n)", "Biên độ", lim);
endfunction
