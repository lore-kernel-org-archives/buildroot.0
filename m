From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 21:18:05 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXaw: bump version to
 1.0.14
Message-ID: <20210409185753.376D282A14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad259f06cc6f2a3d38c4e00da20ddf85c7587f81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2021-March/003077.html

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.hash | 8 +++++---
 package/x11r7/xlib_libXaw/xlib_libXaw.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.hash b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
index 159e007bc3..f289e66153 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.hash
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
@@ -1,4 +1,6 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002591.html
-sha256	8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd	libXaw-1.0.13.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-March/003077.html
+sha256  76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e  libXaw-1.0.14.tar.bz2
+sha512  29d1c151369523ae6cb418e636b0b7b39ccccc35462a0b394dbeb46d5b6d780badd2eb872a55d9fbba1ee1af034e76c0463f40f8d8a7be2c336d08b3b1bf81d4  libXaw-1.0.14.tar.bz2
+
 # Locally calculated
-sha256 9f5adb26952f93b3e4650285b94ec6c61a27aab5a21088bfb6694001be1b360d COPYING
+sha256  9f5adb26952f93b3e4650285b94ec6c61a27aab5a21088bfb6694001be1b360d  COPYING
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 17d51a9570..6b615a8de5 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXAW_VERSION = 1.0.13
+XLIB_LIBXAW_VERSION = 1.0.14
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_LICENSE = MIT
