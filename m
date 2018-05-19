From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:44:40 +0200
Subject: [Buildroot] [PATCH v2] configs/snps_arc*_defconfig: update
 linux version
In-Reply-To: <20180514080924.5065-1-Evgeniy.Didin@synopsys.com>
References: <20180514080924.5065-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180519224440.3221d197@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 11:09:24 +0300, Evgeniy Didin wrote:
> With this commit we update Linux kernel version to 4.16.8
> and Linux headers version to 4.16.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Changes since v1:
> -Switch kernel version to 4.16.8
> -Switch back to BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_* option usage
>  configs/snps_arc700_axs101_defconfig  | 6 +++---
>  configs/snps_archs38_axs103_defconfig | 6 +++---
>  configs/snps_archs38_haps_defconfig   | 6 +++---
>  configs/snps_archs38_hsdk_defconfig   | 6 +++---
>  configs/snps_archs38_vdk_defconfig    | 6 +++---
>  5 files changed, 15 insertions(+), 15 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
