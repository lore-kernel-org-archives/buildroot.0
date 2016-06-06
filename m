From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:34:30 +0200
Subject: [Buildroot] [PATCH 07/10] imx-gpu-viv: bump version to
	5.0.11-p8.3
In-Reply-To: <53987918b70ef751a691c842306f89cfa620d3bd.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <53987918b70ef751a691c842306f89cfa620d3bd.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-ytQQdz55AnJJJG8OO4OKwdicq7ti-Wzxt6k-4obnMVFSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:12 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> Software floating point is no longer supported.
>
> For a detailed list of changes in this update, see the Graphics section of
> the i.MX Linux Release Notes contained in the i.MX Linux BSP documentation
> here:
>
> https://www.nxp.com/webapp/Download?colCode=L4.1.15_1.0.0_LINUX_DOCS&location=null&fpsp=1&WT_TYPE=Supporting%20Information&WT_VENDOR=FREESCALE&WT_FILE_FORMAT=gz&WT_ASSET=Documentation&fileExt=.gz&Parent_nodeId=1337637154535695831062&Parent_pageType=product
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/b667ed4

I actually recommend going straight to version p8.4 since it brings
its fair share of bug fixes:
http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-bsp.git/tree/GraphicsChangeLog?h=imx-3.14.52-1.1.0_ga
https://github.com/Freescale/meta-fsl-arm/commit/af5b3a6c

Also, as said in the cover letter, this patch should be followed by
the kernel module update.
https://github.com/Freescale/meta-fsl-arm/commit/c9c30c56

Regards,
Gary
