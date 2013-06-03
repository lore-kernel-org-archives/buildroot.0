From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Jun 2013 10:03:28 -0300
Subject: [Buildroot] [PATCH] libbsd: doesn't have any license files
Message-ID: <1370264608-2698-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuilder error:
http://autobuild.buildroot.net/results/ccd/ccd2f3fe69a3e0321685daf95f85eca5ba2d64cf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libbsd/libbsd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 3af1002..d5a4c39 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -8,7 +8,6 @@ LIBBSD_VERSION         = 0.4.2
 LIBBSD_SOURCE          = libbsd-$(LIBBSD_VERSION).tar.gz
 LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE         = BSD-3c MIT
-LIBBSD_LICENSE_FILES   = LICENSE
 
 # man-pages are BSD-4c, so that license only matters
 # if doc is kept in the target rootfs
-- 
1.8.1.5
