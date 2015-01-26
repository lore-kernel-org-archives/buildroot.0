From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 22:57:11 +0100
Subject: [Buildroot] [PATCH] toolchain: get rid of -pipe from
 optimisations
In-Reply-To: <54C6B6D4.5060608@openwide.fr>
References: <1419166825-25133-1-git-send-email-yann.morin.1998@free.fr>
 <54C6B6D4.5060608@openwide.fr>
Message-ID: <20150126225711.1573eb57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 26 Jan 2015 22:51:16 +0100, Romain Naour wrote:

> So I tried to compile the kernel by changing this line:
> -CODE16GCC_CFLAGS := -m32 -Wa,$(srctree)/arch/x86/boot/code16gcc.h
> +CODE16GCC_CFLAGS := -m32 -Wa,-,$(srctree)/arch/x86/boot/code16gcc.h
> 
> And success, it build !

[...]

Thanks for the feedback, definitely interesting!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
