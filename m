From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:36:29 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXt: bump version to
 1.2.1
Message-ID: <20210129082033.2461981530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d637d3cf060a0048ed2cf3a69b10402a4bb6fbe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXt/xlib_libXt.hash | 11 ++++-------
 package/x11r7/xlib_libXt/xlib_libXt.mk   |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 7f457fb9bc..dcd4853d76 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,8 +1,5 @@
-# From https://lists.x.org/archives/xorg/2019-June/059825.html
-md5 a9019421d3ee8b4937b6afd9025f018a  libXt-1.2.0.tar.bz2
-sha1 f6b5ed799bc2e8d721e5407a09c2a8f570963f1b  libXt-1.2.0.tar.bz2
-sha256 b31df531dabed9f4611fc8980bc51d7782967e2aff44c4105251a1acb5a77831  libXt-1.2.0.tar.bz2
-sha512 06248508b6fe5dfba8ceb4518475f656162351d78136eeb5d65086d680dabe9aca7bba3c94347f9c13ef03f82dab3ac19d0952ee610bc8c51c14cee7cf65f0b1  libXt-1.2.0.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2021-January/003070.html
+sha256  679cc08f1646dbd27f5e48ffe8dd49406102937109130caab02ca32c083a3d60  libXt-1.2.1.tar.bz2
+sha512  6877af61ba91eeed6b6f80471b84f354ad0ec0827249c7ee0a00c13508063fe8d2696dd400a4bdbc6ca2ff67cbe1317ad5ac24522fd96099dc56535e33ca052c  libXt-1.2.1.tar.bz2
 # Locally calculated
-sha256 a2866ccc0b1745149e4a2258d934314d40cbb43bd8318c6fa597f233995b0a81 COPYING
+sha256  a2866ccc0b1745149e4a2258d934314d40cbb43bd8318c6fa597f233995b0a81 COPYING
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 01251c091b..289cb5ac54 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.2.0
+XLIB_LIBXT_VERSION = 1.2.1
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_LICENSE = MIT
