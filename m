From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 18 May 2021 17:26:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: security bump
 version to 1.7.1
Message-ID: <20210518152600.101632-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2021-31535:
https://lists.x.org/archives/xorg-announce/2021-May/003088.html

Release notes:
https://lists.x.org/archives/xorg-announce/2021-May/003089.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 5b1162f4c5..b87b2498e8 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-November/003065.html
-sha256  36c8f93b6595437c8cfbc9f08618bcb3041cbd303e140a0013f88e4c2977cb54  libX11-1.7.0.tar.bz2
-sha512  f661ca90350fd8a94f054b00f12f5122cea068ebff706acfd399462236c189a296a2358d17d16166635101cf56cc19303dd407873a159932d093c9f33556f9fb  libX11-1.7.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-May/003089.html
+sha256  e64e43deaa562cbfb0d5ada64670ec09c6fac7935262dcd77bbc6d984a535d47  libX11-1.7.1.tar.bz2
+sha512  a76f0a82fce6f9b50646a7cd7ec5ee046650f225816050226068a7548fa083ef07d146d40faaf44e033c59c17b0fda5ffdee3a127dac3ab56cee02133819aa3d  libX11-1.7.1.tar.bz2
 
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 8fefbc492a..39d9dc2cc7 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.7.0
+XLIB_LIBX11_VERSION = 1.7.1
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.29.2
