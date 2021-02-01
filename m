From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 18:21:43 +0100
Subject: [Buildroot] [git commit] package/libevdev: bump to version 1.11.0
Message-ID: <20210201170854.2ABC18104C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae15c50fbc3c3ca2896268a8c339c9dee2c4606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version libevdev sets the license to MIT license.  Actually
that has always been the intended license before.  Upstream made some
effort to have all contributors acknowledge that over the past months.

Link: https://lists.freedesktop.org/archives/input-tools/2021-February/001557.html
Link: https://gitlab.freedesktop.org/libevdev/libevdev/-/issues/9
Link: https://gitlab.freedesktop.org/libevdev/libevdev/-/merge_requests/69
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevdev/libevdev.hash | 8 ++++----
 package/libevdev/libevdev.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 4376f863a3..584a9941c5 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2021-January/001555.html
-sha256  0330fe8357ece915db9366c1b9a6648941aea6f724b73ad6e71401127aa08932  libevdev-1.10.1.tar.xz
-sha512  6b42cd1920f6b5ef4c40e1c0db9623cabf634d87202fd98730f861e5dc4ffc30a26500ec48213a459ec18b761e2cd2f4cf47c0ab8752e6b6baa5c4fa47893964  libevdev-1.10.1.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2021-February/001557.html
+sha256  63f4ea1489858a109080e0b40bd43e4e0903a1e12ea888d581db8c495747c2d0  libevdev-1.11.0.tar.xz
+sha512  b3c6b4a1532c5142f3684b920dcdd497a5368aec516e8c389e2c8f9d1eaba16c907b2a7f2c82a3c3ff89bb4d0ae5503c736098c095f9f1bc98f0668e99bf639d  libevdev-1.11.0.tar.xz
 
 # Hash for license files:
-sha256  f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137  COPYING
+sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 45116332a5..f6172809fd 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.10.1
+LIBEVDEV_VERSION = 1.11.0
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
-LIBEVDEV_LICENSE = X11
+LIBEVDEV_LICENSE = MIT
 LIBEVDEV_LICENSE_FILES = COPYING
 
 LIBEVDEV_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
