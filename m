From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 1 May 2016 22:46:41 +0200
Subject: [Buildroot] [PATCH v6 3/3] beaglebone: adds barebox bootloader
 defconfig
In-Reply-To: <20160501143518.750be17c@free-electrons.com>
References: <cover.1461531859.git.pieter@boesman.nl>
 <f0177f323edba43b5df02ba0313698a16a68e287.1461531859.git.pieter@boesman.nl>
 <20160501143518.750be17c@free-electrons.com>
Message-ID: <20160501204641.GA32055@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 01, 2016 at 02:35:18PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Apr 2016 23:15:25 +0200, Pieter Smith wrote:
> > * Builds the barebox MLO and bootloader.
> > * Generates a bootable SD card image with boot and rootfs partitions.
> > * Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
> >   being generated with the kernel.
> > 
> > Signed-off-by: Pieter Smith <pieter@boesman.nl>
> 
> As we discussed, I've marked this one as rejected in patchwork. I don't
> think it's worth hacving a separate defconfig for the BeagleBone, whose
> only difference is to use Barebox instead of U-Boot.

Understood. Hopefully people can find it back in the mail archives. ;-)

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

- Pieter
