From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 20:12:20 +0100
Subject: [Buildroot] [PATCH] configs/snps_arc*_defconfig: update linux
 version
In-Reply-To: <20190327105555.831-1-Evgeniy.Didin@synopsys.com>
References: <20190327105555.831-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20190327201220.38c53208@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Mar 2019 13:55:55 +0300
Evgeniy Didin <evgeniy.didin@synopsys.com> wrote:

> With this commit we update for ARC boards Linux kernel
> version to 4.19.31 and Linux headers version to 4.19.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
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
