From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  8 Jun 2021 21:49:25 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libinput: bump version to 1.17.3
Message-ID: <20210608194926.14477-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-May/041834.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index bf60fe6143..038859289a 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-April/041809.html
-sha256  b822263086b6588b9a9a153be97dea409f63927fb67b9a241748e76f222a5be1  libinput-1.17.2.tar.xz
-sha512  b8953ad483648d5629d56c4dc226d4906693b15da5ba4027627a51ec35ea65b0603c09056b52ed2025df1f7a877669a5b7482c025e0b37003fc676563bd05263  libinput-1.17.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-May/041834.html
+sha256  0d010e0bf601b5d3a06b3c4d77d67751cf554f3e6448e57aa046ea9ee8f818ac  libinput-1.17.3.tar.xz
+sha512  3d1ab4362ede886996795d700a938d20e04cd922e8f9598fe9346f9f93e149119526fb324a096787b4b8a47bf3e5613130bcd874f10df86761031710d2acc792  libinput-1.17.3.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 619e0cc19a..8ce60c8639 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.17.2
+LIBINPUT_VERSION = 1.17.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.31.1
