From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 18 Jul 2007 01:18:02 +0200
Subject: [Buildroot] ruby won't build :(
References: <0707172111460.16403@somehost>
Message-ID: <000201c7c94d$b23b8b60$0e35780a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Cristian Ionescu-Idbohrn" <cristian.ionescu-idbohrn@axis.com>
To: <buildroot@uclibc.org>
Sent: Tuesday, July 17, 2007 9:14 PM
Subject: [Buildroot] ruby won't build :(


> /data/cii/buildroot/buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
> -Os -pipe
> -I/data/cii/buildroot/buildroot/build_i486/staging_dir/usr/include
> --sysroot=/data/cii/buildroot/buildroot/build_i486/staging_dir/ -isysroot
> /data/cii/buildroot/buildroot/build_i486/staging_dir -g -O2 -rdynamic
> -Wl,-export-dynamic main.o dmyext.o libruby-static.a -ldl -lcrypt -lm -o
> miniruby
> 
> can't find header files for ruby.
> make[1]: *** [all] Error 1
> 
> 

Seen the same thing here, tried with several versions including svn
without any progress.

Best Regards
Ulf Samuelsson  
