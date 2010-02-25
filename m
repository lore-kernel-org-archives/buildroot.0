From: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <dima@18r.ru>
Date: Thu, 25 Feb 2010 17:31:43 +0400
Subject: [Buildroot] Can't compille SDL
Message-ID: <4B867BBF.1050506@18r.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
What's problem?

izh_dima at localpc ~/buildroot $ ls /usr/lib/libxcb.so
/usr/lib/libxcb.so
...
libtool: link: warning: library 
`/home/izh_dima/buildroot/output/staging/usr/lib/libSDL.la' was moved.
libtool: link: warning: library 
`/home/izh_dima/buildroot/output/staging/usr/lib/libSDL.la' was moved.
/home/izh_dima/buildroot/output/staging/usr/bin/i686-linux-uclibc-gcc 
-Os -pipe -Os -I/home/izh_dima/buildroot/output/staging/usr/include 
-I/home/izh_dima/buildroot/output/staging/include 
--sysroot=/home/izh_dima/buildroot/output/staging/ -isysroot 
/home/izh_dima/buildroot/output/staging -mtune=i686 -march=i686 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os 
-pipe -Os -I/home/izh_dima/buildroot/output/staging/usr/include 
-I/home/izh_dima/buildroot/output/staging/include 
--sysroot=/home/izh_dima/buildroot/output/staging/ -isysroot 
/home/izh_dima/buildroot/output/staging -mtune=i686 -march=i686 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/izh_dima/buildroot/output/staging/usr/include/SDL 
-D_GNU_SOURCE=1 -D_REENTRANT 
--sysroot=/home/izh_dima/buildroot/output/staging/ -o .libs/showimage 
showimage.o -Wl,-rpath -Wl,/usr/lib  
-L/home/izh_dima/buildroot/output/staging/lib 
-L/home/izh_dima/buildroot/output/staging/usr/lib 
./.libs/libSDL_image.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libpng12.so -lz 
/home/izh_dima/buildroot/output/staging/usr/lib/libjpeg.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libSDL.so -lm 
/home/izh_dima/buildroot/output/staging/usr/lib/libXrandr.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libXext.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libXrender.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libX11.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libxcb-xlib.so 
/usr/lib/libxcb.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libxcb.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libXau.so 
/home/izh_dima/buildroot/output/staging/usr/lib/libXdmcp.so -ldl 
-lpthread -Wl,--rpath -Wl,/home/izh_dima/buildroot/output/staging/usr/lib
/home/izh_dima/buildroot/output/staging/usr/bin-ccache/../lib/gcc/i686-linux-uclibc/4.3.4/../../../../i686-linux-uclibc/bin/ld: 
warning: libc.so.6, needed by /usr/lib/libxcb.so, not found (try using 
-rpath or -rpath-link)
/usr/lib/libxcb.so: undefined reference to `realloc at GLIBC_2.0'
/usr/lib/libxcb.so: undefined reference to `pthread_cond_wait at GLIBC_2.3.2'
/usr/lib/libxcb.so: undefined reference to `pthread_mutex_init at GLIBC_2.0'
/usr/lib/libxcb.so: undefined reference to `memset at GLIBC_2.0'
...

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100225/ec90eb3c/attachment-0001.diff>
