From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 07:28:39 +0200
Subject: [Buildroot] [PATCH 10/11] package/x11r7/xlib_libXv: security bump
	to 1.0.11
In-Reply-To: <20161006052840.12339-1-bernd.kuhls@t-online.de>
References: <20161006052840.12339-1-bernd.kuhls@t-online.de>
Message-ID: <20161006052840.12339-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXv/xlib_libXv.hash | 4 ++--
 package/x11r7/xlib_libXv/xlib_libXv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
index 3a54cb3..4cb26ea 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.hash
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-September/056012.html
-sha256	55fe92f8686ce8612e2c1bfaf58c057715534419da700bda8d517b1d97914525	libXv-1.0.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002727.html
+sha256 d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088  libXv-1.0.11.tar.bz2
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index ef5c746..26f8bad 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.10
+XLIB_LIBXV_VERSION = 1.0.11
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_LICENSE = MIT
-- 
2.9.3
