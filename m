From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 08:46:49 +0100
Subject: [Buildroot] [git commit] package/xutil_util-macros: bump version to
 1.19.2
Message-ID: <20180310074850.5E79D800EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a14c3f03d5c7053a0a2167aac49e08a2a78e3ef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xutil_util-macros/xutil_util-macros.hash | 9 +++++++--
 package/xutil_util-macros/xutil_util-macros.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
index 0f0509a132..49c057fd21 100644
--- a/package/xutil_util-macros/xutil_util-macros.hash
+++ b/package/xutil_util-macros/xutil_util-macros.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002773.html
-sha256 18d459400558f4ea99527bc9786c033965a3db45bf4c6a32eefdc07aa9e306a6  util-macros-1.19.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002845.html
+md5 58edef899364f78fbde9479ded20211e  util-macros-1.19.2.tar.bz2
+sha1 e8b3a6f2bfde22440fca0974da53da18821a4ee6  util-macros-1.19.2.tar.bz2
+sha256 d7e43376ad220411499a79735020f9d145fdc159284867e99467e0d771f3e712  util-macros-1.19.2.tar.bz2
+sha512 3f51504b27f0478c136126f15110cf3cdbba218c4d74a8e974cca1381c6e8364609bd0c444f2fb19aa86a7f4e848dfce4f4da940463b224036f75a60b3d88619  util-macros-1.19.2.tar.bz2
+# Locally computed
+sha256 489b630a75e3255485732eae3d50ff4d29d3feb66760bb3acb04f897e4d9e375  COPYING
diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index d01b3e0d24..6f66c76692 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.19.1
+XUTIL_UTIL_MACROS_VERSION = 1.19.2
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_LICENSE = MIT
