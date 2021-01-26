From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2021 21:04:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/xutil_util-macros: bump version to
 1.19.3
Message-ID: <20210126200451.285459-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xutil_util-macros/xutil_util-macros.hash | 8 +++-----
 package/xutil_util-macros/xutil_util-macros.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
index 49c057fd21..3f28743e64 100644
--- a/package/xutil_util-macros/xutil_util-macros.hash
+++ b/package/xutil_util-macros/xutil_util-macros.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002845.html
-md5 58edef899364f78fbde9479ded20211e  util-macros-1.19.2.tar.bz2
-sha1 e8b3a6f2bfde22440fca0974da53da18821a4ee6  util-macros-1.19.2.tar.bz2
-sha256 d7e43376ad220411499a79735020f9d145fdc159284867e99467e0d771f3e712  util-macros-1.19.2.tar.bz2
-sha512 3f51504b27f0478c136126f15110cf3cdbba218c4d74a8e974cca1381c6e8364609bd0c444f2fb19aa86a7f4e848dfce4f4da940463b224036f75a60b3d88619  util-macros-1.19.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-January/003069.html
+sha256  0f812e6e9d2786ba8f54b960ee563c0663ddbe2434bf24ff193f5feab1f31971  util-macros-1.19.3.tar.bz2
+sha512  b9c7398a912c688a782eab5b1e0f6da2df11a430775c5c98fc3269f73a665de6eeb60d300a849e38d345714a6e51f74e9334cb6039767304cca4b93d823a53a2  util-macros-1.19.3.tar.bz2
 # Locally computed
 sha256 489b630a75e3255485732eae3d50ff4d29d3feb66760bb3acb04f897e4d9e375  COPYING
diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index 6f66c76692..b0ce14ee5a 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.19.2
+XUTIL_UTIL_MACROS_VERSION = 1.19.3
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_LICENSE = MIT
-- 
2.29.2
