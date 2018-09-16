From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Sep 2018 12:31:55 +0300
Subject: [Buildroot] [PATCH 5/5] configs/solidrun_macchiatobin_marvell:
 bump component versions
In-Reply-To: <20180916101501.5448d307@windsurf>
References: <20180914153326.19346-1-thomas.petazzoni@bootlin.com>
 <20180914153326.19346-6-thomas.petazzoni@bootlin.com>
 <20180916042141.4fsryjj54fig2mcc@sapphire.tkos.co.il>
 <20180916101501.5448d307@windsurf>
Message-ID: <20180916093154.nyhxiqdaixcfhiet@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Sep 16, 2018 at 10:15:01AM +0200, Thomas Petazzoni wrote:
> On Sun, 16 Sep 2018 07:21:41 +0300, Baruch Siach wrote:
> > >  # Kernel
> > >  BR2_LINUX_KERNEL=y
> > >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.52-armada-17.10.tar.gz"
> > > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.120-armada-18.09.tar.gz"  
> > 
> > Why not bump to linux-4.14.22-armada-18.09? Is there any missing functionality 
> > in that release?
> 
> My understanding is that 4.4 is the BSP version that Marvell considers
> complete and stable, which has received full QA testing. 4.14 is still
> in development, and will be fully ready by the end of the year.
> Therefore, in this defconfig using vendor-provided versions of the
> components, it probably makes sense to stick to 4.4 for now ?

Sounds reasonable to me. The commit log should probably include this 
information.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
