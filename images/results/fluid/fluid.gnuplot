# vim: filetype=gnuplot

set title "Fluid Flow"

set terminal pdf size 3,2.2
set output "fluid.pdf"

set key on
set key bottom

set xlabel "Image Size (total pixels)"
set logscale x
set xrange [5000:4000000]
set xtics \
        ( "1k"     1024,   "2k"   2048,  "4k"   4096, "8k"   8192 \
        , "16k"   16384,  "32k"  32768, "64k"  65536, "128k" 131072 \
        , "256k" 262144, "512k" 524288, "1M" 1048576, "2M"   2097152)

set ylabel "Run Time (ms)"
set logscale y
set yrange [0.5:10000]

plot    'fluid.dat' using ($1*$1):($5)                          \
                title "C sequential"                            \
                ls 5  lw 4 with linespoints,                    \
        'fluid.dat' using ($1*$1):($4)                          \
                title "Repa"                                    \
                ls 4  lw 4 with linespoints,                    \
        'fluid.dat' using ($1*$1):($2)                          \
                title "Accelerate"                              \
                ls 1  lw 4 with linespoints,                    \
        'fluid.dat' using ($1*$1):($3)                          \
                title "... +sharing"                            \
                ls 2  lw 4 with linespoints
