From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 07 Sep 2011 10:52:44 +0200
Subject: [Buildroot] [PATCH] iw: bump to 3.1
Message-ID: <4E6730DC.7090103@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/iw/iw.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/iw/iw.mk
===================================================================
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 3.0
+IW_VERSION = 3.1
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
