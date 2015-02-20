From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 20 Feb 2015 14:51:56 +0100
Subject: [Buildroot] [PATCH 1/1] liblinear: cleanup URL address
Message-ID: <1424440316-16158-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/liblinear/liblinear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 38aaefc..9eff62a 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBLINEAR_VERSION = 1.96
-LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear/$(LIBLINEAR_VERSION_MAJOR)
+LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3c
 LIBLINEAR_LICENSE_FILES = COPYING
 LIBLINEAR_INSTALL_STAGING = YES
-- 
1.9.1
