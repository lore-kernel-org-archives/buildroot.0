From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:39:12 +0100
Subject: [Buildroot] [PATCH 03/10] imx-lib: bump to version 5.1
In-Reply-To: <1454154357-31625-4-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-4-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201213912.6b6b110f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:50 +0100, Gary Bisson wrote:
> Change version to be independent of BSP version.  This limits
> confusion on future BSP updates that do not include imx-lib updates.
> 
> Changelog since 3.14.28-1.0.0_ga:
> - Add i.MX 7D support.
> - Change LICENSE file.
> - Enable pxp libraries for i.MX 6UltraLite.
> - Fix rng and shara2 to exclude the 6UL platform to avoid build breaks
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/b299454
> https://github.com/Freescale/meta-fsl-arm/commit/5f28af0
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
>  package/freescale-imx/imx-lib/imx-lib.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
