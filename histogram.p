# This script generatas a clustered histogram

# Run with gnuplot -e "load 'bars.p'" > bars.pdf

## '''Magic''' command
set terminal pdfcairo size 4.2in,2.2in font 'Helvetica,10'

## Color definition
black = '#28282B';
blue = '#0047AB';
torvergreen = '#007D34';
redorange = '#D6604D';

## Bars

set style data histogram
# set style histogram cluster
# set style histogram nokeyseparators
set style fill solid
boxwidth=1
set boxwidth 1 absolute

set auto x
set xtics ("ZoneAlarm" 1,"Microsoft" 2,"Avira" 3,"Google" 4,"MicroWorld-eScanset" 5)
set xtics rotate by -10

set key at 0.65, 0.95

set xlabel "Antivirus"
set ylabel "Detection rate"
set yrange [0:1.0]
set title "Best 5 antivirus detection rate variation"

# N.B: Change the data file path
plot "av/av.dat" using ($2-boxwidth/3) title 'Native' lc rgb black, "av/av.dat" using ($3) lc rgb torvergreen title 'VMORPH', "av/av.dat" using ($5+boxwidth/3) lc rgb blue title 'UPX'
