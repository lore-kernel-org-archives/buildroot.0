From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 10:24:38 +0100
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_xtrans:
	bump to version 1.3.5, add hash
Message-ID: <20150214143822.E1E7E8042B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b81dea67f8ca3c4b35c970ef2a09e035d3cb49a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

xserver_xorg-server 1.17.0 depends on it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.hash |    3 +++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
