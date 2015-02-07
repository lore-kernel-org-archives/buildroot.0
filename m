From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:14 +0100
Subject: [Buildroot] [PATCH 01/35] package/x11r7/xlib_xtrans: bump to
	version 1.3.5, add hash
Message-ID: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xserver_xorg-server 1.17.0 depends on it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.hash |    3 +++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xlib_xtrans/xlib_xtrans.hash

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.hash b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
new file mode 100644
index 0000000..26c69a0
--- /dev/null
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2014-September/002481.html
+sha1	2d3ae1839d841f568bc481c6116af7d2a9f9ba59				xtrans-1.3.5.tar.bz2
+sha256	adbd3b36932ce4c062cd10f57d78a156ba98d618bdb6f50664da327502bc8301	xtrans-1.3.5.tar.bz2
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index bc84dfb..40f613c 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.3.4
+XLIB_XTRANS_VERSION = 1.3.5
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_LICENSE = MIT
-- 
1.7.10.4
