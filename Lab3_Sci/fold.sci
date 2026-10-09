function [yn, yorigin] = fold(xn, xorigin)
    xn      = matrix(xn, 1, -1);
    N       = length(xn);
    yn      = xn(N:-1:1);              // reversed samples
    yorigin = N - xorigin + 1;         // mirrored origin index

    n_x = time_axis(xn, xorigin);
    n_y = time_axis(yn, yorigin);
    lim = [min(n_x(1), n_y(1)) - 1, max(n_x($), n_y($)) + 1];

    scf();                             // new graphic window
    subplot(2, 1, 1);
    plot_stem(n_x, xn, 2, "Tín hiệu gốc x(n)", "x(n)", lim);
    subplot(2, 1, 2);
    plot_stem(n_y, yn, 5, "Tín hiệu đảo ngược y(n)", "y(n)", lim);
endfunction
