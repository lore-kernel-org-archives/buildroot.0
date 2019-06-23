From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:52:35 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: bump version to
 1.6.8
Message-ID: <20190623105426.5E9EE8293F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a1ec659e8b0acee53de3862bfc222e4839dc125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 10 +++++-----
 package/x11r7/xlib_libX11/xlib_libX11.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 5dac4f1149..26f043d65e 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-October/002921.html
-md5 034fdd6cc5393974d88aec6f5bc96162  libX11-1.6.7.tar.bz2
-sha1 5076f7853713d7db958a05f6fd1c18f7e111a0ad  libX11-1.6.7.tar.bz2
-sha256 910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348  libX11-1.6.7.tar.bz2
-sha512 edd2273b9dadbbf90ad8d7b5715db29eb120a5a22ad2595f697e56532cc24b84e358580c00548fa6be8e9d26601a2b2cdab32272c59266709534317abbd05cd5  libX11-1.6.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-June/002997.html
+md5 c5fa5a86a20e3591bed6c046498d4b8f  libX11-1.6.8.tar.bz2
+sha1 f1ea96fe472a981d378b4f2eec90dcd063f9a407  libX11-1.6.8.tar.bz2
+sha256 b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5  libX11-1.6.8.tar.bz2
+sha512 1de8e0ec466308bc48946d1ce7a7dc6bd3120b1b365cd01afd1bd51dd7369e3d1870dd379b0b7c5b07699095d59761bd23e2e02ab60929de32c39b6885016e76  libX11-1.6.8.tar.bz2
 # Locally computed
 sha256 2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 87929c42ed..f0e52e0877 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.7
+XLIB_LIBX11_VERSION = 1.6.8
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
