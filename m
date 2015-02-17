From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Feb 2015 10:44:28 -0300
Subject: [Buildroot] [PATCH] dmraid: remove superfluous INSTALL_TARGET_OPTS
Message-ID: <1424180668-3929-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dmraid/dmraid.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index a6ed57f..fbb2387 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -11,7 +11,6 @@ DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
-DMRAID_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
 DMRAID_LICENSE = GPLv2
 DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
 
-- 
2.0.5
