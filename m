From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:56:16 +0100
Subject: [Buildroot] [PATCH 1/1] configs/imx8mmpico: bump BSP components
 to 4.14.98_2.0.0
In-Reply-To: <20191202195423.417197-1-juju@cotds.org>
References: <20191202195423.417197-1-juju@cotds.org>
Message-ID: <20191216225616.23c80035@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Dec 2019 20:54:23 +0100
Julien Olivain <juju@cotds.org> wrote:

> Update Kernel, U-Boot and ATF to TechNexion BSP, based on NXP
> 4.14.98_2.0.0 release.
> 
> This patch also remove BR2_TARGET_UBOOT_FORMAT_IMX in defconfig which
> is not needed for this platform.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  configs/imx8mmpico_defconfig | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
