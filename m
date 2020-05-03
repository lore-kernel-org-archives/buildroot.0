From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Sun, 3 May 2020 12:04:32 +0530
Subject: [Buildroot] [PATCH] configs/orangepi_rk3399: new defconfig
In-Reply-To: <20200502233409.4a90d4b2@windsurf.home>
References: <1588444408-20285-1-git-send-email-sunil@amarulasolutions.com>
 <20200502233409.4a90d4b2@windsurf.home>
Message-ID: <CAM+7aWt5knzvpc5qYQ4uyR7MQf6kGv6Qh5+=iMWPVTaUzwfU_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 3, 2020 at 3:04 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Sun,  3 May 2020 00:03:28 +0530
> sunil at amarulasolutions.com wrote:
>
> >  N:   Suniel Mahesh <sunil@amarulasolutions.com>
> >  F:   board/firefly/
> > +F:   board/orangepi/
>
> This puts you a contact for all board/orangepi/ boards, not just this
> one. Is this expected?
>
> No, that is not expected, I will send a v2. Thanks

> > +# Bootloader
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi-rk3399"
> > +BR2_TARGET_UBOOT_NEEDS_DTC=y
> > +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> > +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
>
> Are you sure these two options are needed? In fact the others rk3399
> defconfigs are wrong, and all what they need is Python 3.x. Could you
> check my series at:
>
>   http://patchwork.ozlabs.org/project/buildroot/list/?series=174258


I will do a quick test and see how it goes.

Suniel

>
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200503/eed591b2/attachment.html>
