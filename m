From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:52:18 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/x11r7/xlib_libX11: security bump version to 1.6.12
Message-ID: <20200828174515.4B09485278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f79d15293c235dd1d62b402cffd32cd175f253ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes CVE-2020-14363:
https://lists.x.org/archives/xorg-announce/2020-August/003056.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab0c98cac861197f2b8b56f5216c0f1312f6209b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index b77f98dfb1..142e4505d0 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-August/003053.html
-sha256  b1cc4b802058be7e3fb438ee2490f66fcc52ac3b2a14f47a22cbf77638e33606  libX11-1.6.11.tar.bz2
-sha512  2cb4e215c1e3ccb327e02586844f8c426068536a0f472a39f12191feace607f61a6a08586f03758248199678c2f6897a984b0f1222bc0d68fd2e02702f4ce0bf  libX11-1.6.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-August/003057.html
+sha256  f108227469419ac04d196df0f3b80ce1f7f65059bb54c0de811f4d8e03fd6ec7  libX11-1.6.12.tar.bz2
+sha512  79df7d61d9009b0dd3b65f67a62189aa0a43799c01026b3d2d534092596a0b67f246af5e398a89eb1ccc61a27335f81be8262b8a39768a76f62d862cd7415a47  libX11-1.6.12.tar.bz2
 
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index b0132efd31..ba9fcef258 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.11
+XLIB_LIBX11_VERSION = 1.6.12
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
