// align_signals.sci
// Helper: put two finite-length signals on one common time axis.
// Samples outside the support of a signal are filled with zeros.
//   [y1, y2, n, yorigin] = align_signals(x1n, x1origin, x2n, x2origin)
//   y1, y2  : zero-padded versions of x1 and x2, both with length(n) samples
//   n       : common time axis
//   yorigin : index of n = 0 inside y1 / y2
function [y1, y2, n, yorigin] = align_signals(x1n, x1origin, x2n, x2origin)
    n1 = time_axis(x1n, x1origin);
    n2 = time_axis(x2n, x2origin);

    n_first = min(n1(1), n2(1));
    n_last  = max(n1($), n2($));

    n       = n_first:n_last;
    yorigin = 1 - n_first;

    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    y1(n1 - n_first + 1) = x1n;        // drop x1 at its own position
    y2(n2 - n_first + 1) = x2n;        // drop x2 at its own position
endfunction
