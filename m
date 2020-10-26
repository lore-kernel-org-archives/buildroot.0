From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 26 Oct 2020 20:22:39 +0100
Subject: [Buildroot] [PATCH v1] package/libevdev: bump version to 1.10.0
Message-ID: <20201026192239.27691-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/input-tools/2020-October/001545.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 10 +++++-----
 package/libevdev/libevdev.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index c4ce252ef1..3003dc33fa 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/input-tools/2020-July/001541.html
-md5  58286a834ae14536caf9cab8633419cf  libevdev-1.9.1.tar.xz
-sha1  b61c6a09446d717edc4971f7bc3ce9ffa2f05306  libevdev-1.9.1.tar.xz
-sha256  f5603c48c5afd76b14df7a5124e0a94a102f8da0d45826192325069d1bbc7acb  libevdev-1.9.1.tar.xz
-sha512  7d845ce2279d2e2ef12437f6218550265ea0c85e5b6c0d116aff09787b73626b338fe3084baff060085d393688b5ae3d33772689e0581684eff257af01c4c645  libevdev-1.9.1.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2020-October/001545.html
+md5  c6239ef0d61c4f4911f25bb8426a0b82  libevdev-1.10.0.tar.xz
+sha1  3eedd43652a238f687595ffd722fd3bb94359216  libevdev-1.10.0.tar.xz
+sha256  3522c26e2c148be0ad68ce26fbced408a4185dea90bfe8079dc82b8ace962d4a  libevdev-1.10.0.tar.xz
+sha512  94ab4ee7e0854c41a491d8e4713baa95ae66dd337b41823011c0913aa1c72e8bbf8b808d5936c2ef456af794b6d3a5cd7cd0515fbd1d06dd1b7ba19275bd928f  libevdev-1.10.0.tar.xz
 
 # Hash for license files:
 sha256  f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 8505346b33..0453028f2f 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.9.1
+LIBEVDEV_VERSION = 1.10.0
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.29.0
