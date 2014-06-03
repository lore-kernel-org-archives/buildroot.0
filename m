From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Jun 2014 09:48:24 +0200
Subject: [Buildroot] [PATCH 1/1] lite/Config.in: indentation cleanup
Message-ID: <1401781704-325-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/lite/Config.in |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/lite/Config.in b/package/lite/Config.in
index 2f05279..62cd21e 100644
--- a/package/lite/Config.in
+++ b/package/lite/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_LITE
 	bool "LiTE (toolbox engine)"
 	depends on BR2_PACKAGE_DIRECTFB
 	help
-	   LiTE stands for LiTE is a Toolbox Engine.
-	   Its role is to facilitate the functions of DirectFB so that a
-	   toolbox could be written on top of DirectFB with less effort.
-	   As such LiTE has abstractions for the underlying graphics and
-	   event systems.
+	  LiTE stands for LiTE is a Toolbox Engine.
+	  Its role is to facilitate the functions of DirectFB so that a
+	  toolbox could be written on top of DirectFB with less effort.
+	  As such LiTE has abstractions for the underlying graphics and
+	  event systems.
 
-	   See http://www.directfb.org/wiki/index.php/LiTE:Architecture
+	  See http://www.directfb.org/wiki/index.php/LiTE:Architecture
-- 
1.7.9.5
