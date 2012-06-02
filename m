From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:09:17 +0200
Subject: [Buildroot] [PATCH v3 3/4] lttng-modules: bump to version 2.0.3
In-Reply-To: <1338674958-1972-1-git-send-email-s.martin49@gmail.com>
References: <1338674958-1972-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1338674958-1972-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v2:
- bump to version 2.0.3

Changes since v1:
- bump to version 2.0.2

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 1820c8f..b31caa1 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -1,5 +1,10 @@
-LTTNG_MODULES_VERSION = 2.0-pre11
-LTTNG_MODULES_SITE    = http://lttng.org/files/bundles/20111214/
+#############################################################
+#
+# LTTng-modules: the kernel modules (requires at least Linux 2.6.38)
+#
+#############################################################
+LTTNG_MODULES_VERSION = 2.0.3
+LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2

 LTTNG_MODULES_DEPENDENCIES = linux
--
1.7.10.3
