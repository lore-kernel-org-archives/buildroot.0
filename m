From: Pieter Smith <pieter@boesman.nl>
Date: Mon, 29 Feb 2016 09:44:32 +0100
Subject: [Buildroot] [v3,
 4/4] beaglebone: adds barebox bootloader defconfig
In-Reply-To: <56D0E40E.40800@mind.be>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-5-git-send-email-pieter@boesman.nl>
 <56D0E40E.40800@mind.be>
Message-ID: <20160229084432.GA18909@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 27, 2016 at 12:47:26AM +0100, Arnout Vandecappelle wrote:
> On 01/20/16 23:43, Pieter Smith wrote:
> > * Builds barebox MLO and the barebox bootloader.
> > * Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
> >   being generated with the kernel.

[snip]

> > +# kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_LATEST_VERSION=y
> 
>  Kernel version should be locked down as well.

ACK. Will do.

> > +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> > +BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> > +BR2_LINUX_KERNEL_ZIMAGE=y
> 
>  Perhaps add a comment here that the dtb from barebox will be used.

A comment in the defconfig file? Not that I am against it, but will anybody
actually read it?

>  Regards,
>  Arnout

[snip]

- Pieter
