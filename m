From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:11 +0100
Subject: [Buildroot] [PATCH 02/14] package/x11r7/xlib_libX11: bump version
	to 1.6.3, add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash |    3 +++
 package/x11r7/xlib_libX11/xlib_libX11.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xlib_libX11/xlib_libX11.hash

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
new file mode 100644
index 0000000..acae656
--- /dev/null
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002543.html
+sha1	6f2aadf8346ee00b7419bd338461c6986e274733				libX11-1.6.3.tar.bz2
+sha256	cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111	libX11-1.6.3.tar.bz2
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index d134fa5..fc19aa1 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.2
+XLIB_LIBX11_VERSION = 1.6.3
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
1.7.10.4
