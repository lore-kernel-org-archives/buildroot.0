From: Dagg Stompler <daggs@gmx.com>
Date: Mon, 25 Jul 2016 21:01:20 +0300
Subject: [Buildroot] [PATCH] odroid-scripts: select fbset if selected.
Message-ID: <20160725180120.24643-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/odroid-scripts/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
index 48544b6..975b4fd 100644
--- a/package/odroid-scripts/Config.in
+++ b/package/odroid-scripts/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ODROID_SCRIPTS
 	bool "odroid-scripts"
 	depends on BR2_aarch64 || BR2_arm
+	select BR2_PACKAGE_FBSET
 	help
 	  Install the scripts for the odroidc2 based systems.
 
-- 
2.9.2
