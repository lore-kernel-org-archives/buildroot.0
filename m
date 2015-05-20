From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 May 2015 10:26:36 +0200
Subject: [Buildroot] [PATCH/next 5/7] package/x11r7/xlib_libXrandr: bump
	version to 1.5.0
In-Reply-To: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1432110398-22791-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash |    4 ++--
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index 1f2ce3e..e4b86a0 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-September/056011.html
-sha256	caa7b31ac769be51a532343c65376f1d4df3f307afaed58e34fb5e82e8b825ad	libXrandr-1.4.2.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-May/002606.html
+sha256	6f864959b7fc35db11754b270d71106ef5b5cf363426aa58589cb8ac8266de58	libXrandr-1.5.0.tar.bz2
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 25c77fe..5abd8b1 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.4.2
+XLIB_LIBXRANDR_VERSION = 1.5.0
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
-- 
1.7.10.4
