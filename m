From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Jun 2021 09:51:03 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/libdvdcss: bump version to
 1.4.3
In-Reply-To: <20210606075103.699369-1-bernd.kuhls@t-online.de>
References: <20210606075103.699369-1-bernd.kuhls@t-online.de>
Message-ID: <20210606075103.699369-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://code.videolan.org/videolan/libdvdcss/-/blob/master/NEWS

Added sha1 hash, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdcss/libdvdcss.hash | 8 +++++---
 package/libdvdcss/libdvdcss.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libdvdcss/libdvdcss.hash b/package/libdvdcss/libdvdcss.hash
index 1e1b03ed20..4d20f19efc 100644
--- a/package/libdvdcss/libdvdcss.hash
+++ b/package/libdvdcss/libdvdcss.hash
@@ -1,5 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.2/libdvdcss-1.4.2.tar.bz2.sha256
-sha256	78c2ed77ec9c0d8fbed7bf7d3abc82068b8864be494cfad165821377ff3f2575	libdvdcss-1.4.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.3/libdvdcss-1.4.3.tar.bz2.sha1
+sha1  fcea8b2749ead8183636e48300bea8791abc79ee  libdvdcss-1.4.3.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.3/libdvdcss-1.4.3.tar.bz2.sha256
+sha256  233cc92f5dc01c5d3a96f5b3582be7d5cee5a35a52d3a08158745d3d86070079  libdvdcss-1.4.3.tar.bz2
 
 # Hash for license file:
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libdvdcss/libdvdcss.mk b/package/libdvdcss/libdvdcss.mk
index 0593d556e1..f4d721771f 100644
--- a/package/libdvdcss/libdvdcss.mk
+++ b/package/libdvdcss/libdvdcss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDCSS_VERSION = 1.4.2
+LIBDVDCSS_VERSION = 1.4.3
 LIBDVDCSS_SOURCE = libdvdcss-$(LIBDVDCSS_VERSION).tar.bz2
 LIBDVDCSS_SITE = http://www.videolan.org/pub/videolan/libdvdcss/$(LIBDVDCSS_VERSION)
 LIBDVDCSS_INSTALL_STAGING = YES
-- 
2.29.2
