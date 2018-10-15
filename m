From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Oct 2018 18:47:32 +0200
Subject: [Buildroot] [PATCH 3/4] package/x11r7/xlib_libSM: bump version to
 1.2.3
In-Reply-To: <20181015164734.16624-1-bernd.kuhls@t-online.de>
References: <20181015164734.16624-1-bernd.kuhls@t-online.de>
Message-ID: <20181015164734.16624-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libSM/xlib_libSM.hash | 9 +++++++--
 package/x11r7/xlib_libSM/xlib_libSM.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.hash b/package/x11r7/xlib_libSM/xlib_libSM.hash
index 79dc25c226..1653dc6d76 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.hash
+++ b/package/x11r7/xlib_libSM/xlib_libSM.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-September/056013.html
-sha256	0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd	libSM-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-October/002922.html
+md5  87c7fad1c1813517979184c8ccd76628  libSM-1.2.3.tar.bz2
+sha1 437d7b13fa2eba325df3a106f177df46ccec6546  libSM-1.2.3.tar.bz2
+sha256 2d264499dcb05f56438dee12a1b4b71d76736ce7ba7aa6efbf15ebb113769cbb  libSM-1.2.3.tar.bz2
+sha512 74c42e27029db78475e62025b4711dbac5e22d2f8e8a24be98a1c31b03c0fc4afe859928f851800ea0b76854f12147900dc4f27bbfd3d8ea45daaaf24b70a903  libSM-1.2.3.tar.bz2
+# Locally computed
+sha256 af7926a14d85ad367622688636e8c9c6f7807c8a6867536af1c530b5c262bfba  COPYING
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 9049cea234..708224e2d1 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBSM_VERSION = 1.2.2
+XLIB_LIBSM_VERSION = 1.2.3
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
 XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBSM_LICENSE = MIT
-- 
2.19.1
