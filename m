From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 31 Jul 2014 00:05:32 +0200
Subject: [Buildroot] [PATCH 1/2] libndp: bump to 1.4
Message-ID: <1406757933-4362-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libndp/libndp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index 2f11a07..613aee8 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = v1.3
+LIBNDP_VERSION = v1.4
 LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPLv2.1+
 LIBNDP_LICENSE_FILES = COPYING
-- 
1.8.3.2
