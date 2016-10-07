From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:23:33 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: security bump
	to 1.6.4
Message-ID: <20161007132630.C0D6C81810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=274ac0116bca258a009442db3197ef76f66cc13f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
