From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 24 Mar 2021 22:27:55 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.17.1
Message-ID: <20210324212755.9168-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-March/041758.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f39ba3dbb6..e26512afd3 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-February/041733.html
-sha256  c560cfca14cb5c50d2a1b7551df06bc5d4306e32c128f3e3d37e137285dedbad  libinput-1.17.0.tar.xz
-sha512  490c7e59cbaa43e4190dbc421582dca887b6ae92304c4f8f3ea9df515bd76de41ca9a376e6f1cfe7b235dd2d5d8d8ef5982f5ddcf958e3b31b981e9440bb0888  libinput-1.17.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-March/041758.html
+sha256  e51c50f3ce253961bed452d9f93102cc26128406975ab88ff9ec9e6c3b875137  libinput-1.17.1.tar.xz
+sha512  2e7baa198fed9c673d28453efb066f9371f2b575a844e41cde455c636bbe1cc68faae7129026944a502cd5d7bfcc72272066b9e3cda5c959f7b464483f9dd860  libinput-1.17.1.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 982d92d062..264b19b026 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.17.0
+LIBINPUT_VERSION = 1.17.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.30.2
