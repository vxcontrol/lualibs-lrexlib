P=linux64 C="-fPIC" L="-s -static-libgcc ../../bin/$P/libpcre2-8.a ../../bin/$P/libpcre2-posix.a" \
    D=rex_pcre2.so A=librex_pcre2.a ./build.sh
