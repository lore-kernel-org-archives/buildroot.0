From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Oct 2015 23:19:55 +0200
Subject: [Buildroot] [PATCH 1/4] package/pixman: bump version to 0.32.8
Message-ID: <1443907198-6833-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pixman/pixman.hash | 2 +-
 package/pixman/pixman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index c6ec14e..cb00b2f 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,2 +1,2 @@
 # From http://cairographics.org/releases/pixman-0.32.6.tar.gz.sha1
-sha1	8791343cbf6d99451f4d08e8209d6ac11bf96df2	pixman-0.32.6.tar.gz
+sha1	c1119bbdb587c56009b653e6f81c083f98a20135	pixman-0.32.8.tar.gz
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index a244ea8..0e4b0b9 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.32.6
+PIXMAN_VERSION = 0.32.8
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
-- 
2.5.3
