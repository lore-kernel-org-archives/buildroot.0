From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  8 May 2012 15:41:53 +0200
Subject: [Buildroot] [PATCH 2/3] lttng-modules: bump to version 2.0.2
In-Reply-To: <1336484514-17578-1-git-send-email-s.martin49@gmail.com>
References: <87vckmamle.fsf@macbook.be.48ers.dk>
 <1336484514-17578-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336484514-17578-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-modules/lttng-modules.mk |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 1820c8f..77cb7cc 100644
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
+LTTNG_MODULES_VERSION = 2.0.2
+LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 
 LTTNG_MODULES_DEPENDENCIES = linux
-- 
1.7.10.1
