From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 16:36:23 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: bump version to
	1.6.5
Message-ID: <20170305154307.E51B382298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8972d9dd6be9231bab9dd233e431436353537335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE according to URL mentioned in upstream release note.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 4 ++--
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index aeb0e9d..b1a87b1 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002721.html
-sha256 b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441  libX11-1.6.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-February/002777.html
+sha256 4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d  libX11-1.6.5.tar.bz2
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 80e89b4..fe1a7c3 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.4
+XLIB_LIBX11_VERSION = 1.6.5
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
-XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
 XLIB_LIBX11_LICENSE_FILES = COPYING
 XLIB_LIBX11_INSTALL_STAGING = YES
