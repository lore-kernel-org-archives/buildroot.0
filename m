From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 10:02:41 +0100
Subject: [Buildroot] [PATCH 2/9] package/freescale-imx/firmware-imx: Fix
 typos
In-Reply-To: <20181226223112.24456-2-nerv@dawncrow.de>
References: <20181226223112.24456-1-nerv@dawncrow.de>
 <20181226223112.24456-2-nerv@dawncrow.de>
Message-ID: <20181227100241.3c7c1113@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 23:31:05 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 0a503d7a66..240985297c 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -35,7 +35,7 @@ endef
>  
>  define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>  	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
> -	# lpddr4_pmu_train_fw.bin isneeded when generating imx-boot-imx8mqevk-sd.bin
> +	# lpddr4_pmu_train_fw.bin is needed when generating imx-boot-sd.bin

Ditto, isn't this imx8-boot-sd.bin ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
