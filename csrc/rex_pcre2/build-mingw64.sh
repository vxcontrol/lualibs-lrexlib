[ `uname` = Linux ] && { export X=x86_64-w64-mingw32-; }
P=mingw64 C="-fPIC" L="-s -static-libgcc ../../bin/$P/pcre2-8.a ../../bin/$P/pcre2-posix.a ../../bin/$P/luajit.a" \
    D=rex_pcre2.dll A=rex_pcre2.a ./build.sh
