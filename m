From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 19:05:48 +0100
Subject: [Buildroot] [git commit] jpeg: fix typo introduced when fixing
 the indentation
In-Reply-To: <20161211174021.GC3599@free.fr>
References: <20161211173622.880F881831@busybox.osuosl.org>
 <20161211174021.GC3599@free.fr>
Message-ID: <20161211190548.129f6305@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 18:40:21 +0100, Yann E. MORIN wrote:

> Alternatively, I think it is easier to read if it is written like that:
> 
>     config BR2_PACKAGE_JPEG_SIMD_SUPPORT
>         bool
>         default y if BR2_X86_CPU_HAS_MMX
>         default y if BR2_ARM_CPU_HAS_NEON
>         default y if BR2_POWERPC_CPU_HAS_ALTIVEC
>         default y if BR2_aarch64 || BR2_aarch64_be

Agreed, this notation is a bit more readable.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
