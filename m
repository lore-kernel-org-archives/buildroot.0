From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:33 -0000
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libfontenc:
	bump version to 1.1.3
Message-ID: <20150808105629.A2B277FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1aa1d38c6a37d0db045cf2fa5a3dd1fdd6dfc739
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
