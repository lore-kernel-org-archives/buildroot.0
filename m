From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:46 -0000
Subject: [Buildroot] [git commit branch/next] lttng-modules: bump to version
	2.0.3
Message-ID: <20120802195240.CD3538C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f9b64903005bf1f45a0e1a2d6d67696c7368c7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-modules/lttng-modules.mk |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

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
