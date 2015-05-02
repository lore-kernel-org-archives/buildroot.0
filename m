From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:41 +0200
Subject: [Buildroot] [PATCH 07/10] package/x11r7/xlib_libFS: bump version to
	1.0.7
In-Reply-To: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430554664-19320-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libFS/xlib_libFS.hash |    4 ++--
 package/x11r7/xlib_libFS/xlib_libFS.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
index 390aa0c..786d147 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.hash
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2014-March/056484.html
-sha256	9007fcfbd37bfa6ede4000ec4b5c2dc6dc0f52789358361b43f68e9ae4d6aed7	libFS-1.0.6.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002588.html
+sha256	2e9d4c07026a7401d4fa4ffae86e6ac7fec83f50f3268fa85f52718e479dc4f3	libFS-1.0.7.tar.bz2
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 18b3fd2..a3c58b9 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFS_VERSION = 1.0.6
+XLIB_LIBFS_VERSION = 1.0.7
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
 XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFS_LICENSE = MIT
-- 
1.7.10.4
