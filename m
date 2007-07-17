From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 17 Jul 2007 21:14:34 +0200 (CEST)
Subject: [Buildroot] ruby won't build :(
Message-ID: <0707172111460.16403@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/data/cii/buildroot/buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
-Os -pipe
-I/data/cii/buildroot/buildroot/build_i486/staging_dir/usr/include
 --sysroot=/data/cii/buildroot/buildroot/build_i486/staging_dir/ -isysroot
/data/cii/buildroot/buildroot/build_i486/staging_dir -g -O2 -rdynamic
-Wl,-export-dynamic main.o dmyext.o libruby-static.a -ldl -lcrypt -lm -o
miniruby

can't find header files for ruby.
make[1]: *** [all] Error 1


-- 
Cristian
