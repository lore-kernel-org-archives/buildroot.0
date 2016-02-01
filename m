From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:39:09 +0100
Subject: [Buildroot] [PATCH 02/10] imx-kobs: bump to version 5.1
In-Reply-To: <1454154357-31625-3-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-3-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201213909.2deb7b47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:49 +0100, Gary Bisson wrote:
> Use a different versioning schema based on package versioning
> instead of BSP version. This way, if a new BSP version does
> not bump this package, we can keep this package unchanged as well.
> 
> Changelog since 3.14.28-1.0.0_ga:
> - Add fixes for maximum ecc strength for each platform.
> - Add mx7 boot config support.
> - Add i.MX 6UltraLite support.
> - Join the ecc with real FCB data when not byte-aligned.
> - Generalize the encode_bch_ecc function for different configurations.
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/8d47a2e
> https://github.com/Freescale/meta-fsl-arm/commit/70edf16
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
>  package/freescale-imx/imx-kobs/imx-kobs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
