From: Doug Brewer <brewer.doug@gmail.com>
Date: Mon, 11 Dec 2006 21:58:45 +0800
Subject: [Buildroot] buildroot to build error with uclibc snapshot for mipsel
Message-ID: <b2ec5cad0612110558o6a30a1f7wc15b841aaa29c273@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Today, I tried to use buildroot snapshot to build uclibc snapshot for mipsel,
I got errors:

...
CC libc/sysdeps/linux/mips/pread_write.os
libc/sysdeps/linux/mips/pread_write.c: In function `__libc_pread':
libc/sysdeps/linux/mips/pread_write.c:44: warning: implicit declaration of funct
ion `__LONG_LONG_PAIR'
libc/sysdeps/linux/mips/pread_write.c:44: error: too few arguments to function `
__syscall_pread'
libc/sysdeps/linux/mips/pread_write.c: In function `__libc_pread64':
libc/sysdeps/linux/mips/pread_write.c:54: error: too few arguments to function `
__syscall_pread'
libc/sysdeps/linux/mips/pread_write.c: In function `__libc_pwrite':
libc/sysdeps/linux/mips/pread_write.c:88: error: too few arguments to function `
__syscall_pwrite'
libc/sysdeps/linux/mips/pread_write.c: In function `__libc_pwrite64':
libc/sysdeps/linux/mips/pread_write.c:98: error: too few arguments to function `
__syscall_pwrite'
make[2]: *** [libc/sysdeps/linux/mips/pread_write.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory `/home/brewer/buildroot/toolchain_build_mipsel/uClibc
'
make: *** [/home/brewer/buildroot/toolchain_build_mipsel/uClibc/lib/libc.a] Erro
r 2

Would you tell me how to fix it? thank you.

Warm regards,
Doug.
