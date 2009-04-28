From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Apr 2009 23:06:22 +0200
Subject: [Buildroot] buildroot openssl compile error
In-Reply-To: <49E16433.9010707@comcast.net>
References: <49E16433.9010707@comcast.net>
Message-ID: <20090428230622.1c56fcb1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 11 Apr 2009 22:46:59 -0500,
Brad Johnson <bradjohn263@comcast.net> a ?crit :

> /opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include
> -fPIC -DOPENSS
> L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN 
> -DHAVE_DLF
> CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c
> c_zlib.c:25:18: error: zlib.h: No such file or directory

This issue has been fixed by r26226.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
