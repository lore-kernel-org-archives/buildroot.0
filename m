From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 11:59:20 +0200
Subject: [Buildroot] [PATCH v2 1/2] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
In-Reply-To: <1531084579-7949-1-git-send-email-festevam@gmail.com>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
Message-ID: <20180718115920.081138a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Jul 2018 18:16:18 -0300, Fabio Estevam wrote:
> Add support for flashing the u-boot-dtb.imx binary in the SD card
> when a target selects BR2_TARGET_UBOOT_FORMAT_DTB_IMX.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Use a UBOOTBIN variable to decide the U-Boot binary name instead
> of creating a new genimage.cfg variant. (Thanks to Arnout!)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
