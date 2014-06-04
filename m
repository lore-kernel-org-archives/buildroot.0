From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jun 2014 23:17:55 +0200
Subject: [Buildroot] [git commit] lite/Config.in: indentation cleanup
Message-ID: <20140604212607.72E2D9C2B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd86bae91bd624b5bda560ec9994f8b53a67d44f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lite/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

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
