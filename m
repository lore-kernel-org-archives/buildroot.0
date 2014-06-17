From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 17 Jun 2014 15:11:01 +0200
Subject: [Buildroot] [PATCH] libsoc: bump to 0.6.2
Message-ID: <1403010661-16061-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsoc/libsoc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index d1a55e7..85a22da 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.6.1
+LIBSOC_VERSION = 0.6.2
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
-- 
1.8.1.2
