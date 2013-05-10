From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Fri, 10 May 2013 11:13:30 +0200
Subject: [Buildroot] [PATCH] Correct path error in
	package/freescale-imx/Config.in
Message-ID: <1368177210-3899-1-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/freescale-imx/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 1f60192..8d0e347 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -11,6 +11,6 @@ menuconfig BR2_PACKAGE_IMX
 
 
 if BR2_PACKAGE_IMX
-source "package/imx-lib/Config.in"
+source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 endif
-- 
1.7.10.4
