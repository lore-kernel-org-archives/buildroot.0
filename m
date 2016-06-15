From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:44:07 +0200
Subject: [Buildroot] [PATCH v2 00/14] Bump NXP package versions
In-Reply-To: <cover.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
Message-ID: <20160615224407.6f9307b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 14:09:04 -0400, Andrew Webster wrote:

> Andrew Webster (14):
>   nxp defconfigs: bump u-boot version to 4.1.15_1.1.0_ga
>   nxp defconfigs: bump kernel version to 4.1.15
>   kernel-module-imx-gpu-viv: bump version to that of the 5.0.11.p8.4
>     release
>   imx-gpu-viv: bump version to 5.0.11-p8.4
>   xdriver_xf86-video-imx-viv: bump version to 5.0.11-p8.4
>   firmware-imx: bump to version 5.4
>   gst1-imx: bump to version 0.12.1
>   imx-vpu: bump to version 5.4.33
>   imx-codec: rename from libfslcodec and bump version to 4.0.9
>   imx-parser: rename from libfslparser and bump version to 4.0.9
>   imx-vpuwrap: rename from libfslvpuwrap and bump version to 1.0.65
>   libimxvpuapi: bump version to 0.10.2
>   imx-lib: bump version to 5.4
>   imx-kobs: bump version to 5.4

I've applied all 14 patches, some with a few changes (mainly after
comments from Gary). I'll reply individually to the patches for which I
made some changes, or for which I have some questions.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
