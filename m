From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:19 +0100
Subject: [Buildroot] [PATCH 10/14] package/x11r7/xlib_libXvMC: bump version
	to 1.0.9, add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash |    3 +++
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
new file mode 100644
index 0000000..f0fcd2d
--- /dev/null
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002548.html
+sha1	6fc54831734e781b2848b6f7e3bcc4f752665f21				libXvMC-1.0.9.tar.bz2
+sha256	0703d7dff6ffc184f1735ca5d4eb9dbb402b522e08e008f2f96aee16c40a5756	libXvMC-1.0.9.tar.bz2
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index cc6b130..101c15d 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.7
+XLIB_LIBXVMC_VERSION = 1.0.9
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
-- 
1.7.10.4
