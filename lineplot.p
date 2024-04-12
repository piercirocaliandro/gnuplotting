# Run with gnuplot -e "load 'lines.p'" > plot.pdf

## Magic command 
set terminal pdfcairo size 4.2in,2.2in font 'Helvetica,12'

## Color definition
grey = '#818589';
black = '#28282B';

## Legend settings
set key right bottom

## Axes settings
set logscale y 10
# set yrange [0.0001:20.0]
set yrange [0.001:1.2]

set xlabel "Range (a, b)"
set ylabel "Execution time"


## PLOT IT.
plot "rsa/plain.dat" using 2:xticlabels(1) title 'Native' with linespoints lw 2 lc rgb grey, "rsa/virt.dat" using 2:xticlabels(1) title 'Virtualised' with linespoints lw 2 lc rgb black 
