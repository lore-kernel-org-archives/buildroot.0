From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jun 2012 11:56:13 +0200
Subject: [Buildroot] Compiling grub on x86_64
In-Reply-To: <20120628114631.25da4786@skate>
References: <4FE81898.4020606@mind.be> <20120625100458.4a3e62c8@skate>
 <4FEC1155.4020008@mind.be> <20120628114631.25da4786@skate>
Message-ID: <20120628115613.7b4f26ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 28 Jun 2012 11:46:31 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Agreed. It's however a shame that it's not possible to build a complete
> bootloader+kernel+rootfs for x86_64 with a single Buildroot
> configuration :-(
> 
> How other build systems handle this?

Other questions:

 * What about using the host compiler to build Grub? I know it sounds a
   bit funky, but in practice, most Buildroot users will work on
   x86/x86_64 machines. If they are on x86, then it just works, if they
   work on x86_64, then most likely they have a multilib 32/64
   toolchain installed on their host. This would at least enable, for
   most users, the possibility of building Grub as part of a x86_64
   target system configuration.

 * What does Grub really require from gcc_s? Is it impossible to rework
   Grub to make independent from the compiler companion libraries?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
