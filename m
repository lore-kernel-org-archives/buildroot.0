From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 16:40:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/libndp: bump version to 1.5
Message-ID: <1454168407-3108-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libndp/libndp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index c40a017..c880b7e 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = v1.4
+LIBNDP_VERSION = v1.5
 LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPLv2.1+
 LIBNDP_LICENSE_FILES = COPYING
-- 
2.7.0.rc3
