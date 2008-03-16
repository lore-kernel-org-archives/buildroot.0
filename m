From: John Voltz <john.voltz@gmail.com>
Date: Sun, 16 Mar 2008 09:21:08 -0400
Subject: [Buildroot] Unable to compile kernel
In-Reply-To: <d6cda7730803160552s38da9abahd1f8d1e4056d079@mail.gmail.com>
References: <d6cda7730803160552s38da9abahd1f8d1e4056d079@mail.gmail.com>
Message-ID: <46a136670803160621g336f254bhb84e07c27a354da1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the gcc optimization level to 2, 3, or S in menuconfig, under build
options.

John


On Sun, Mar 16, 2008 at 8:52 AM, Thiago A. Corr?a <thiago.correa@gmail.com>
wrote:

> Hi,
>
>   I have been recently unable to compile the kernel, using both
> atstk1002_defconfig and atngw100_defconfig.
>
>   Here is what I get:
>
> include/asm/ocd.h: In function 'die':
> include/asm/ocd.h:525: error: Parameter 1 to __builtin_mfdr must be a
> constant number
> make[2]: *** [arch/avr32/kernel/traps.o] Error 1
> make[1]: *** [arch/avr32/kernel] Error 2
> make[1]: Leaving directory
> `/root/buildroot2-avr32/project_build_avr32/atngw100/linux-2.6.24'
> make: *** [/root/buildroot2-avr32/binaries/atngw100/atngw100-
> linux-2.6.24-20080316]
> Error 2
>
>   The kernel version hasn't changed (2.6.24) or the toolchain as far
> as I know, so I can only guess it's a new patch(?).
>   Anyone having the same issue?
>
> Kind Regards,
>   Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080316/bdb1c7d9/attachment.htm 
