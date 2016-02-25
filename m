From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:22:15 +0100
Subject: [Buildroot] [git commit branch/next] acl: cleanup pointless
	indentation
Message-ID: <20160225212411.7289981789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d3621224278bef25cad56ebbe51bc0d18d0d572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
