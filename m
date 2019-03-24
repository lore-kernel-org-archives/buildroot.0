From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Mar 2019 21:14:35 +0100
Subject: [Buildroot] [PATCH 05/12] package/x11r7/xlib_libXft: bump version
 to 2.3.3
In-Reply-To: <20190324201443.21347-1-bernd.kuhls@t-online.de>
References: <20190324201443.21347-1-bernd.kuhls@t-online.de>
Message-ID: <20190324201443.21347-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXft/xlib_libXft.hash | 9 +++++++--
 package/x11r7/xlib_libXft/xlib_libXft.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.hash b/package/x11r7/xlib_libXft/xlib_libXft.hash
index 6eacf06ef1..bd0838b4dd 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.hash
+++ b/package/x11r7/xlib_libXft/xlib_libXft.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2014-June/056668.html
-sha256	f5a3c824761df351ca91827ac221090943ef28b248573486050de89f4bfcdc4c	libXft-2.3.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002976.html
+md5 4a433c24627b4ff60a4dd403a0990796  libXft-2.3.3.tar.bz2
+sha1 48f543fe495f545df1794fa36a0a708558ae298c  libXft-2.3.3.tar.bz2
+sha256 225c68e616dd29dbb27809e45e9eadf18e4d74c50be43020ef20015274529216  libXft-2.3.3.tar.bz2
+sha512 28fdaf3baa3b156a4a7fdd6e39c4d8026d7d21eaa9be27c9797c8d329dab691a1bc82ea6042f9d4729a9343d93787536fb7e4b606f722f33cbe608b2e79910e8  libXft-2.3.3.tar.bz2
+# Locally computed
+sha256 7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 9c5757e657..489cfe4c56 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.2
+XLIB_LIBXFT_VERSION = 2.3.3
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
 XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
-- 
2.20.1
