From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:19:51 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mqevk: bump BSP
 components to 4.14.98_2.0.0
In-Reply-To: <20191203203805.408448-1-juju@cotds.org>
References: <20191203203805.408448-1-juju@cotds.org>
Message-ID: <20191208221951.1ff39468@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 21:38:05 +0100
Julien Olivain <juju@cotds.org> wrote:

> Update Kernel, U-Boot and ATF to NXP BSP version rel_imx_4.14.98_2.0.0_ga
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  configs/freescale_imx8mqevk_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Fabio: I saw your comment about bumping to 4.19. It obviously makes
sense to upgrade to 4.19 when possible, but since bumping to a slightly
newer 4.14 also makes sense on its own, I've applied Julien's patch.
But of course, bumping to 4.19 needs to be done at some point in the
future.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
