From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 18 Mar 2015 20:16:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont: security
	version bump to 1.5.1
Message-ID: <1426706172-11127-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-1802, CVE-2015-1803, CVE-2015-1804
http://lists.x.org/archives/xorg-announce/2015-March/002551.html
http://lists.x.org/archives/xorg-announce/2015-March/002550.html

Also add hash file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.hash |    2 ++
 package/x11r7/xlib_libXfont/xlib_libXfont.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xlib_libXfont/xlib_libXfont.hash

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.hash b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
new file mode 100644
index 0000000..9543637
--- /dev/null
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002551.html
+sha256	b70898527c73f9758f551bbab612af611b8a0962202829568d94f3edf4d86098	libXfont-1.5.1.tar.bz2
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 7686550..5b6de1f 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.5.0
+XLIB_LIBXFONT_VERSION = 1.5.1
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_LICENSE = MIT
-- 
1.7.10.4
