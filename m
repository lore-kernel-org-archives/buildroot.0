From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 14:25:11 -0300
Subject: [Buildroot] [PATCH] acl: cleanup pointless indentation
Message-ID: <1456161911-12929-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/acl/acl.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 62e5d15..cbe5e93 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -16,15 +16,15 @@ ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
 # around their deficiencies by passing installation paths.
-ACL_INSTALL_STAGING_OPTS = 			\
-	prefix=$(STAGING_DIR)/usr 		\
-	exec_prefix=$(STAGING_DIR)/usr 		\
-	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
+ACL_INSTALL_STAGING_OPTS = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr \
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
 	install-dev install-lib
 
-ACL_INSTALL_TARGET_OPTS = 			\
-	prefix=$(TARGET_DIR)/usr 		\
-	exec_prefix=$(TARGET_DIR)/usr 		\
+ACL_INSTALL_TARGET_OPTS = \
+	prefix=$(TARGET_DIR)/usr \
+	exec_prefix=$(TARGET_DIR)/usr \
 	install install-lib
 
 # The libdir variable in libacl.la is empty, so let's fix it. This is
-- 
2.4.10
