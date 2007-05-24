From: Wang, Baojun <wangbj@lzu.edu.cn>
Date: Thu, 24 May 2007 17:36:26 +0800
Subject: [Buildroot] build failed on the latest svn version using uclibc
	0.9.29/NPTL
Message-ID: <380061088.02177@eyou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

platform is: i386/i686

error messages:


Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/c++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

make 
MAKE="make -j1" -C /home/wangbj/build/buildroot-x86/toolchain_build_i686/uClibc-0.9.29 
\
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="gcc" \
                all
make[1]: Entering directory 
`/home/wangbj/build/buildroot-x86/toolchain_build_i686/uClibc-0.9.29'
make[2]: `conf' is up to date.
  CC ldso/ldso/ldso.oS
In file included 
from ./libpthread/linuxthreads/sysdeps/i386/i686/pt-machine.h:73,
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
./libpthread/linuxthreads/sysdeps/i386/i686/../useldt.h:25:20: error: 
sysdep.h: No such file or directory
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory 
`/home/wangbj/build/buildroot-x86/toolchain_build_i686/uClibc-0.9.29'
make: *** 

                                    
-- 
Wang, Baojun                                        Lanzhou University
Distributed & Embedded System Lab              http://dslab.lzu.edu.cn
School of Information Science and Engeneering        wangbj at lzu.edu.cn
Tianshui South Road 222. Lanzhou 730000                     .P.R.China
Tel:+86-931-8912025                                Fax:+86-931-8912022
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.gz
Type: application/x-gzip
Size: 2830 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070524/6cfe96bc/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070524/6cfe96bc/attachment.pgp 
