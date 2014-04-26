From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 26 Apr 2014 09:08:20 +0100
Subject: [Buildroot] [PATCH] libtpl: bump version to v1.6.1
Message-ID: <1398499700-621-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libtpl/libtpl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 1d4becf..ed3bfb5 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPL_VERSION = 6df007e450cbee7d7a4896d3538128c5370b1c61
+LIBTPL_VERSION = v1.6.1
 LIBTPL_SITE = $(call github,troydhanson,tpl,$(LIBTPL_VERSION))
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
-- 
1.9.1
