From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:50 +0100
Subject: [Buildroot] [PATCH 16/16] package/xutil_util-macros: bump version
	to 1.19.1
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xutil_util-macros/xutil_util-macros.hash | 4 ++--
 package/xutil_util-macros/xutil_util-macros.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
index bcb6c585d..0f0509a13 100644
--- a/package/xutil_util-macros/xutil_util-macros.hash
+++ b/package/xutil_util-macros/xutil_util-macros.hash
@@ -1,2 +1,2 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2141
-sha256	2835b11829ee634e19fa56517b4cfc52ef39acea0cd82e15f68096e27cbed0ba	util-macros-1.19.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002773.html
+sha256 18d459400558f4ea99527bc9786c033965a3db45bf4c6a32eefdc07aa9e306a6  util-macros-1.19.1.tar.bz2
diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index 1451a0698..d01b3e0d2 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.19.0
+XUTIL_UTIL_MACROS_VERSION = 1.19.1
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_LICENSE = MIT
-- 
2.11.0
