From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Jul 2018 19:45:47 +0200
Subject: [Buildroot] [PATCH 5/7] package/x11r7/xlib_libXScrnSaver: bump
 version to 1.2.3
In-Reply-To: <20180709174549.10744-1-bernd.kuhls@t-online.de>
References: <20180709174549.10744-1-bernd.kuhls@t-online.de>
Message-ID: <20180709174549.10744-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash and all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash | 9 +++++++--
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
index d5340baf1e..266840114f 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2012-March/054015.html
-sha256	8ff1efa7341c7f34bcf9b17c89648d6325ddaae22e3904e091794e0b4426ce1d	libXScrnSaver-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-July/002906.html
+md5 eeea9d5af3e6c143d0ea1721d27a5e49  libXScrnSaver-1.2.3.tar.bz2
+sha1 70c791c5755a298ecf1a0823e239a24fa4b2b42f  libXScrnSaver-1.2.3.tar.bz2
+sha256 f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8  libXScrnSaver-1.2.3.tar.bz2
+sha512 7ea628324a11b25ee82c7b11c6bf98f37de219354de51c1e29467b5de422669ba1ab121f3b9dc674093c8f3960e93c5d5428122f5539092f79bc8451c768354a  libXScrnSaver-1.2.3.tar.bz2
+# Locally computed
+sha256 5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index f22ee983c0..4c3d36d007 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.2
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.3
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
 XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSCRNSAVER_LICENSE = MIT
-- 
2.18.0
