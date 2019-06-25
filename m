From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Jun 2019 22:17:34 +0200
Subject: [Buildroot] [PATCH v1] package/libevdev: bump version to 1.7.0
Message-ID: <20190625201734.25255-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/input-tools/2019-May/001511.html
[2] https://lists.freedesktop.org/archives/input-tools/2019-June/001512.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 10 +++++-----
 package/libevdev/libevdev.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 4a750e0ac9..5d17fec11f 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/input-tools/2018-October/001488.html
-md5 154b24f01425c4c82fdc3e11f2c13af6 libevdev-1.6.0.tar.xz
-sha1 ef584a500833fe737bacb89350f93314b07f1c42 libevdev-1.6.0.tar.xz
-sha256 f5005c865987d980cc1279b9ec6131b06a89fd9892f649f2a68262b8786ef814 libevdev-1.6.0.tar.xz
-sha512 73046da447773716c9f0c9f511f3a0a6ababcf92a146eba363014afcbdb465f4c3cd8be0917f2f01561a72f24f20fe8ecd333467437d9d85c03afcb433d05060 libevdev-1.6.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2019-June/001512.html
+md5 fabe87d8d7d7f7cdb4a26e5dc99fc517 libevdev-1.7.0.tar.xz
+sha1 418a06290c7a2f2ecaefca8b4d15e30e80428f61 libevdev-1.7.0.tar.xz
+sha256 11dbe1f2b1d03a51f3e9a196757a75c3a999042ce34cf1fdc00a2363e5a2e369 libevdev-1.7.0.tar.xz
+sha512 bc43723fd1ca251a77ee549022609f73c15a33ae470fc843ac687542fb1938fba4d046d3ee1dc814bc38a4292a7f2ad9e71fcce45525b518a4f4a5bef099aa6f libevdev-1.7.0.tar.xz

 # Hash for license files:
 sha256 f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137 COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index d8361028da..27b1615482 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBEVDEV_VERSION = 1.6.0
+LIBEVDEV_VERSION = 1.7.0
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
--
2.21.0
