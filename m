From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 May 2012 23:37:33 +0000 (UTC)
Subject: [Buildroot] [Bug 5222] pango1.14.x build failed for ARM
In-Reply-To: <bug-5222-163@https.bugs.busybox.net/>
References: <bug-5222-163@https.bugs.busybox.net/>
Message-ID: <20120517233733.1EB5096D21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5222

--- Comment #3 from rdghx <rdghx@163.com> 2012-05-17 23:37:32 UTC ---
1. first buliding error is in host-libpng-1.14.11
   >>> host-libpng 1.4.11 Building
PATH=/usr/work/buildroot/buildroot-2012.02/output/host/bin:/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/FriendlyARM/toolschain/4.5.1/bin
LD_LIBRARY_PATH="/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib:"
PKG_CONFIG="/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/pkg-config"
PKG_CONFIG_LIBDIR="/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib/pkgconfig"
PERLLIB="/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/usr/work/buildroot/buildroot-2012.02/output/build/host-libpng-1.4.11/
make[1]: Entering directory
`/usr/work/buildroot/buildroot-2012.02/output/build/host-libpng-1.4.11'
/usr/bin/make  all-am
make[2]: Entering directory
`/usr/work/buildroot/buildroot-2012.02/output/build/host-libpng-1.4.11'
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-png.lo -MD -MP -MF .deps/libpng14_la-png.Tpo -c -o
libpng14_la-png.lo `test -f 'png.c' || echo './'`png.c
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngset.lo -MD -MP -MF .deps/libpng14_la-pngset.Tpo -c -o
libpng14_la-pngset.lo `test -f 'pngset.c' || echo './'`pngset.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngset.lo -MD -MP -MF .deps/libpng14_la-pngset.Tpo -c pngset.c 
-fPIC -DPIC -o .libs/libpng14_la-pngset.o
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-png.lo -MD -MP -MF .deps/libpng14_la-png.Tpo -c png.c  -fPIC -DPIC
-o .libs/libpng14_la-png.o
mv -f .deps/libpng14_la-png.Tpo .deps/libpng14_la-png.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngget.lo -MD -MP -MF .deps/libpng14_la-pngget.Tpo -c -o
libpng14_la-pngget.lo `test -f 'pngget.c' || echo './'`pngget.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngget.lo -MD -MP -MF .deps/libpng14_la-pngget.Tpo -c pngget.c 
-fPIC -DPIC -o .libs/libpng14_la-pngget.o
mv -f .deps/libpng14_la-pngset.Tpo .deps/libpng14_la-pngset.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngrutil.lo -MD -MP -MF .deps/libpng14_la-pngrutil.Tpo -c -o
libpng14_la-pngrutil.lo `test -f 'pngrutil.c' || echo './'`pngrutil.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngrutil.lo -MD -MP -MF .deps/libpng14_la-pngrutil.Tpo -c
pngrutil.c  -fPIC -DPIC -o .libs/libpng14_la-pngrutil.o
mv -f .deps/libpng14_la-pngget.Tpo .deps/libpng14_la-pngget.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngtrans.lo -MD -MP -MF .deps/libpng14_la-pngtrans.Tpo -c -o
libpng14_la-pngtrans.lo `test -f 'pngtrans.c' || echo './'`pngtrans.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngtrans.lo -MD -MP -MF .deps/libpng14_la-pngtrans.Tpo -c
pngtrans.c  -fPIC -DPIC -o .libs/libpng14_la-pngtrans.o
mv -f .deps/libpng14_la-pngtrans.Tpo .deps/libpng14_la-pngtrans.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwutil.lo -MD -MP -MF .deps/libpng14_la-pngwutil.Tpo -c -o
libpng14_la-pngwutil.lo `test -f 'pngwutil.c' || echo './'`pngwutil.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwutil.lo -MD -MP -MF .deps/libpng14_la-pngwutil.Tpo -c
pngwutil.c  -fPIC -DPIC -o .libs/libpng14_la-pngwutil.o
mv -f .deps/libpng14_la-pngrutil.Tpo .deps/libpng14_la-pngrutil.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngread.lo -MD -MP -MF .deps/libpng14_la-pngread.Tpo -c -o
libpng14_la-pngread.lo `test -f 'pngread.c' || echo './'`pngread.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngread.lo -MD -MP -MF .deps/libpng14_la-pngread.Tpo -c pngread.c 
-fPIC -DPIC -o .libs/libpng14_la-pngread.o
mv -f .deps/libpng14_la-pngwutil.Tpo .deps/libpng14_la-pngwutil.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngrio.lo -MD -MP -MF .deps/libpng14_la-pngrio.Tpo -c -o
libpng14_la-pngrio.lo `test -f 'pngrio.c' || echo './'`pngrio.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngrio.lo -MD -MP -MF .deps/libpng14_la-pngrio.Tpo -c pngrio.c 
-fPIC -DPIC -o .libs/libpng14_la-pngrio.o
mv -f .deps/libpng14_la-pngread.Tpo .deps/libpng14_la-pngread.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwio.lo -MD -MP -MF .deps/libpng14_la-pngwio.Tpo -c -o
libpng14_la-pngwio.lo `test -f 'pngwio.c' || echo './'`pngwio.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwio.lo -MD -MP -MF .deps/libpng14_la-pngwio.Tpo -c pngwio.c 
-fPIC -DPIC -o .libs/libpng14_la-pngwio.o
mv -f .deps/libpng14_la-pngrio.Tpo .deps/libpng14_la-pngrio.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwrite.lo -MD -MP -MF .deps/libpng14_la-pngwrite.Tpo -c -o
libpng14_la-pngwrite.lo `test -f 'pngwrite.c' || echo './'`pngwrite.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwrite.lo -MD -MP -MF .deps/libpng14_la-pngwrite.Tpo -c
pngwrite.c  -fPIC -DPIC -o .libs/libpng14_la-pngwrite.o
mv -f .deps/libpng14_la-pngwio.Tpo .deps/libpng14_la-pngwio.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngrtran.lo -MD -MP -MF .deps/libpng14_la-pngrtran.Tpo -c -o
libpng14_la-pngrtran.lo `test -f 'pngrtran.c' || echo './'`pngrtran.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngrtran.lo -MD -MP -MF .deps/libpng14_la-pngrtran.Tpo -c
pngrtran.c  -fPIC -DPIC -o .libs/libpng14_la-pngrtran.o
mv -f .deps/libpng14_la-pngwrite.Tpo .deps/libpng14_la-pngwrite.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwtran.lo -MD -MP -MF .deps/libpng14_la-pngwtran.Tpo -c -o
libpng14_la-pngwtran.lo `test -f 'pngwtran.c' || echo './'`pngwtran.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngwtran.lo -MD -MP -MF .deps/libpng14_la-pngwtran.Tpo -c
pngwtran.c  -fPIC -DPIC -o .libs/libpng14_la-pngwtran.o
mv -f .deps/libpng14_la-pngwtran.Tpo .deps/libpng14_la-pngwtran.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngmem.lo -MD -MP -MF .deps/libpng14_la-pngmem.Tpo -c -o
libpng14_la-pngmem.lo `test -f 'pngmem.c' || echo './'`pngmem.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngmem.lo -MD -MP -MF .deps/libpng14_la-pngmem.Tpo -c pngmem.c 
-fPIC -DPIC -o .libs/libpng14_la-pngmem.o
mv -f .deps/libpng14_la-pngmem.Tpo .deps/libpng14_la-pngmem.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngerror.lo -MD -MP -MF .deps/libpng14_la-pngerror.Tpo -c -o
libpng14_la-pngerror.lo `test -f 'pngerror.c' || echo './'`pngerror.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngerror.lo -MD -MP -MF .deps/libpng14_la-pngerror.Tpo -c
pngerror.c  -fPIC -DPIC -o .libs/libpng14_la-pngerror.o
mv -f .deps/libpng14_la-pngerror.Tpo .deps/libpng14_la-pngerror.Plo
/bin/bash ./libtool  --tag=CC   --mode=compile
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I.  -DPNG_CONFIGURE_LIBPNG   -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngpread.lo -MD -MP -MF .deps/libpng14_la-pngpread.Tpo -c -o
libpng14_la-pngpread.lo `test -f 'pngpread.c' || echo './'`pngpread.c
libtool: compile: 
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DPNG_CONFIGURE_LIBPNG -O2
-I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -MT
libpng14_la-pngpread.lo -MD -MP -MF .deps/libpng14_la-pngpread.Tpo -c
pngpread.c  -fPIC -DPIC -o .libs/libpng14_la-pngpread.o
mv -f .deps/libpng14_la-pngrtran.Tpo .deps/libpng14_la-pngrtran.Plo
rm -f libpng.sym libpng.sym.new
/usr/bin/cpp -DPNG_CONFIGURE_LIBPNG  -DPNG_BUILDSYMS ./png.h | \
        /bin/sed -n -e \
        's|^.*PNG_FUNCTION_EXPORT[    
]*\(['_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789']*\).*$|\1|p'
\
        -e 's|^.*PNG_DATA_EXPORT[    
]*\(['_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789']*\).*$|\1|p'
\
            >libpng.sym.new
./png.h:421:18: fatal error: zlib.h: No such file or directory
compilation terminated.
mv libpng.sym.new libpng.sym
cp libpng-config libpng14-config
cp libpng.pc libpng14.pc
rm -f libpng.vers libpng.vers.new
echo PNG14_0 '{global:' > libpng.vers.new
/bin/sed s/$/\;/ libpng.sym >> libpng.vers.new
echo 'local: *; };' >> libpng.vers.new
mv libpng.vers.new libpng.vers
mv -f .deps/libpng14_la-pngpread.Tpo .deps/libpng14_la-pngpread.Plo
/bin/bash ./libtool --tag=CC   --mode=link
/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache /usr/bin/gcc 
-O2 -I/usr/work/buildroot/buildroot-2012.02/output/host/include
-I/usr/work/buildroot/buildroot-2012.02/output/host/usr/include -no-undefined
-export-dynamic -version-number 14:11:0 -Wl,--version-script=libpng.vers 
-L/usr/work/buildroot/buildroot-2012.02/output/host/lib
-L/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib
-Wl,-rpath,/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib -o
libpng14.la -rpath /usr/work/buildroot/buildroot-2012.02/output/host/usr/lib
libpng14_la-png.lo libpng14_la-pngset.lo libpng14_la-pngget.lo
libpng14_la-pngrutil.lo libpng14_la-pngtrans.lo libpng14_la-pngwutil.lo
libpng14_la-pngread.lo libpng14_la-pngrio.lo libpng14_la-pngwio.lo
libpng14_la-pngwrite.lo libpng14_la-pngrtran.lo libpng14_la-pngwtran.lo
libpng14_la-pngmem.lo libpng14_la-pngerror.lo libpng14_la-pngpread.lo  -lz -lm 
libtool: link: /usr/work/buildroot/buildroot-2012.02/output/host/usr/bin/ccache
/usr/bin/gcc -shared  .libs/libpng14_la-png.o .libs/libpng14_la-pngset.o
.libs/libpng14_la-pngget.o .libs/libpng14_la-pngrutil.o
.libs/libpng14_la-pngtrans.o .libs/libpng14_la-pngwutil.o
.libs/libpng14_la-pngread.o .libs/libpng14_la-pngrio.o
.libs/libpng14_la-pngwio.o .libs/libpng14_la-pngwrite.o
.libs/libpng14_la-pngrtran.o .libs/libpng14_la-pngwtran.o
.libs/libpng14_la-pngmem.o .libs/libpng14_la-pngerror.o
.libs/libpng14_la-pngpread.o  
-L/usr/work/buildroot/buildroot-2012.02/output/host/lib
-L/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib -lz -lm 
-Wl,--version-script=libpng.vers -Wl,-rpath
-Wl,/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib   -Wl,-soname
-Wl,libpng14.so.14 -o .libs/libpng14.so.14.11.0
/usr/bin/ld:libpng.vers:2: syntax error in VERSION script
collect2: ld returned 1 exit status
make[2]: *** [libpng14.la] Error 1
make[2]: Leaving directory
`/usr/work/buildroot/buildroot-2012.02/output/build/host-libpng-1.4.11'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/work/buildroot/buildroot-2012.02/output/build/host-libpng-1.4.11'
make: ***
[/usr/work/buildroot/buildroot-2012.02/output/build/host-libpng-1.4.11/.stamp_built]
Error 2

2. while delete 'libpng.vers' in the Makefile, host-libpng-1.4.11 passed.

3. error in pango
>>> pango 1.28.4 Building
PATH="/usr/work/buildroot/buildroot-2012.02/output/host/bin:/usr/work/buildroot/buildroot-2012.02/output/host/usr/bin:/usr/work/buildroot/buildroot-2012.02/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/FriendlyARM/toolschain/4.5.1/bin"
PERLLIB="/usr/work/buildroot/buildroot-2012.02/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/
make[1]: Entering directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4'
Making all in pango
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/pango'
  GEN    s-enum-types-h
  GEN    s-enum-types-c
/usr/bin/make  all-recursive
make[4]: Entering directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/pango'
Making all in opentype
make[5]: Entering directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/pango/opentype'
  CC     libharfbuzz_la-hb-buffer.lo
  CC     libharfbuzz_la-hb-blob.lo
  CXX    libharfbuzz_la-hb-font.lo
  CC     libharfbuzz_la-hb-glib.lo
  CC     libharfbuzz_la-hb-shape.lo
  CC     libharfbuzz_la-hb-unicode.lo
  CXX    libharfbuzz_la-hb-ot-layout.lo
  CXX    main-main.o
  CXXLD  libharfbuzz.la
libtool: link: warning: library
`/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libgobject-2.0.la'
was moved.
/bin/grep:
/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-201
 2.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown
 -linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/
 buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/outp
 ut/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gn
 ueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/build/libglib2-2.28.8/gthread/libgthread-2.0.la:
File name too long
/bin/sed: can't read
/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-201
 2.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown
 -linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/
 buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/outp
 ut/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gn
 ueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/build/libglib2-2.28.8/gthread/libgthread-2.0.la:
File name too long
libtool: link:
`/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-20
 12.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknow
 n-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work
 /buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/out
 put/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-g
 nueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.02/output/build/libglib2-2.28.8/gthread/libgthread-2.0.la'
is not a valid libtool archive
make[5]: *** [libharfbuzz.la] Error 1
make[5]: Leaving directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/pango/opentype'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/pango'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/pango'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4'
make: ***
[/usr/work/buildroot/buildroot-2012.02/output/build/pango-1.28.4/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
