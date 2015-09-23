From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 23 Sep 2015 09:34:53 -0400
Subject: [Buildroot] [PATCH] genimage: bump to version 8
Message-ID: <1443015293-16426-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 package/genimage/genimage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 07d95a4..2dffbc5 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 7
+GENIMAGE_VERSION = 8
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
 GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
-- 
2.5.2
