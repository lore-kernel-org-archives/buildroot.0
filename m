From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:44:45 +0200
Subject: [Buildroot] [PATCH] configs/snps_arc*_defconfig: update u-boot
 version
In-Reply-To: <20180514081035.5167-1-Evgeniy.Didin@synopsys.com>
References: <20180514081035.5167-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180519224445.62da9cef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 11:10:35 +0300, Evgeniy Didin wrote:
> With this commit we update u-boot version to 2018.05 for
> Synopsys boards. U-boot version 2018.05 was released recently
> and includes significant changes for ARC boards:
>  * Fix for compile-time warning for AXS10x
>  * Add support of platform-specific commands for HSDK
>  * Add support for on-board SPI flash on HSDK
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  .../0001-axs103-Clean-up-smp_kick_all_cpus.patch   | 48 ---------------
>  ...ort-slave-core-kick-start-on-axs103-v1.1-.patch | 72 ----------------------
>  configs/snps_arc700_axs101_defconfig               |  2 +-
>  configs/snps_archs38_axs103_defconfig              |  3 +-
>  configs/snps_archs38_hsdk_defconfig                |  2 +-
>  5 files changed, 3 insertions(+), 124 deletions(-)
>  delete mode 100644 board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
>  delete mode 100644 board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
