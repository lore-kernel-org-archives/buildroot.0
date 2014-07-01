From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 23:36:14 +0200
Subject: [Buildroot] [PATCH 0/14 v3] freescale: update userspace
 packages (branch yem/fsl-imx)
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <20140701233614.44585682@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Gary, Peter,

On Mon, 30 Jun 2014 23:52:10 +0200, Yann E. MORIN wrote:

> Gary Bisson (12):
>       freescale-imx: bump to version 3.10.17-1.0.0
>       freescale-imx: update imx-lib package
>       freescale-imx: change platform choice to be common
>       package/gpu-viv-bin-mx6q: only available for i.MX6Q
>       freescale-imx: add imx-vpu package
>       libfslvpuwrap: bump to version 1.0.46
>       libfslcodec: bump to version 3.0.11
>       libfslparser: bump to version 3.0.11
>       gst-fsl-plugins: bump to version 3.0.11
>       imx6sabresd: bump kernel version to 3.10.17
>       imx6sololiteevk: bump kernel version to 3.10.17
>       nitrogen6x: bump kernel version to 3.10.17
> 
> Yann E. MORIN (2):
>       package/gst-fsl-plugins: add default platform
>       defconfig/wandboard: update kernel + bootlaoder

For the entire series:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I believe Gary and Yann have done a great work on this, and that we
should merge this sooner rather than later, so that if any other fix or
improvement is needed, it can be done through follow-up patches. So I'd
like to see these patches being applied soon.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
