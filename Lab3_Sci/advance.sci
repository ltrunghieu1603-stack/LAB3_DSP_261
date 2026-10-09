function [yn, yorigin] = advance(xn, xorigin, k)
    if k <= 0 | k <> round(k) then
        error("advance: k must be a positive integer (k > 0).");
    end

    xn      = matrix(xn, 1, -1);
    yn      = xn;
    yorigin = xorigin + k;

    n_x = time_axis(xn, xorigin);
    n_y = time_axis(yn, yorigin);
    lim = [min(n_x(1), n_y(1)) - 1, max(n_x($), n_y($)) + 1];

    scf();                             // new graphic window
    subplot(2, 1, 1);
    plot_stem(n_x, xn, 2, "Tín hiệu gốc x(n)", "x(n)", lim);
    subplot(2, 1, 2);
    plot_stem(n_y, yn, 5, "Tín hiệu sớm y(n)", "y(n)", lim);
endfunction
