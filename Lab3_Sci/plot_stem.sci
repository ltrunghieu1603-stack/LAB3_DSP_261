function plot_stem(n, x, clr, ttl, ylab, xlim)
    plot2d3(n, x, style = clr);        // vertical stems
    xtitle(ttl, "n", ylab);
    xgrid();

    ymin = min(0, min(x));
    ymax = max(0, max(x));
    pad  = 0.2 * (ymax - ymin);
    if pad == 0 then
        pad = 1;
    end

    a = gca();
    a.data_bounds = [xlim(1), ymin - pad; xlim(2), ymax + pad];
endfunction
