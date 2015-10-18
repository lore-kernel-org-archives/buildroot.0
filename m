From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Oct 2015 18:15:49 +0200
Subject: [Buildroot] [PATCH 1/2] Config.in.legacy: remove empty line
Message-ID: <1445184950-9386-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7d2d63f..a452bf5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -250,7 +250,6 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
 	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
 	  examples.
 
-
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
 	bool "DirectFB example df_fire has been removed"
 	select BR2_LEGACY
-- 
2.6.1
