From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:38 +0200
Subject: [Buildroot] [PATCH 26/32] package/x11r7/xapp_xmh: bump version to
	1.0.3, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-26-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xmh/xapp_xmh.hash |    2 ++
 package/x11r7/xapp_xmh/xapp_xmh.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xmh/xapp_xmh.hash

diff --git a/package/x11r7/xapp_xmh/xapp_xmh.hash b/package/x11r7/xapp_xmh/xapp_xmh.hash
new file mode 100644
index 0000000..0358b3d
--- /dev/null
+++ b/package/x11r7/xapp_xmh/xapp_xmh.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002582.html
+sha256	b92f4f912a5fb6346d52cc2b639aea087b347f3b2e4e1a4fc7a165b1345f5689	xmh-1.0.3.tar.bz2
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index ada1df5..c18bbfe 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMH_VERSION = 1.0.2
+XAPP_XMH_VERSION = 1.0.3
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMH_LICENSE = MIT
-- 
1.7.10.4
