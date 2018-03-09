From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:26:30 +0100
Subject: [Buildroot] [git commit] libevdev: bump version to 1.5.9
Message-ID: <20180309213409.79D1781184@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3df649aa4206bc68181f3e8bb7f624d1adcacba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- for details see [1]
- add hash for license file

[1] https://lists.freedesktop.org/archives/input-tools/2018-March/001464.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevdev/libevdev.hash | 13 ++++++++-----
 package/libevdev/libevdev.mk   |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 0702a7b006..e4294dcade 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,5 +1,8 @@
-# From https://lists.freedesktop.org/archives/input-tools/2018-January/001447.html
-md5 c25a8c3939e4ad59a5e9e5e1e354832d libevdev-1.5.8.tar.xz
-sha1 a60e7a43570cdbc64af5adf99ca80023d21a1174 libevdev-1.5.8.tar.xz
-sha256 6083d81e46609da8ba80cb826c02d9080764a6dec33c8267ccb7e158833d4c6d libevdev-1.5.8.tar.xz
-sha512 e9485d8c6b48ebf762b32b003bc6b761c548024ad3bc34a0793485b53383746881fcc9b206a078d571937291e519d9822e50c5d8816778d347094691b65ec3fa libevdev-1.5.8.tar.xz
+# https://lists.freedesktop.org/archives/input-tools/2018-March/001464.html
+md5  a1ca11e961c1efed720fac4130881904 libevdev-1.5.9.tar.xz
+sha1 9457e33af5c1e66e29c1385a5550fe60aef8e42e libevdev-1.5.9.tar.xz
+sha256 e1663751443bed9d3e76a4fe2caf6fa866a79705d91cacad815c04e706198a75 libevdev-1.5.9.tar.xz
+sha512 4496ab4d9dc165f416a574c21a7fcee54ae104c21ef4785a4dd0311fff428020cdbb5da7bf3f835e78dae05effdb1a557d189347f6e62dd6be2d8bcdc845850c libevdev-1.5.9.tar.xz
+
+# Hash for license files:
+sha256 f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137 COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 1893863efd..880d75dfbd 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.8
+LIBEVDEV_VERSION = 1.5.9
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
