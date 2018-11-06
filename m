From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 6 Nov 2018 20:33:29 +0100
Subject: [Buildroot] glibc link fails on x86_64 with fPIC error
In-Reply-To: <1541522964822-0.post@n4.nabble.com>
References: <1541520575003-0.post@n4.nabble.com>
 <CANQCQpZ1j-Nfh+z0qSkshZqrZrLi4pcgYhEJfrOJrOcfDyXm-A@mail.gmail.com>
 <1541522964822-0.post@n4.nabble.com>
Message-ID: <33bb260a-a054-4d91-0228-d89ac45bd8bc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 06/11/2018 ? 17:49, mws a ?crit?:
> $ cat defconfig
> BR2_x86_64=y
> BR2_x86_core_avx2=y
> BR2_JLEVEL=1
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_KERNEL_HEADERS_4_9=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_PCIUTILS=y
> BR2_PACKAGE_LIBXML2=y
> BR2_PACKAGE_ELFUTILS=y
> BR2_PACKAGE_LIBCAP=y
> BR2_PACKAGE_BASH=y

With this defconfig, the toolchain build fine here.

Can you share the full build log ?

Best regards,
Romain

> 
> $ grep -i relro .config
> BR2_RELRO_NONE=y
> # BR2_RELRO_PARTIAL is not set
> # BR2_RELRO_FULL is not set
> 
> Thanks for any ideas.
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
