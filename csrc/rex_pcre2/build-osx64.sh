[ `uname` = Linux ] && { export X=x86_64-apple-darwin19-; export CC=clang; }
P=osx64 C="-arch x86_64 -fPIC" L="-arch x86_64 ../../bin/$P/libpcre2-8.a ../../bin/$P/libpcre2-posix.a -undefined dynamic_lookup" \
	D=rex_pcre2.so A=librex_pcre2.a ./build.sh
