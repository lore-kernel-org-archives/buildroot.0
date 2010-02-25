From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Feb 2010 10:59:39 +0100
Subject: [Buildroot] Add verbose of compilling
In-Reply-To: <4B864795.80607@18r.ru> (=?utf-8?B?ItCU0LzQuNGC0YDQuNC5Iidz?=
	message of "Thu, 25 Feb 2010 13:49:09 +0400")
References: <4B862786.5090309@18r.ru> <87iq9l7msn.fsf@macbook.be.48ers.dk>
	<4B86362F.7020009@18r.ru> <87aaux7jz1.fsf@macbook.be.48ers.dk>
	<4B864795.80607@18r.ru>
Message-ID: <871vg97i0k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "???????" == ???????  <dima@18r.ru> writes:

Hi,

 ???????> Ohh.. thanks for help, it works!
 ???????> Where i can get help with it, on bugtracker?

Or simply here on the mailing list - Please don't forget to send your
mails to the list and not just to me, so other people can help as well.

 ???????> /home/izh_dima/buildroot/output/staging/usr/bin/i686-linux-uclibc-gcc
 ???????> -Os -pipe -Os -I/home/izh_dima/buildroot/output/staging/usr/include
 ???????> -I/home/izh_dima/buildroot/output/staging/include
 ???????> --sysroot=/home/izh_dima/buildroot/output/staging/ -isysroot
 ???????> /home/izh_dima/buildroot/output/staging -mtune=i686 -march=i686
 ???????> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
 ???????> -pipe -Os -I/home/izh_dima/buildroot/output/staging/usr/include
 ???????> -I/home/izh_dima/buildroot/output/staging/include
 ???????> --sysroot=/home/izh_dima/buildroot/output/staging/ -isysroot
 ???????> /home/izh_dima/buildroot/output/staging -mtune=i686 -march=i686
 ???????> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 ???????> -I/home/izh_dima/buildroot/output/staging/usr/include/SDL
 ???????> -D_GNU_SOURCE=1 -D_REENTRANT
 ???????> --sysroot=/home/izh_dima/buildroot/output/staging/ -o .libs/showimage
 ???????> showimage.o -Wl,-rpath -Wl,/usr/lib
 ???????> -L/home/izh_dima/buildroot/output/staging/lib
 ???????> -L/home/izh_dima/buildroot/output/staging/usr/lib
 ???????> ./.libs/libSDL_image.so
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libpng12.so -lz
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libjpeg.so
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libSDL.so -lm
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libXrandr.so
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libXext.so
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libXrender.so
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libX11.so
 ???????> /home/izh_dima/buildroot/output/staging/usr/lib/libxcb-xlib.so
 ???????> /usr/lib/libxcb.so

Somehow SDL ends up linking with libxcb on your host. Could you post
your .config so I can try to reproduce it?

-- 
Bye, Peter Korsgaard
