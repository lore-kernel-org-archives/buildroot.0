From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  9 Apr 2017 14:04:12 +0530
Subject: [Buildroot] [PATCH 01/10] micropython-lib: use SPDX short
	identifier for Python license
Message-ID: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/micropython-lib/micropython-lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index 066572e..c9423fe 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -6,7 +6,7 @@
 
 MICROPYTHON_LIB_VERSION = v1.8.6
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
-MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
+MICROPYTHON_LIB_LICENSE = Python-2.0 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
 
 define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
-- 
2.7.4
