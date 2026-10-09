clc; clear;

root  = get_absolute_file_path("main.sce");
files = ["time_axis", "plot_stem", "align_signals", "delay", "advance", ..
         "fold", "add", "multi", "convolution"];
for i = 1:size(files, "*")
    exec(root + files(i) + ".sci", -1);
end

function show(name, yn, yorigin)
    mprintf("%-22s yn = [%s], yorigin = %d\n", name, strcat(string(yn), ", "), yorigin);
endfunction

// Exercise 1: delay
[yn, yo] = delay([1, -2, 3, 6], 3, 1);       show("delay ", yn, yo);    // [1,-2,3,6], 2

 [yn, yo] = delay([4, 0, -3, 7, 2], 3, -1);    show("delay (k<0)", yn, yo);      // [4,0,-3,7,2], 0


// Exercise 2: advance
[yn, yo] = advance([1, -2, 3, 6], 3, 1);     show("advance", yn, yo);  // [1,-2,3,6], 4

// Exercise 3: fold
[yn, yo] = fold([1, -2, 3, 6], 3);           show("fold", yn, yo);     // [6,3,-2,1], 2


// Exercise 4: add
[yn, yo] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);  show("add", yn, yo);  // [1,1,3,6,-2], 2


// Exercise 5: multi
[yn, yo] = multi([0, 1, 3, -2], 1, [1, 1, 2, 3], 2); show("multi", yn, yo); // [0,0,2,9,0], 2


// Exercise 6: convolution
[yn, yo] = convolution([2, 1, -1, 3], 2, [1, 2, 1], 1);   show("convolution", yn, yo); // [2,5,3,2,5,3], 2

