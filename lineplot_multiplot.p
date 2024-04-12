# Run with gnuplot -e "load 'lines.p'" > plot.pdf

set terminal pdfcairo size 6.2in,2.2in font 'Helvetica,12'

# Mulitplotting
set multiplot layout 1,2 rowsfirst


# Axes settings
set logscale y 10
# set xtics rotate by -20

set yrange [0.0001:20.0]
set key right bottom

set title "PCB: seeking prime numbers with modular divison"
set xlabel "Execution number"
set ylabel "Execution time"
plot "pcb/plain.dat" using 2:xticlabels(1) title 'Native' with linespoints lw 3 lc rgb '#818589', "pcb/virt.dat" using 2:xticlabels(1) title 'Virtualised' with linespoints lw 3 lc rgb '#28282B'

# Plot 2
set logscale y 10
# set xtics rotate by -20
set yrange [0.001:1.2]
set key right bottom
set title "RSA encryption/decryption"
set xlabel "Execution number"
set ylabel "Execution time"
plot "rsa/plain.dat" using 2:xticlabels(1) title 'Native' with linespoints lw 3 lc rgb '#818589', "rsa/virt.dat" using 2:xticlabels(1) title 'Virtualised' with linespoints lw 3 lc rgb '#28282B'

unset multiplot
