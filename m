From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sun, 16 Mar 2008 09:52:10 -0300
Subject: [Buildroot] Unable to compile kernel
Message-ID: <d6cda7730803160552s38da9abahd1f8d1e4056d079@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   I have been recently unable to compile the kernel, using both
atstk1002_defconfig and atngw100_defconfig.

   Here is what I get:

include/asm/ocd.h: In function 'die':
include/asm/ocd.h:525: error: Parameter 1 to __builtin_mfdr must be a
constant number
make[2]: *** [arch/avr32/kernel/traps.o] Error 1
make[1]: *** [arch/avr32/kernel] Error 2
make[1]: Leaving directory
`/root/buildroot2-avr32/project_build_avr32/atngw100/linux-2.6.24'
make: *** [/root/buildroot2-avr32/binaries/atngw100/atngw100-linux-2.6.24-20080316]
Error 2

   The kernel version hasn't changed (2.6.24) or the toolchain as far
as I know, so I can only guess it's a new patch(?).
   Anyone having the same issue?

Kind Regards,
   Thiago A. Correa
