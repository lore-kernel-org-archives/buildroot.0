From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 11 Aug 2011 16:13:13 +0200
Subject: [Buildroot] [PATCH] tar: bump to 1.26
Message-ID: <4E43E379.3090201@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/tar/tar.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/tar/tar.mk
===================================================================
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-TAR_VERSION = 1.25
+TAR_VERSION = 1.26
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 
 $(eval $(call AUTOTARGETS,package,tar))
