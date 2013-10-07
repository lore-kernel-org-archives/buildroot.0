From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 07 Oct 2013 15:08:41 +0800
Subject: [Buildroot] [PATCH] lcms2: bump to version 2.5
Message-ID: <1381129721.4897.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/lcms2/lcms2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index c997ac3..993677b 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.4
+LCMS2_VERSION = 2.5
 LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
-- 
1.8.1.2
