From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 30 Apr 2021 23:18:50 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.17.2
Message-ID: <20210430211850.18166-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-April/041809.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index e26512afd3..bf60fe6143 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-March/041758.html
-sha256  e51c50f3ce253961bed452d9f93102cc26128406975ab88ff9ec9e6c3b875137  libinput-1.17.1.tar.xz
-sha512  2e7baa198fed9c673d28453efb066f9371f2b575a844e41cde455c636bbe1cc68faae7129026944a502cd5d7bfcc72272066b9e3cda5c959f7b464483f9dd860  libinput-1.17.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-April/041809.html
+sha256  b822263086b6588b9a9a153be97dea409f63927fb67b9a241748e76f222a5be1  libinput-1.17.2.tar.xz
+sha512  b8953ad483648d5629d56c4dc226d4906693b15da5ba4027627a51ec35ea65b0603c09056b52ed2025df1f7a877669a5b7482c025e0b37003fc676563bd05263  libinput-1.17.2.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 264b19b026..619e0cc19a 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.17.1
+LIBINPUT_VERSION = 1.17.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.31.1
