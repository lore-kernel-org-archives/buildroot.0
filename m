From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:40:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xf86dga: bump version
	to 1.0.3, add hash
Message-ID: <20150418170659.4C1C17F922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0687ccac6c0264c75b1a3b02c68847f9f3e59284
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xf86dga/xapp_xf86dga.hash |    2 ++
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
