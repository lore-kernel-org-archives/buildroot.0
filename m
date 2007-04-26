From: Slayn angel <slaynangel@myrealbox.com>
Date: Thu, 26 Apr 2007 10:36:20 +0200
Subject: [Buildroot] Missing sysdep.h linuxpthreads
Message-ID: <1177576580.c7e8127cslaynangel@myrealbox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i have Problems buildgin ucLibc with Linuxthreads or NPLT

--

make[1]: Entering directory `/mnt/tinygentoo/buildroot/toolchain_build_i686/uClibc'
make[2]: `conf' is up to date.
make -j1 locale_headers
make[3]: `conf' is up to date.
  CC ldso/ldso/ldso.oS
In file included from ./libpthread/linuxthreads/sysdeps/i386/i686/pt-machine.h:73,
                 from ./libpthread/linuxthreads/sysdeps/i386/pt-machine.h:24,
                 from ./libpthread/linuxthreads/sysdeps/i386/tls.h:23,
                 from ./include/bits/uClibc_errno.h:35,
                 from ./include/errno.h:62,
                 from ./include/bits/syscalls.h:14,
                 from ./include/sys/syscall.h:34,
                 from ./ldso/ldso/i386/dl-syscalls.h:3,
                 from ./ldso/include/dl-syscall.h:12,
                 from ./ldso/include/ldso.h:36,
                 from ldso/ldso/ldso.c:33:
./libpthread/linuxthreads/sysdeps/i386/i686/../useldt.h:25:20: error: sysdep.h: No such file or directory
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory `/mnt/tinygentoo/buildroot/toolchain_build_i686/uClibc'
make: *** [/mnt/tinygentoo/buildroot/toolchain_build_i686/uClibc/lib/libc.a] Error 2

---

Any hints? (using uclibc-snapshot with buildroot snapshot)
