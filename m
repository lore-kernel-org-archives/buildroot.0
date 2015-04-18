From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:32 +0200
Subject: [Buildroot] [PATCH 04/61] package/x11r7/xapp_xf86dga: bump version
	to 1.0.3, add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xf86dga/xapp_xf86dga.hash |    2 ++
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xf86dga/xapp_xf86dga.hash

diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash b/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
new file mode 100644
index 0000000..b0c803e
--- /dev/null
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2010-October/001515.html
+sha1	030659e3728f5f7142e1cf727f147aceeabe4b9e	xf86dga-1.0.3.tar.bz2
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index 07b6ac9..a2e08da 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XF86DGA_VERSION = 1.0.2
+XAPP_XF86DGA_VERSION = 1.0.3
 XAPP_XF86DGA_SOURCE = xf86dga-$(XAPP_XF86DGA_VERSION).tar.bz2
 XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XF86DGA_LICENSE = MIT
-- 
1.7.10.4
