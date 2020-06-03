From: =?UTF-8?Q?Gon=C3=A7alo_Salazar?= <glbsalazar@gmail.com>
Date: Wed, 3 Jun 2020 11:39:37 +0100
Subject: [Buildroot] [PATCH 1/1] configs/orangepi-zero: bumped kernel
 uboot versions
In-Reply-To: <20200602231834.6acb2e9e@windsurf.home>
References: <20200531163645.2522167-1-glbsalazar@gmail.com>
 <20200602231834.6acb2e9e@windsurf.home>
Message-ID: <CAPJzBTp=CBUseNd-0fKWAGQSV+5iDGmr47fQXe_pnFiqE15D7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you!
I'll keep that in mind in future commits.

Gon?alo Salazar

Thomas Petazzoni <thomas.petazzoni@bootlin.com> escreveu no dia ter?a,
2/06/2020 ?(s) 22:18:
>
> Hello,
>
> On Sun, 31 May 2020 17:36:45 +0100
> Gon?alo Salazar <glbsalazar@gmail.com> wrote:
>
> > Bumped kernel to version 5.6 and uboot to version 2020.04 for
> > orangepi-zero configuration
> >
> > Signed-off-by: Gon?alo Salazar <glbsalazar@gmail.com>
>
> I've applied your patch to master, thanks! However, there were a few
> issues. First, your commit title and commit log were formulated using
> the past tense ("bumped") while it should use the present, i.e "bump".
>
> > diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
> > index 354e3bfdba..ab4fb474ee 100644
> > --- a/configs/orangepi_zero_defconfig
> > +++ b/configs/orangepi_zero_defconfig
> > @@ -3,13 +3,12 @@ BR2_cortex_a7=y
> >  BR2_ARM_FPU_VFPV4=y
> >  BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
> >  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
>
> This should have been kept, as follows:
>
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
>
> Indeed, while this is currently the default, it will soon no longer be
> the default, once we move to 5.7 as the default kernel headers.
>
> Applied with those fixes. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
