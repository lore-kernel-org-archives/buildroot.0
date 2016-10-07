From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:23:36 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXrandr: security
	bump to 1.5.1
Message-ID: <20161007132630.E560E822F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5136df0116d31d03294eb66dbcd2afa58b60e78d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash | 4 ++--
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index e4b86a0..84a50cb 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002606.html
-sha256	6f864959b7fc35db11754b270d71106ef5b5cf363426aa58589cb8ac8266de58	libXrandr-1.5.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002724.html
+sha256 1ff9e7fa0e4adea912b16a5f0cfa7c1d35b0dcda0e216831f7715c8a3abcf51a  libXrandr-1.5.1.tar.bz2
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 5abd8b1..0fd298c 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.5.0
+XLIB_LIBXRANDR_VERSION = 1.5.1
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
