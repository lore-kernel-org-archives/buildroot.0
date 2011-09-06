From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 06 Sep 2011 11:42:22 +0200
Subject: [Buildroot] [PATCH] lzo: bump to 2.06
Message-ID: <4E65EAFE.4090708@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/lzo/lzo.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/lzo/lzo.mk
===================================================================
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -3,7 +3,7 @@
 # lzo
 #
 #############################################################
-LZO_VERSION = 2.05
+LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_INSTALL_STAGING = YES
 
