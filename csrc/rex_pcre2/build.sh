[ "$CC" ] || CC=gcc
mkdir -p ../../bin/$P/clib
CD="-Isrc -Ipcre2/$P -I../lua-headers -DPCRE2_CODE_UNIT_WIDTH=8 -DVERSION=\"2.9.0\""
${X}${CC} -c -O2 $C $CD src/*.c
${X}${CC} -c -O2 $C $CD src/pcre2/*.c
${X}${CC} *.o -shared -o ../../bin/$P/clib/$D $L
rm -f      ../../bin/$P/$A
${X}ar rcs ../../bin/$P/$A *.o
rm *.o
