From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:08:25 +0100
Subject: [Buildroot] [git commit branch/next] package/libevdev: bump version
 to 1.9.0
Message-ID: <20200305215748.54C0A8F521@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceeb3ff41e001b2d3516ba7783bf6dce18087aea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And update hash file formatting (2 spaces).

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/input-tools/2020-February/001529.html
[2] https://lists.freedesktop.org/archives/input-tools/2020-March/001530.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libevdev/libevdev.hash | 12 ++++++------
 package/libevdev/libevdev.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 0d2c999222..5a28275319 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/input-tools/2019-August/001521.html
-md5 879631080be18526737e33b63d848039 libevdev-1.8.0.tar.xz
-sha1 4392d28fb91a5f6eb404aab531526f5fa0bbe73d libevdev-1.8.0.tar.xz
-sha256 20d3cae4efd277f485abdf8f2a7c46588e539998b5a08c2c4d368218379d4211 libevdev-1.8.0.tar.xz
-sha512 8d285632f4fe87c01e81f94e514bec4e37fed4bc44d6d38b9297dba1114e42f6ed8d143fc05f3d0e8d51b08b659e34481dc4c65f60421c54e2f3e11efbafdeb4 libevdev-1.8.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2020-March/001530.html
+md5  13c3f0911f9326d4b9fa103365f84421  libevdev-1.9.0.tar.xz
+sha1  ab5040ee88dd4cb49a75da72e8fded91b282c108  libevdev-1.9.0.tar.xz
+sha256  e7e18a64264f2dea19b6c50a481f8c062529d42919ccda0bc861495bce28eb9e  libevdev-1.9.0.tar.xz
+sha512  6e7589b5776437ac23fbf65b3194fb1dd3a68a294696145060cdd97bcdeb9b04f355f2be028dc1a5efe98ef2cafca15e4f61115edf5d62591e3a8944dc95942a  libevdev-1.9.0.tar.xz
 
 # Hash for license files:
-sha256 f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137 COPYING
+sha256  f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 8b243be74e..2fac47f2f8 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.8.0
+LIBEVDEV_VERSION = 1.9.0
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
