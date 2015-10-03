From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Oct 2015 23:19:56 +0200
Subject: [Buildroot] [PATCH 2/4] package/x11r7/xlib_libXi: bump version to
	1.7.5
In-Reply-To: <1443907198-6833-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443907198-6833-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1443907198-6833-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 4 ++--
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index 75497f7..67b7b33 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2014-July/056751.html
-sha256	2cffc2686618dc1803725636cd92b36342c512dc60a7a35cba34bf7192a42244	libXi-1.7.4.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-September/002634.html
+sha256	d964d7deb5d8f7d6b9c358969c625073d7ab273dbda94693130b3540bc0ca229	libXi-1.7.5.tar.bz2
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index faa791b..391247f 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.7.4
+XLIB_LIBXI_VERSION = 1.7.5
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
-- 
2.5.3
