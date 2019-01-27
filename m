From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:44:40 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcursorgen: bump
 version to 1.0.7
Message-ID: <20190127095108.7108383BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b29faab1ed986a7724be658a25205624dff6ab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash | 9 +++++++--
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
index b98d449c1f..51031d62bc 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2014-May/002438.html
-sha256	31c8910f54eb175a8a74a60e7662697467e21a8bf948220a6048a93924b3f66c	xcursorgen-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-January/002936.html
+md5 25cc7ca1ce5dcbb61c2b471c55e686b5  xcursorgen-1.0.7.tar.bz2
+sha1 109367eb23b0ad52cf5de15f50c02ebe872698ae  xcursorgen-1.0.7.tar.bz2
+sha256 35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d  xcursorgen-1.0.7.tar.bz2
+sha512 bd13ad23691d3daa2d5dcdc5902cf62e3dcb97a0289aff362e6cd85866a1d8cafb64f98800a75bfb4cf1f3c76244ca20201847dff594543d136d0abaec7011d2  xcursorgen-1.0.7.tar.bz2
+# Locally computed
+sha256 8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 4bee26b5dc..bcc696b01c 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.6
+XAPP_XCURSORGEN_VERSION = 1.0.7
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
 XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
