From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:31 +0200
Subject: [Buildroot] [PATCH 19/32] package/x11r7/xapp_xgc: bump version to
	1.0.5, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-19-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xgc/xapp_xgc.hash |    2 ++
 package/x11r7/xapp_xgc/xapp_xgc.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xgc/xapp_xgc.hash

diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
new file mode 100644
index 0000000..7972a6f
--- /dev/null
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002575.html
+sha256	14828d9bda358ad57efc0206bc416ee33ba542091edb186485cca5389adc2f5e	xgc-1.0.5.tar.bz2
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 6ea4ebb..41d42c4 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.4
+XAPP_XGC_VERSION = 1.0.5
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGC_LICENSE = MIT
-- 
1.7.10.4
