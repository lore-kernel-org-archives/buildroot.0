From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Mar 2014 15:21:28 -0300
Subject: [Buildroot] [PATCH] glibc: needs MMU
In-Reply-To: <1393870807-20546-1-git-send-email-yann.morin.1998@free.fr>
References: <1393870807-20546-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5314C828.3000905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2014 03:20 PM, Yann E. MORIN wrote:

>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc"
> +	depends on BR2_USE_MMU
>  	select BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
>  		   BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \

Oops? (UCLIBC)
Regards.
