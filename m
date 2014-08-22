From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 22 Aug 2014 22:24:42 +0200
Subject: [Buildroot] [PATCH 3/3] libsoc: bump to 0.6.3
In-Reply-To: <1408739082-18284-1-git-send-email-yegorslists@googlemail.com>
References: <1408739082-18284-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1408739082-18284-3-git-send-email-yegorslists@googlemail.com>
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
index 85a22da..612be99 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.6.2
+LIBSOC_VERSION = 0.6.3
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
-- 
1.8.3.2
