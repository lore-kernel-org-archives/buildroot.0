From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 26 Sep 2014 16:42:07 -0400
Subject: [Buildroot] [PATCH] genimage: bump to version 7
Message-ID: <1411764127-14058-1-git-send-email-vivien.didelot@savoirfairelinux.com>
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
index a353c62..0c0c1e5 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION        = 6
+GENIMAGE_VERSION        = 7
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download
 GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
-- 
2.1.1
