From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:26:26 +0200
Subject: [Buildroot] [PATCH] configs: new configuration for NXP i.MX51
 EVK
In-Reply-To: <1464908394-26641-1-git-send-email-festevam@gmail.com>
References: <1464908394-26641-1-git-send-email-festevam@gmail.com>
Message-ID: <20160608232626.597cffb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Jun 2016 19:59:54 -0300, Fabio Estevam wrote:
> Add a new configuration for NXP i.MX51 EVK based on U-boot 2016.05
> and kernel 4.6.1.
> 
> U-boot 2016.05 needs the patch c510f2e436008 ("video: ipu_common: fix build
> error") that is already in mainline to fix an IPU build error.
>     
> We can remove this patch in the future when we switch to U-boot 2016.07.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx51evk/genimage.cfg              | 41 ++++++++++++++++
>  .../0001-video-ipu_common-fix-build-error.patch    | 47 +++++++++++++++++++
>  board/freescale/imx51evk/post-image.sh             | 16 +++++++
>  board/freescale/imx51evk/readme.txt                | 54 ++++++++++++++++++++++
>  configs/mx51evk_defconfig                          | 37 +++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 board/freescale/imx51evk/genimage.cfg
>  create mode 100644 board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch
>  create mode 100755 board/freescale/imx51evk/post-image.sh
>  create mode 100644 board/freescale/imx51evk/readme.txt
>  create mode 100644 configs/mx51evk_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
