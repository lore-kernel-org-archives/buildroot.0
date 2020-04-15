From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:51:53 +0200
Subject: [Buildroot] [PATCH 1/2] imx/genimage: Specify the volume-label
 for vfat
In-Reply-To: <20200415123656.13298-1-festevam@gmail.com>
References: <20200415123656.13298-1-festevam@gmail.com>
Message-ID: <20200415225153.0b4ea409@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 09:36:55 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Currently the volume-label for the vfat partition is a string with
> the following pattern: 5934-861D.
> 
> Specify the volume-label as "boot" to make it easier to identify it. 
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/common/imx/genimage.cfg.template      | 1 +
>  board/freescale/common/imx/genimage.cfg.template_imx8 | 1 +
>  board/freescale/common/imx/genimage.cfg.template_spl  | 1 +
>  3 files changed, 3 insertions(+)

Series applied, thanks. I've also added another patch that drops the
useless BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs" from a few defconfigs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
