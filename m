From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 30 Sep 2015 23:05:16 -0300
Subject: [Buildroot] Wandboard Solo/Dual/Quad support
In-Reply-To: <20150930220150.2cfc3ae5@free-electrons.com>
References: <CANu7NGtUCHKhNDZwA7im_nCgB82NXYdwzr6gjGnq0b+yGOmVBw@mail.gmail.com>
 <20150930220150.2cfc3ae5@free-electrons.com>
Message-ID: <CANu7NGs-cPWXP73hUD+BV_O-kU1ygFD-eAh42WVCcRGbJWJxVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Yes, you are right.

I was bumping to the 2015.04 version of U-Boot from the official Freescale
repository (git://github.com/Freescale/u-boot-fslc.git) that has 3 separate
defconfigs.

But I can see that since U-Boot mainline version 2015.07, SPL is used and
we have only one defconfig. So I will bump to this version.

Thanks!

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-09-30 17:01 GMT-03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Sergio Prado,
>
> On Wed, 30 Sep 2015 13:45:55 -0300, Sergio Prado wrote:
>
> > I'm working on the config files for the wandboard solo, dual and quad,
> and
> > I have a few questions:
> >
> > 1. Are you guys OK with this organization?
> >
> > $ ls configs/wandboard*
> > configs/wandboard_solo_defconfig
> > configs/wandboard_dual_defconfig
> > configs/wandboard_quad_defconfig
>
> Is there a reason to have 3 separate defconfigs? In the Linux kernel, a
> single configuration can support all three variants, and it seems to be
> the case in U-Boot as well:
>
>   ./configs/wandboard_defconfig
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150930/a0608b56/attachment.html>
