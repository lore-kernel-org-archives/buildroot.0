From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:37 +0200
Subject: [Buildroot] [PATCH 03/10] package/x11r7/xlib_libfontenc: bump
	version to 1.1.3
In-Reply-To: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430554664-19320-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.hash |    4 ++--
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
index c8b91b9..251a1d6 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-April/055627.html
-sha256	a9a4efed3359b2e80161bb66b65038fac145137fa134e71335264cbc23b02f62	libfontenc-1.1.2.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002589.html
+sha256	70588930e6fc9542ff38e0884778fbc6e6febf21adbab92fd8f524fe60aefd21	libfontenc-1.1.3.tar.bz2
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index fd7a6fb..aff1f1a 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.1.2
+XLIB_LIBFONTENC_VERSION = 1.1.3
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
-- 
1.7.10.4
