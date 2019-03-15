From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:56 +0100
Subject: [Buildroot] [PATCH 30/31] package/x11r7/xlib_libfontenc: bump
 version to 1.1.4
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-30-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.hash | 9 +++++++--
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
index 251a1d686f..de05fd27dd 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002589.html
-sha256	70588930e6fc9542ff38e0884778fbc6e6febf21adbab92fd8f524fe60aefd21	libfontenc-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002956.html
+md5 6447db6a689fb530c218f0f8328c3abc  libfontenc-1.1.4.tar.bz2
+sha1 d4f232b0b07487b984e13422ce4130b61a8b9edb  libfontenc-1.1.4.tar.bz2
+sha256 2cfcce810ddd48f2e5dc658d28c1808e86dcf303eaff16728b9aa3dbc0092079  libfontenc-1.1.4.tar.bz2
+sha512 76fa851d00113241f15fdd5b5bb7e927b8d8b9a82ce3fcb0678b8c7e32cb5e8d898c4bda1d60dafb7748145049d3240627ac34a2360c64e98a7a912ea7c30582  libfontenc-1.1.4.tar.bz2
+# Locally computed
+sha256 a4dda7a643b517794bfa23dc9605da030055df38ac8a5b9e1905e690975a59c4  COPYING
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index cb84ae4ee1..a55b90d680 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.1.3
+XLIB_LIBFONTENC_VERSION = 1.1.4
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
-- 
2.20.1
