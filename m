From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 15:21:15 +0200
Subject: [Buildroot] [PATCH 1/1] libdvdcss: bump to version 1.4.2
Message-ID: <20180429132115.5491-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdvdcss/libdvdcss.hash | 7 +++++--
 package/libdvdcss/libdvdcss.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libdvdcss/libdvdcss.hash b/package/libdvdcss/libdvdcss.hash
index 57abd77a29..1e1b03ed20 100644
--- a/package/libdvdcss/libdvdcss.hash
+++ b/package/libdvdcss/libdvdcss.hash
@@ -1,2 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.0/libdvdcss-1.4.0.tar.bz2.sha256
-sha256	2089375984800df29a4817b37f3123c1706723342d6dab4d0a8b75c25c2c845a	libdvdcss-1.4.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.2/libdvdcss-1.4.2.tar.bz2.sha256
+sha256	78c2ed77ec9c0d8fbed7bf7d3abc82068b8864be494cfad165821377ff3f2575	libdvdcss-1.4.2.tar.bz2
+
+# Hash for license file:
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/libdvdcss/libdvdcss.mk b/package/libdvdcss/libdvdcss.mk
index e5ba3af20b..0593d556e1 100644
--- a/package/libdvdcss/libdvdcss.mk
+++ b/package/libdvdcss/libdvdcss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDCSS_VERSION = 1.4.0
+LIBDVDCSS_VERSION = 1.4.2
 LIBDVDCSS_SOURCE = libdvdcss-$(LIBDVDCSS_VERSION).tar.bz2
 LIBDVDCSS_SITE = http://www.videolan.org/pub/videolan/libdvdcss/$(LIBDVDCSS_VERSION)
 LIBDVDCSS_INSTALL_STAGING = YES
-- 
2.14.1
