From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:39:20 +0200
Subject: [Buildroot] [PATCH 1/2] configs: asus_tinker_rk3288: Fix
 booting larger uImage
In-Reply-To: <20190415143409.24726-1-shyam.saini@amarulasolutions.com>
References: <20190415143409.24726-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190415213920.363747b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Apr 2019 20:04:08 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> Default value of CONFIG_SYS_BOOTM_LEN in u-boot causes board reset for
> larger uImage files, so add u-boot patch to increase its size
> 
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
> ---
>  ...figs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch | 35 ++++++++++++++++++++++
>  configs/asus_tinker_rk3288_defconfig               |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch

Both applied, thanks. Please send the U-Boot patch to U-Boot upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
