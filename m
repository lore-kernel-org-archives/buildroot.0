From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:24 +0200
Subject: [Buildroot] [PATCH 12/32] package/x11r7/xapp_x11perf: bump version
	to 1.6.0, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_x11perf/xapp_x11perf.hash |    2 ++
 package/x11r7/xapp_x11perf/xapp_x11perf.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_x11perf/xapp_x11perf.hash

diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.hash b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
new file mode 100644
index 0000000..8580993
--- /dev/null
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002566.html
+sha256	e87098dec1947572d70c62697a7b70bde1ab5668237d4660080eade6bc096751	x11perf-1.6.0.tar.bz2
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index a871486..8cba79d 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.5.4
+XAPP_X11PERF_VERSION = 1.6.0
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_X11PERF_LICENSE = MIT
-- 
1.7.10.4
