From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 20 Feb 2015 13:28:59 +0100
Subject: [Buildroot] [PATCH 4/7] autoconf-archive: new package
In-Reply-To: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1424435342-2188-5-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains a collection of freely re-usable autoconf macros.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/autoconf-archive/autoconf-archive.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/autoconf-archive/autoconf-archive.mk

diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
new file mode 100644
index 0000000..e11df28
--- /dev/null
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# autoconf-archive
+#
+################################################################################
+
+AUTOCONF_ARCHIVE_VERSION = 2015.02.04
+AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
+AUTOCONF_ARCHIVE_SITE = http://gnu.cardse.net/autoconf-archive/
+AUTOCONF_ARCHIVE_LICENSE = GPLv3+
+AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING
+
+$(eval $(host-autotools-package))
-- 
2.1.4
