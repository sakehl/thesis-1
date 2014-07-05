# vim: filetype=gnuplot

set title ""

set terminal pdf size 3,2.2
set output "bandwidth.pdf"

set key on
set key bottom

set xlabel "Size (bytes)"
set logscale x
set xrange [820:80530637]

set xtics ("1k" 1024, "5k" 5*1024, "20k" 20*1024, "80k" 80*1024,        \
           "300k" 300*1024, "1M" 1024*1024, "4M" 4*1024*1024,           \
           "16M" 16*1024*1024, "64M" 64*1024*1024 )

set ylabel "Bandwidth (GB/s)"
set logscale y

plot    'bandwidth.dat' using ($1):(($1/1024/1024/1024) / ($2/1000))         \
                title "Host to Device"  ls 1  lw 4 with lines,          \
        'bandwidth.dat' using ($1):(($1/1024/1024/1024) / ($3/1000))         \
                title "Device to Host"  ls 3  lw 4 with lines

