From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 07:28:33 +0200
Subject: [Buildroot] [PATCH 04/11] package/x11r7/xlib_libX11: security bump
	to 1.6.4
In-Reply-To: <20161006052840.12339-1-bernd.kuhls@t-online.de>
References: <20161006052840.12339-1-bernd.kuhls@t-online.de>
Message-ID: <20161006052840.12339-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 5 ++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index acae656..aeb0e9d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,3 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002543.html
-sha1	6f2aadf8346ee00b7419bd338461c6986e274733				libX11-1.6.3.tar.bz2
-sha256	cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111	libX11-1.6.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002721.html
+sha256 b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441  libX11-1.6.4.tar.bz2
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 2595924..80e89b4 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.3
+XLIB_LIBX11_VERSION = 1.6.4
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.9.3
