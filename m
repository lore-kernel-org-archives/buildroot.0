From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:56:19 +0100
Subject: [Buildroot] [PATCH 1/1] configs/imx8mpico: bump BSP components
 to 4.14.98_2.0.0
In-Reply-To: <20191202200300.418055-1-juju@cotds.org>
References: <20191202200300.418055-1-juju@cotds.org>
Message-ID: <20191216225619.6fc9d730@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Dec 2019 21:03:00 +0100
Julien Olivain <juju@cotds.org> wrote:

> Update Kernel, U-Boot and ATF to TechNexion BSP, based on NXP
> 4.14.98_2.0.0 release.
> 
> This patch also remove BR2_TARGET_UBOOT_FORMAT_IMX in defconfig which
> is not needed for this platform.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  configs/imx8mpico_defconfig | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
