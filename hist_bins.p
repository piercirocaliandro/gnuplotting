# This script generates an histogram which divides the range
# (0, 1) inot 20 bins (each of size .05)
# It is suited, for example, for plotting some distribution
# or some normalized values
#
# Run with gnuplot -e "load 'hist.p'" > bars.pdf

## '''Magic''' command
set terminal pdfcairo size 6.2in,4.2in font 'Helvetica,12'

# Color definition
torvergreen = '#007D34';
red-orange = "#D6604D";

bin_width = 0.05
bin_number(x) = floor(x/bin_width)
rounded(x) = bin_width * ( bin_number(x) + 0.5 )

set boxwidth 0.025 absolute

set border 3
set style fill solid 1.0 border lt -1

set xrange[0:1.0]
set yrange[0:5500]
set xlabel "Bins"
set ylabel "Numer of items"

unset key

set title "Distribution of generated elements for\nv_xorshift128plus algorithm(VMORPHed execution)"

UNITY = 1

# NB: change the src file path
plot "virtualised/v_xorshift128plus_norm.dat" u (rounded($1)):(UNITY) t 'data' smooth frequency w boxes lc rgb "#007D34"
