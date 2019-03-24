From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:07:43 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXmu: bump version to
 1.1.3
Message-ID: <20190324220643.B9805838AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad0ad562a1cf5c4c0ea0c49fcdfaa15de0d14d93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXmu/xlib_libXmu.hash | 9 +++++++--
 package/x11r7/xlib_libXmu/xlib_libXmu.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.hash b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
index 2c96d960b4..8cad2389bc 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.hash
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-September/056009.html
-sha256	756edc7c383254eef8b4e1b733c3bf1dc061b523c9f9833ac7058378b8349d0b	libXmu-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002978.html
+md5 ac774cff8b493f566088a255dbf91201  libXmu-1.1.3.tar.bz2
+sha1 7ff54ce38379fb795aebed38f6be404ee0dfeec6  libXmu-1.1.3.tar.bz2
+sha256 9c343225e7c3dc0904f2122b562278da5fed639b1b5e880d25111561bac5b731  libXmu-1.1.3.tar.bz2
+sha512 8c6cc65b22aa031ad870dd92736681a068a0878a425a53dbed909943da1136c4a24034d467cfd3785c3a8d78f66850b69f1ebe1eb24aaf9bc176b1d171a5c762  libXmu-1.1.3.tar.bz2
+# Locally computed
+sha256 e65a4a8bbf8b0dfd2439d6bc6d86df03e2b8e693b757593b25149e099aeb8ec4  COPYING
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index b3f3db3e5d..3218e0ec39 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXMU_VERSION = 1.1.2
+XLIB_LIBXMU_VERSION = 1.1.3
 XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
 XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXMU_LICENSE = MIT
