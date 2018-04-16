From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 16:21:14 +0200
Subject: [Buildroot] [git commit] legacy: remove options made legacy 5 years
 ago
Message-ID: <20180416142133.2DBE4882F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a52e106bbd080583133c7a38010dff5d5441dd4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index eeefea191c..3d8b28c5fe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3188,23 +3188,6 @@ config BR2_HAVE_DEVFILES
 	  completely from Buildroot.
 	  See Buildroot's documentation for more explanations.
 
-###############################################################################
-comment "Legacy options removed in 2013.05"
-
-config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
-	bool "Realtek 8192 replaced by Realtek 81xx"
-	select BR2_LEGACY
-	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
-	help
-	  Now covers the whole Realtek 81xx familly: 8188/8192.
-
-config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
-	bool "Realtek 8712 replaced by Realtek 87xx"
-	select BR2_LEGACY
-	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
-	help
-	  Now covers the whole Realtek 87xx familly: 8712/8723.
-
 endmenu
 
 endif # !SKIP_LEGACY
