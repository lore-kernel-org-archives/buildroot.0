From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:18:47 +0100
Subject: [Buildroot] [PATCH 1/2] configs/engicam_imx6qdl_icore_qt5:
 Select the KMSRO gallium driver
In-Reply-To: <20191026193445.25227-1-festevam@gmail.com>
References: <20191026193445.25227-1-festevam@gmail.com>
Message-ID: <20191027121847.0fe87ab2@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 16:34:44 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> After migrating to Mesa 19.2 the imx-drm_dri.so is no longer installed
> unless the kmsro gallium driver is selected, so explicitly select
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO to fix the problem.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/engicam_imx6qdl_icore_qt5_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
