From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 24 Feb 2016 11:26:30 -0300
Subject: [Buildroot] [PATCH v2 2/4] attr: cleanup pointless indentation
In-Reply-To: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1456323992-27845-3-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.4.10
