From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 16 Jul 2019 22:09:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xapp_xclock: bump version to
 1.0.9
Message-ID: <20190716200952.26909-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xclock/xapp_xclock.hash | 10 +++++-----
 package/x11r7/xapp_xclock/xapp_xclock.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xclock/xapp_xclock.hash b/package/x11r7/xapp_xclock/xapp_xclock.hash
index a0712e9a1a..881b40154d 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.hash
+++ b/package/x11r7/xapp_xclock/xapp_xclock.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002947.html
-md5 8bd39eb3678ed58a2350794fe13401cc  xclock-1.0.8.tar.bz2
-sha1 980df6958286450cfc1fe6daa7ff912885d728ba  xclock-1.0.8.tar.bz2
-sha256 930820483a36f1f1ce1bf52b648865629a16082641e12c5cf2b5045815fc2255  xclock-1.0.8.tar.bz2
-sha512 1272221ace3657505bae1b22f181e9ecbf1710900c89a860c8ceae47ae31ca5e75b6557c37dc0a881a0a24c9597b9a07f46200926feb1013f1e2e995111a7646  xclock-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003010.html
+md5 437522a96f424f68fc64ed34ece9b211  xclock-1.0.9.tar.bz2
+sha1 774c711cf7ee3f601f7209bbb01ce3f0d5ddbde6  xclock-1.0.9.tar.bz2
+sha256 cf461fb2c6f2ac42c54d8429ee2010fdb9a1442a370adfbfe8a7bfaf33c123bb  xclock-1.0.9.tar.bz2
+sha512 fcbac0b4ab1cea4ae0751ce1c0c6302048e5d98d459873c7580e4ca786ec49fa27f73e5831bdfe135abb5cfeabe886456276e9d01351ea7905c606f40f84522d  xclock-1.0.9.tar.bz2
 # Locally computed
 sha256 ee1f19f46801ef00e70498603e74df644d0b93fc82f06b55ce64c3a2c9f16e71  COPYING
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index b0f74682e0..77cc7011d3 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCLOCK_VERSION = 1.0.8
+XAPP_XCLOCK_VERSION = 1.0.9
 XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
-XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLOCK_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCLOCK_LICENSE = MIT
 XAPP_XCLOCK_LICENSE_FILES = COPYING
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
-- 
2.20.1
