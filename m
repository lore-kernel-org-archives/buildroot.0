From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Mar 2012 23:30:04 +0100
Subject: [Buildroot] [PATCH] elf2flt: fix after conversion of binutils
 to package infrastructure
In-Reply-To: <87y5qxn131.fsf@macbook.be.48ers.dk>
References: <CAFm-AyppuS3y-oHUHj_Xz1u+JB2qLDKmHVF4MQV-8=8u9cwwEw@mail.gmail.com>
 <1332084958-1085-1-git-send-email-arnout@mind.be>
 <20120318165838.7596efeb@skate>
 <87y5qxn131.fsf@macbook.be.48ers.dk>
Message-ID: <20120318233004.0c835fa1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 18 Mar 2012 20:47:14 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Great, sounds good. I don't have any experience with skyeye, any
> specific reasons to use that instead of qemu?

I might have missed something, but I haven't found any of the ARM
platforms emulated by Qemu to be noMMU platforms. I have tried to build
a kernel for the Versatile platform with MMU disabled, but the build
fails. It seems that the kernel does not support to be built for any
platform with MMU disabled, though I might be wrong. If anyone knows
about one of the ARM platforms supported by Qemu to be supported in a
noMMU variant by the kernel, that would be nice.

I have also started to build a m68k kernel. This one starts booting in
Qemu, but the boot hangs with an "attempted to kill idle" panic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
