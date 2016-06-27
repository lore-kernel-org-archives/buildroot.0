From: Andi Shyti <andi.shyti@gmail.com>
Date: Tue, 28 Jun 2016 02:02:08 +0900
Subject: [Buildroot] [PATCH 2/2] board: add support for the Odroid XU4
 board
In-Reply-To: <20160626141442.GJ2319@tarshish>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
 <1466950062-31783-3-git-send-email-andi@etezian.org>
 <20160626141442.GJ2319@tarshish>
Message-ID: <20160627170208.GK424@jack.zhora.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Sun, Jun 26, 2016 at 05:07:42PM +0300, Andi Shyti wrote:
> > The Odroid XU4 board is released by hardkernel and has a
> > Samsunx
>
> Samsung.
>
> > 5422 SoC.
>
> [snip]
>
> > +At the end of the build you should get in the output/images
> > directory the
> > +following files:
> > +
> > + - bl1.bin.hardkernel
> > +   Level 1 boot loader
> > +
> > + - bl2.bin.hardkernel.1mb_uboot
> > +   Level 2 boot loader
> > +
> > + - exynos5422-odroidxu4.dtb
> > +   Linux Kernel Device Tree blop
> > +
> > + - rootfs.tar
> > +   Compressed root file system image
>
> Not compressed.

Thanks Baruch, I will fix them.

Andi
