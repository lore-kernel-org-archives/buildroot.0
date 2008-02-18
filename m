From: Mile Davidovic <md4uclibc@gmail.com>
Date: Mon, 18 Feb 2008 16:27:23 +0100
Subject: [Buildroot] Buildroot failed
Message-ID: <f185607a0802180727o4577010em39d2b277a6a92ccd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I got this error with latest buildroot:
gmake[2]: Leaving directory
`/scratch/buildroot/toolchain_build_mips_nofpu/gcc-4.2.1-initial/gcc'
gmake[1]: Leaving directory
`/scratch/buildroot/toolchain_build_mips_nofpu/gcc-4.2.1-initial'
 touch /scratch/buildroot/toolchain_build_mips_nofpu/gcc-4.2.1-initial/.installed
/tools/gnu/i686-linux/tools/make-3.81/bin/gmake
MAKE="/tools/gnu/i686-linux/tools/make-3.81/bin/gmake -j1" -C
/scratch/buildroot/toolchain_build_mips_nofpu/uClibc-0.9.29 \
                 PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="/usr/bin/gcc" \
                all
gmake[1]: Entering directory
`/scratch/buildroot/toolchain_build_mips_nofpu/uClibc-0.9.29'
 ln -fs sgidefs.h ./include/
:0: error: -march=mips32 is not compatible with the selected ABI
:0: error: -march=mips32 is not compatible with the selected ABI
  CC ldso/ldso/ldso.oS
ldso/ldso/ldso.c:1: error: -march=mips32 is not compatible with the selected ABI
 gmake[1]: *** [ldso/ldso/ldso.oS] Error 1

In the attachment is buildroot config file. Is this buildroot related question?

Best regards
Mile
-------------- next part --------------
A non-text attachment was scrubbed...
Name: b.config
Type: application/octet-stream
Size: 16457 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080218/b9ce164c/attachment-0001.obj 
