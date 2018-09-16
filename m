From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 10:15:01 +0200
Subject: [Buildroot] [PATCH 5/5] configs/solidrun_macchiatobin_marvell:
 bump component versions
In-Reply-To: <20180916042141.4fsryjj54fig2mcc@sapphire.tkos.co.il>
References: <20180914153326.19346-1-thomas.petazzoni@bootlin.com>
 <20180914153326.19346-6-thomas.petazzoni@bootlin.com>
 <20180916042141.4fsryjj54fig2mcc@sapphire.tkos.co.il>
Message-ID: <20180916101501.5448d307@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Sun, 16 Sep 2018 07:21:41 +0300, Baruch Siach wrote:

> >  # Kernel
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.52-armada-17.10.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.120-armada-18.09.tar.gz"  
> 
> Why not bump to linux-4.14.22-armada-18.09? Is there any missing functionality 
> in that release?

My understanding is that 4.4 is the BSP version that Marvell considers
complete and stable, which has received full QA testing. 4.14 is still
in development, and will be fully ready by the end of the year.
Therefore, in this defconfig using vendor-provided versions of the
components, it probably makes sense to stick to 4.4 for now ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
