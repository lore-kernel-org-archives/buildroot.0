From: ali hagigat <hagigatali@gmail.com>
Date: Mon, 6 Apr 2015 18:27:39 +0430
Subject: [Buildroot] why there are errors compiling the kernel, 3.16.7
Message-ID: <CAKKWdtdUN=FxONoqC5qMdJZPQjFFeosehRdLnY-b1jq_msU02Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux-3.16.7.tar.xz
ipipe-core-3.16.7-arm-5.patch  + xenomai user space applications and libraries
target-board: wandboard-quad


  CHK     include/generated/compile.h
  CC      arch/arm/xenomai/hal.o
  CC      net/socket.o
  AS      arch/arm/xenomai/switch.o
arch/arm/xenomai/hal.c:47:24: fatal error: asm/system.h: No such file
or directory
 #include <asm/system.h>
                        ^
compilation terminated.
make[2]: *** [arch/arm/xenomai/hal.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [arch/arm/xenomai] Error 2
make[1]: *** Waiting for unfinished jobs....
  LD      net/802/built-in.o
  CC      net/core/sock.o
  CC      net/dns_resolver/dns_key.o
  CC      net/dns_resolver/dns_query.o
  LD      net/dns_resolver/dns_resolver.o
  LD      net/dns_resolver/built-in
