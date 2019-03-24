From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:08:20 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXxf86dga: bump
 version to 1.1.5
Message-ID: <20190324220643.CEB26802F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=417a609222f566cb5ee6a357b842da95dcf774a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash | 9 +++++++--
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
index 29560b7e8d..f0172c346c 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002235.html
-sha256	8eecd4b6c1df9a3704c04733c2f4fa93ef469b55028af5510b25818e2456c77e	libXxf86dga-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002982.html
+md5 0ddeafc13b33086357cfa96fae41ee8e  libXxf86dga-1.1.5.tar.bz2
+sha1 332ba80d1b3d06473f7bbfe1612e7c5b58fbdf69  libXxf86dga-1.1.5.tar.bz2
+sha256 2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203  libXxf86dga-1.1.5.tar.bz2
+sha512 0e77c4003aeba737b10c17d55aeefa935fc57c4ba9e8f79a834f3f8c690d6a1d98f69ad707eded784346c1cf40c41829719d257283b5eae3207147fb4c79ed89  libXxf86dga-1.1.5.tar.bz2
+# Locally computed
+sha256 dd27933ebc5c063128b158b085e4c442a36b0e6f704cf753116da119610191da  COPYING
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 59ebd2b413..62fe06c1a5 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86DGA_VERSION = 1.1.4
+XLIB_LIBXXF86DGA_VERSION = 1.1.5
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_LICENSE = MIT
