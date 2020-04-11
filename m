From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:03:13 +0200
Subject: [Buildroot] [PATCH] configs/snps_arc*_defconfig: update linux
 version
In-Reply-To: <20200410201659.24208-1-Evgeniy.Didin@synopsys.com>
References: <20200410201659.24208-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200411100313.4fad1eba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 23:16:59 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> With this commit we update for ARC boards Linux kernel
> version to 5.6.3 and Linux headers version to 5.6.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  configs/snps_arc700_axs101_defconfig  | 6 +++---
>  configs/snps_archs38_axs103_defconfig | 6 +++---
>  configs/snps_archs38_haps_defconfig   | 6 +++---
>  configs/snps_archs38_hsdk_defconfig   | 6 +++---
>  configs/snps_archs38_vdk_defconfig    | 6 +++---
>  5 files changed, 15 insertions(+), 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
