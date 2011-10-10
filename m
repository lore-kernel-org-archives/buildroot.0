From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 10 Oct 2011 20:08:23 +0200
Subject: [Buildroot] [PATCH 2/2 v2] icon-naming-utils for tango-icon-theme
In-Reply-To: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>
References: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>
Message-ID: <1318270103-32230-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/icon-naming-utils/icon-naming-utils.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/icon-naming-utils/icon-naming-utils.mk

diff --git a/package/icon-naming-utils/icon-naming-utils.mk b/package/icon-naming-utils/icon-naming-utils.mk
new file mode 100644
index 0000000..1ac359a
--- /dev/null
+++ b/package/icon-naming-utils/icon-naming-utils.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# icon-naming-utils
+#
+#############################################################
+ICON_NAMING_UTILS_VERSION = 0.8.90
+ICON_NAMING_UTILS_SOURCE = icon-naming-utils-$(ICON_NAMING_UTILS_VERSION).tar.gz
+ICON_NAMING_UTILS_SITE = http://tango.freedesktop.org/releases/
+HOST_ICON_NAMING_UTILS_CONF_OPT = --datarootdir=$(HOST_DIR)/usr/lib
+
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.0.4
