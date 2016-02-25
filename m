From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:24:20 +0100
Subject: [Buildroot] [git commit branch/next] attr: cleanup pointless
	indentation
Message-ID: <20160225212457.213C87FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a14a68057644555ddefb4ae8e9923397377daf5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/attr/attr.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index e9963ba..3db66cb 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -15,15 +15,15 @@ ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
 # around their deficiencies by passing installation paths.
-ATTR_INSTALL_STAGING_OPTS = 			\
-	prefix=$(STAGING_DIR)/usr 		\
-	exec_prefix=$(STAGING_DIR)/usr 		\
-	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 	\
+ATTR_INSTALL_STAGING_OPTS = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr \
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
 	install-dev install-lib
 
-ATTR_INSTALL_TARGET_OPTS = 			\
-	prefix=$(TARGET_DIR)/usr 		\
-	exec_prefix=$(TARGET_DIR)/usr 		\
+ATTR_INSTALL_TARGET_OPTS = \
+	prefix=$(TARGET_DIR)/usr \
+	exec_prefix=$(TARGET_DIR)/usr \
 	install install-lib
 
 HOST_ATTR_INSTALL_OPTS = \
