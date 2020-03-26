From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:10:27 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8{mm,
 mq}evk: bump BSP components to 4.19.35_1.1.0
In-Reply-To: <1585231500-8777-2-git-send-email-laurent.gauthier_1@oss.nxp.com>
References: <1585231500-8777-1-git-send-email-laurent.gauthier_1@oss.nxp.com>
 <1585231500-8777-2-git-send-email-laurent.gauthier_1@oss.nxp.com>
Message-ID: <20200326231027.7588454f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 15:05:00 +0100
"Laurent Gauthier (OSS)" <laurent.gauthier_1@oss.nxp.com> wrote:

> From: Laurent GAUTHIER <laurent.gauthier_1@oss.nxp.com>
> 
> Disabled creation of u-boot.imx image as it fails, and is not required.
> Final boot image is created from uboot binary and firmwares in post image
> script board/freescale/common/imx/imx8-bootloader-prepare.sh
> 
> With the bump of the kernel to 4.19, the kernel configuration now needs
> host-openssl to build.
> 
> Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
> Signed-off-by: Laurent GAUTHIER <laurent.gauthier_1@oss.nxp.com>
> ---
>  configs/freescale_imx8mmevk_defconfig | 10 +++++-----
>  configs/freescale_imx8mqevk_defconfig | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
