From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 13:29:23 +0200
Subject: [Buildroot] [PATCH v2 00/13] Update Freescale packages to
 3.10.53-1.1.0_GA
In-Reply-To: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20150711132923.31479bf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Tue, 26 May 2015 10:19:29 +0200, Gary Bisson wrote:

> Antoine Tenart (1):
>   gpu-viv-bin-mx6q: bump to 5.0.11.p4.1
> 
> Gary Bisson (12):
>   libfslvpuwrap: bump version to 1.0.57
>   libfslcodec: bump version to 4.0.2
>   libfslparser: bump version to 4.0.2
>   gst-fsl-plugins: bump version to 4.0.2
>   imx-vpu: bump version to 5.4.27
>   freescale-imx: bump to 3.10.53-1.1.0 GA release
>   gpu-viv-bin-mx6q: rename package to imx-gpu-viv
>   xdriver_xf86-video-imx-viv: bump to version 3.10.53-1.1.0 GA
>   nitrogen6x_defconfig: bump version to 3.10.53_1.1.1_ga
>   board/boundarydevices: rework and update u-boot scripts
>   freescale_imx6*_defconfig: bump version to 3.10.53-1.1.0 GA
>   qmx6_defconfig: bump version to 3.10.53_1.1.0

I've applied all patches, thanks!

However, there was one minor nit that I fixed along the way: you did
put a lot of interesting information in the commit log, but below the
"---" line. As long as the information is not "personal" like "Hey,
<foo>, can you test this patch?", I think it's more useful to have in
the commit log. For example, the reference to the corresponding Yocto
change, the commands you have used to test the change definitely belong
to the commit log.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
