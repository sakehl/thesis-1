# vim: filetype=gnuplot

set title "N-Body"

set terminal pdf size 3,2.2
set output "nbody.pdf"

set key on
set key left

set xlabel "Bodies"
set logscale x
set xrange [768:49152]

set xtics ("1k" 1024, "2k" 2048, "4k" 4096, "8k" 8192, "16k" 16384, "32k" 32768)

set ylabel "Run Time (ms)"
set logscale y
set yrange [0.05:6000]

plot    'nbody-nofusion.dat' using ($1):($2)                            \
                title "Accelerate"                                      \
                ls 1  lw 4 with linespoints,                            \
        'nbody-nofusion.dat' using ($1):($3)                            \
                title "... +sharing"                                    \
                ls 2  lw 4 with linespoints,                            \
        'nbody.dat' using ($1):($2)                                     \
                title "... +fusion"                                     \
                ls 3  lw 4 with linespoints,                            \
        'nbody.dat' using ($1):($3)                                     \
                title "... +iteration"                                  \
                ls 4  lw 4 with linespoints,                           \
        'nbody.dat' using ($1):($4)                                     \
                title "CUDA"                                            \
                ls 5  lw 4 with linespoints

