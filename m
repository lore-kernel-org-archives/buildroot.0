From: loody <miloody@gmail.com>
Date: Wed, 28 Jan 2009 00:46:09 +0800
Subject: [Buildroot] bfd lib include Error while build elf2flt
Message-ID: <3a665c760901270846y7ccc4adak9c49fbc82618bfa0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all:
While compiling elf2flt, the buildroot shows the error message as
attach at the end of this mail.
I try to rebuild the binuitilies, but it still fail.
If anyone has the same problem or knows where I get wrong, please let me know.
appreciate your help,
miloody

/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/elf2flt/elf2flt.c:2120:
warning: format ???%x??? expects type ???unsigned int???, but argument
2 has type ???long unsigned int???
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/elf2flt/elf2flt.c:2088:
warning: ignoring return value of ???write???, declared with attribute
warn_unused_result
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/elf2flt/elf2flt.c:2124:
warning: ignoring return value of ???fwrite???, declared with
attribute warn_unused_result
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/elf2flt/elf2flt.c:2130:
warning: ignoring return value of ???fwrite???, declared with
attribute warn_unused_result
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/elf2flt/elf2flt.c:2133:
warning: ignoring return value of ???fwrite???, declared with
attribute warn_unused_result
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19-build/bfd/libbfd.a(compress.o):
In function `bfd_uncompress_section_contents':
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19/bfd/compress.c:96:
undefined reference to `inflateInit_'
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19/bfd/compress.c:103:
undefined reference to `inflate'
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19/bfd/compress.c:106:
undefined reference to `inflateReset'
/media/sda6/uclinux/buildroot-2009.02-rc2/toolchain_build_arm/binutils-2.19/bfd/compress.c:108:
undefined reference to `inflateEnd'
collect2: ld returned 1 exit status
make: *** [elf2flt] Error 1
