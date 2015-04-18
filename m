From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:28 +0200
Subject: [Buildroot] [PATCH 16/32] package/x11r7/xapp_xditview: bump version
	to 1.0.4, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xditview/xapp_xditview.hash |    2 ++
 package/x11r7/xapp_xditview/xapp_xditview.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xditview/xapp_xditview.hash

diff --git a/package/x11r7/xapp_xditview/xapp_xditview.hash b/package/x11r7/xapp_xditview/xapp_xditview.hash
new file mode 100644
index 0000000..c8c1a0c
--- /dev/null
+++ b/package/x11r7/xapp_xditview/xapp_xditview.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002570.html
+sha256	307f8df1bc3e90a7fba74dfe16840891c365abc027fbd556027eb057e5d1ff73	xditview-1.0.4.tar.bz2
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index e91b3d8..4744c1f 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDITVIEW_VERSION = 1.0.3
+XAPP_XDITVIEW_VERSION = 1.0.4
 XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
 XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDITVIEW_LICENSE = MIT
-- 
1.7.10.4
