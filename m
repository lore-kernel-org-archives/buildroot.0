From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:55:40 +0100
Subject: [Buildroot] [git commit branch/2017.02.x]
 package/x11r7/xlib_libXcursor: security bump to version 1.1.15
Message-ID: <20171220210024.D600E835DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9747311204aca19998b6c13a97892ee4b5681d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-16612:
https://lists.x.org/archives/xorg-announce/2017-November/002823.html

Added all hashed provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f781add88fedf86f2ea2fad5eabb6a8c72752c7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.hash | 7 +++++--
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
index 0135ac9..7da9eb8 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002229.html
-sha256	9bc6acb21ca14da51bda5bc912c8955bc6e5e433f0ab00c5e8bef842596c33df	libXcursor-1.1.14.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-November/002823.html
+md5  58fe3514e1e7135cf364101e714d1a14  libXcursor-1.1.15.tar.bz2
+sha1 3e19f991f244b7fa31566adce7ead078424296cf  libXcursor-1.1.15.tar.bz2
+sha256 294e670dd37cd23995e69aae626629d4a2dfe5708851bbc13d032401b7a3df6b  libXcursor-1.1.15.tar.bz2
+sha512 53ad0fa2afd7b4cf1108b560e44ea71abdf5c55a18df243d7123942513589c927f5c105395f790d8769959e0129db54264e6aac7efd51a5f1aec270379b1f2f5  libXcursor-1.1.15.tar.bz2
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index c59c01a..b27aa65 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.1.14
+XLIB_LIBXCURSOR_VERSION = 1.1.15
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
