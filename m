From: Simon Dawson <spdawson@gmail.com>
Date: Wed,  2 Jul 2014 18:16:06 +0100
Subject: [Buildroot] [PATCH] zyre: bump version to v1.0.0
Message-ID: <1404321366-6820-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zyre/zyre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 66952aa..013299e 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 378b8b5cf76d10f5e41b339a4bcb0dc6197a9edf
+ZYRE_VERSION = v1.0.0
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
-- 
1.9.1
