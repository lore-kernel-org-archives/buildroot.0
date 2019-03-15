From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXcursor: bump
 version to 1.2.0
Message-ID: <20190315203120.9F43B83480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef184d51d8df8e1308c2a3d25c0a7550c5e60de3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.hash | 12 +++++++-----
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
index 7da9eb8c4f..3a12253d40 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
@@ -1,5 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-November/002823.html
-md5  58fe3514e1e7135cf364101e714d1a14  libXcursor-1.1.15.tar.bz2
-sha1 3e19f991f244b7fa31566adce7ead078424296cf  libXcursor-1.1.15.tar.bz2
-sha256 294e670dd37cd23995e69aae626629d4a2dfe5708851bbc13d032401b7a3df6b  libXcursor-1.1.15.tar.bz2
-sha512 53ad0fa2afd7b4cf1108b560e44ea71abdf5c55a18df243d7123942513589c927f5c105395f790d8769959e0129db54264e6aac7efd51a5f1aec270379b1f2f5  libXcursor-1.1.15.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002972.html
+md5 9b9be0e289130fb820aedf67705fc549  libXcursor-1.2.0.tar.bz2
+sha1 cca0b34955d3c2f657f05a2a2c40f75353ddd912  libXcursor-1.2.0.tar.bz2
+sha256 3ad3e9f8251094af6fe8cb4afcf63e28df504d46bfa5a5529db74a505d628782  libXcursor-1.2.0.tar.bz2
+sha512 2b12d0fd17e311ce269dbba58588698885815eb07aa44d48525ed5cd9e5f379bb90138a792a191e2f74888ab10b3ca9a4f507f21de0984ed79748973ab927a03  libXcursor-1.2.0.tar.bz2
+# Locally computed
+sha256 1f1588aff23eec0cb6bb9cfe02f8a75abbe43faf3d9b1eff54b7fbc42774b3ad  COPYING
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 6ee76039e0..9bbd460c9d 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.1.15
+XLIB_LIBXCURSOR_VERSION = 1.2.0
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
