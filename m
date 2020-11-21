From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 12:21:31 +0100
Subject: [Buildroot] [PATCH/next 6/6] package/x11r7/xlib_libX11: bump
 version to 1.7.0
In-Reply-To: <20201121112131.756930-1-bernd.kuhls@t-online.de>
References: <20201121112131.756930-1-bernd.kuhls@t-online.de>
Message-ID: <20201121112131.756930-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 142e4505d0..5b1162f4c5 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-August/003057.html
-sha256  f108227469419ac04d196df0f3b80ce1f7f65059bb54c0de811f4d8e03fd6ec7  libX11-1.6.12.tar.bz2
-sha512  79df7d61d9009b0dd3b65f67a62189aa0a43799c01026b3d2d534092596a0b67f246af5e398a89eb1ccc61a27335f81be8262b8a39768a76f62d862cd7415a47  libX11-1.6.12.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-November/003065.html
+sha256  36c8f93b6595437c8cfbc9f08618bcb3041cbd303e140a0013f88e4c2977cb54  libX11-1.7.0.tar.bz2
+sha512  f661ca90350fd8a94f054b00f12f5122cea068ebff706acfd399462236c189a296a2358d17d16166635101cf56cc19303dd407873a159932d093c9f33556f9fb  libX11-1.7.0.tar.bz2
 
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index ba9fcef258..f36b5e6ffa 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.12
+XLIB_LIBX11_VERSION = 1.7.0
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.27.0
