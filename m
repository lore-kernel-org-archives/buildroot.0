From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:00:58 +0100
Subject: [Buildroot] [PATCH 5/9] linux: enable initrd/initramfs support
 when cpio rootfs is chosen
In-Reply-To: <20131229163459.GA3567@free.fr>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131228194924.GJ3373@free.fr> <20131229111336.0242c913@skate>
 <20131229163459.GA3567@free.fr>
Message-ID: <20131229180058.1b385583@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 29 Dec 2013 17:34:59 +0100, Yann E. MORIN wrote:

> > ~/projets/marvell/mvebu$ grep INITRAMFS_SOURCE .config
> > CONFIG_INITRAMFS_SOURCE="../rootfs-armv7/images/rootfs.cpio"
> > 
> > So yes, I *really* want to keep the cpio format option :-)
> 
> Ah, OK, that's indeed a valid use-case. I had forgotten about
> externally-built kernels.
> 
> But then, unless you're building without modules, you'd have to rebuild
> your rootfs.cpio everytime you rebuild your kernel, no?

I will my kernel without modules, indeed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
