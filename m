From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 23 May 2014 21:52:00 +0200
Subject: [Buildroot] [PATCH] libsoc: bump to 0.6.1
Message-ID: <1400874720-2339-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsoc/libsoc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 09aee35..d1a55e7 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.6
+LIBSOC_VERSION = 0.6.1
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
-- 
1.8.3.2
