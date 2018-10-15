From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Oct 2018 18:47:31 +0200
Subject: [Buildroot] [PATCH 2/4] package/x11r7/xlib_libX11: bump version to
 1.6.7
In-Reply-To: <20181015164734.16624-1-bernd.kuhls@t-online.de>
References: <20181015164734.16624-1-bernd.kuhls@t-online.de>
Message-ID: <20181015164734.16624-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 10 +++++-----
 package/x11r7/xlib_libX11/xlib_libX11.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 4dc934177a..5dac4f1149 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-August/002916.html
-md5 6b0f83e851b3b469dd660f3a95ac3e42  libX11-1.6.6.tar.bz2
-sha1 b29cf4362b58188cb27fed2294788004af7428a9  libX11-1.6.6.tar.bz2
-sha256 65fe181d40ec77f45417710c6a67431814ab252d21c2e85c75dd1ed568af414f  libX11-1.6.6.tar.bz2
-sha512 9866dc6b158b15a96efe140b6fa68a775889a37e5565a126216211fee63868e02629a9f9f41816d590ef150560f43b8864010a77a6318c9109e76aec1d21b4d7  libX11-1.6.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-October/002921.html
+md5 034fdd6cc5393974d88aec6f5bc96162  libX11-1.6.7.tar.bz2
+sha1 5076f7853713d7db958a05f6fd1c18f7e111a0ad  libX11-1.6.7.tar.bz2
+sha256 910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348  libX11-1.6.7.tar.bz2
+sha512 edd2273b9dadbbf90ad8d7b5715db29eb120a5a22ad2595f697e56532cc24b84e358580c00548fa6be8e9d26601a2b2cdab32272c59266709534317abbd05cd5  libX11-1.6.7.tar.bz2
 # Locally computed
 sha256 2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 9eafd47e7b..87929c42ed 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.6
+XLIB_LIBX11_VERSION = 1.6.7
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.19.1
