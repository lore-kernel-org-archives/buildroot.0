From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] imx-vpu: remove now-redundant ccache
	handling
Message-ID: <20151004162324.F2CE881D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c54444e41ce105364b584f4d4736629031b59332
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 3606857..571cc40 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -13,7 +13,7 @@ IMX_VPU_INSTALL_STAGING = YES
 IMX_VPU_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
 
 IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
