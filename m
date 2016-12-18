From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 14:04:20 +0100
Subject: [Buildroot] [PATCH 4/4] package/x11r7/xlib_libXpm: bump version to
	3.5.12
In-Reply-To: <20161218130420.3920-1-bernd.kuhls@t-online.de>
References: <20161218130420.3920-1-bernd.kuhls@t-online.de>
Message-ID: <20161218130420.3920-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 4 ++--
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index 22c9fc62f..d94a90268 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-September/056010.html
-sha256	c5bdafa51d1ae30086fac01ab83be8d47fe117b238d3437f8e965434090e041c	libXpm-3.5.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-December/002752.html
+sha256 fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec  libXpm-3.5.12.tar.bz2
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 997ef958e..c8c549651 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.11
+XLIB_LIBXPM_VERSION = 3.5.12
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
-- 
2.11.0
