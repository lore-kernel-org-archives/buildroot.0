From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:32 +0200
Subject: [Buildroot] [PATCH 20/32] package/x11r7/xapp_xhost: bump version to
	1.0.7, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xhost/xapp_xhost.hash |    2 ++
 package/x11r7/xapp_xhost/xapp_xhost.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xhost/xapp_xhost.hash

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.hash b/package/x11r7/xapp_xhost/xapp_xhost.hash
new file mode 100644
index 0000000..b714eb6
--- /dev/null
+++ b/package/x11r7/xapp_xhost/xapp_xhost.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002576.html
+sha256	93e619ee15471f576cfb30c663e18f5bc70aca577a63d2c2c03f006a7837c29a	xhost-1.0.7.tar.bz2
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index d103133..a4bb16b 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.6
+XAPP_XHOST_VERSION = 1.0.7
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_LICENSE = MIT
-- 
1.7.10.4
