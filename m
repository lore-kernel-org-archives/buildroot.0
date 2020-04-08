From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:45:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx/imx-vpu: bump
 version to 5.4.39.1
In-Reply-To: <20200407202044.9924-2-laurent.gauthier_1@oss.nxp.com>
References: <20200407202044.9924-1-laurent.gauthier_1@oss.nxp.com>
 <20200407202044.9924-2-laurent.gauthier_1@oss.nxp.com>
Message-ID: <20200408214505.4afad798@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 22:20:42 +0200
"Laurent Gauthier (OSS)" <laurent.gauthier_1@oss.nxp.com> wrote:

> From: Laurent GAUTHIER <laurent.gauthier_1@oss.nxp.com>
> 
> To match NXP BSP 4.19.35_1.1.0 release:
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-vpu?h=warrior-4.19.35-1.1.0
> 
> Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
> Signed-off-by: Laurent Gauthier <laurent.gauthier_1@oss.nxp.com>
> ---
>  package/freescale-imx/imx-vpu/imx-vpu.hash | 6 +++---
>  package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied to master. However, you should have explained in the
commit log why the license files have changed. This is the whole reason
for having hashes for the license files: so that we detect when they
are changed. So if the hashes are silently updated with no details in
the commit log, it kind of misses the point.

So I looked at the differences and updated the commit log accordingly.

Another thing that could be done is to drop one of the two license
files. They are strictly the same, except for an additional newline at
the end of the files in COPYING compared to EULA.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
