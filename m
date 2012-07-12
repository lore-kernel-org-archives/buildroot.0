From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 00:13:41 +0200
Subject: [Buildroot] Starting from scratch fails - how do I get to a
 basic PXE boot?
In-Reply-To: <07221C471CA1C044B6D10EC0D483C95708D3ECA7@hercules.clumpton.homeip.net>
References: <07221C471CA1C044B6D10EC0D483C95708D3ECA7@hercules.clumpton.homeip.net>
Message-ID: <20120713001341.046da315@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 12 Jul 2012 10:54:27 +0000,
"Bart J. Smit" <bart@smits.co.uk> a ?crit :

> kernel changes for VM:
> 	BR2_LINUX_KERNEL=y
> 	BR2_LINUX_KERNEL_DEFCONFIG=qemu_x86

This line doesn't make sense, since the kernel does not have a
arch/x86/configs/qemu_x86_defconfig file. For x86, only two defconfigs
are available: i386 and x86_64.

> What steps did I miss? Is there a better/easier way to get from a clean buildroot to a working PXE setup?

Does PXE has anything to do with this? I think PXE just boots a kernel
+ optionally an initrd/initramfs, no?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
