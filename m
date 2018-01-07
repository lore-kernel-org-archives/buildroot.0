From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:54:18 +0100
Subject: [Buildroot] [PATCH v2 00/15] imx: update packages to
 4.9.x_1.0.0_ga release
In-Reply-To: <20180105143947.26934-1-gary.bisson@boundarydevices.com>
References: <20180105143947.26934-1-gary.bisson@boundarydevices.com>
Message-ID: <20180107155418.30aa4377@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Jan 2018 15:39:32 +0100, Gary Bisson wrote:

> Gary Bisson (15):
>   freescale-imx: add config options for i.MX6SL/SX and i.MX7D/ULP
>   imx-lib: bump to version imx_4.9.11_1.0.0_ga
>   imx-gpu-g2d: new package
>   imx-gpu-viv: bump to version 6.2.2.p0
>   kernel-module-imx-gpu-viv: bump to version 6.2.2.p0
>   xdriver_xf86-video-imx-viv: bump to version 6.2.2.p0
>   firmware-imx: bump to version 6.0
>   imx-codec: bump to version 4.2.1
>   imx-parser: bump to version 4.2.1
>   imx-vpu: bump to version 5.4.37
>   imx-kobs: bump revision to a0e9adce
>   imx-uuc: bump revision to 2ae63428
>   configs: freescale_imx*: bump to version 4.9.x_1.0.0_ga
>   configs: nitrogen*: bump kernel version to 4.9.x_1.0.0_ga
>   configs: nitrogen*: bump u-boot version to 2017.07

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
