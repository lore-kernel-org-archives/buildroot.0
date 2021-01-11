From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 23:10:07 +0100
Subject: [Buildroot] [git commit] package/libevdev: bump version to 1.10.1
Message-ID: <20210111215137.5EC9487120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a5ba80b86529a653040ebef0acc623e70451dda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/input-tools/2021-January/001555.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libevdev/libevdev.hash | 8 +++-----
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 3003dc33fa..4376f863a3 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,8 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2020-October/001545.html
-md5  c6239ef0d61c4f4911f25bb8426a0b82  libevdev-1.10.0.tar.xz
-sha1  3eedd43652a238f687595ffd722fd3bb94359216  libevdev-1.10.0.tar.xz
-sha256  3522c26e2c148be0ad68ce26fbced408a4185dea90bfe8079dc82b8ace962d4a  libevdev-1.10.0.tar.xz
-sha512  94ab4ee7e0854c41a491d8e4713baa95ae66dd337b41823011c0913aa1c72e8bbf8b808d5936c2ef456af794b6d3a5cd7cd0515fbd1d06dd1b7ba19275bd928f  libevdev-1.10.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2021-January/001555.html
+sha256  0330fe8357ece915db9366c1b9a6648941aea6f724b73ad6e71401127aa08932  libevdev-1.10.1.tar.xz
+sha512  6b42cd1920f6b5ef4c40e1c0db9623cabf634d87202fd98730f861e5dc4ffc30a26500ec48213a459ec18b761e2cd2f4cf47c0ab8752e6b6baa5c4fa47893964  libevdev-1.10.1.tar.xz
 
 # Hash for license files:
 sha256  f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 0453028f2f..45116332a5 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.10.0
+LIBEVDEV_VERSION = 1.10.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
