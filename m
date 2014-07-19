From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Jul 2014 15:53:19 +0200
Subject: [Buildroot] [PATCH 3/7] package/pixman: Bump version to 0.32.6
In-Reply-To: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405778003-2712-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pixman/pixman.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 91f3332..23c2639 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.32.4
+PIXMAN_VERSION = 0.32.6
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
-- 
1.7.10.4
