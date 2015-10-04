From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] imx-lib: remove now-redundant ccache
	handling
Message-ID: <20151004162324.EA54A81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7908e3443ecc93784468420c56e1e6be11a01e95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-lib/imx-lib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 92739a8..7046580 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -21,7 +21,7 @@ IMX_LIB_INCLUDE = \
 IMX_LIB_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
 	INCLUDE="$(IMX_LIB_INCLUDE)"
 
