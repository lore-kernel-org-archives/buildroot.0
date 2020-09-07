From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:34:12 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.16.1
Message-ID: <20200907192557.D9DA8814BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2aa14fabe1bf9fb29143b9780dd1a94859391244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-August/041590.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 8c0bc520c1..dad9f875fd 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-August/041578.html
-md5  b518dae7f603040872739216971ee97b  libinput-1.16.0.tar.xz
-sha1  e9216dcc3e3d87d37371335380d15d2dc333e157  libinput-1.16.0.tar.xz
-sha256  83f6d0c94e5e0dd87094ce73f0edb631919617d24a60ee0ab9bd9197411d76e8  libinput-1.16.0.tar.xz
-sha512  0c932a88f2a1d23ebef0d58c0cdbfb558e9e3d990fca15b21f5b9011bdd1bc2da81aad374fcdb8f4590f6ee2fc45e668e0583371ceb354437e585240e687aac6  libinput-1.16.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-August/041590.html
+md5  51454993fcc576f4480aba8c1c3232ac  libinput-1.16.1.tar.xz
+sha1  7f5df6d17e9a06b6a28ce9eea0a11cf8555b63dd  libinput-1.16.1.tar.xz
+sha256  7ba7d1aeedd15168bb21d17e9e628aa1c27957963a423a3fea3938a501758539  libinput-1.16.1.tar.xz
+sha512  86b2d563c2cff2b3d3cae3acdd399030cc785cc9859a06357a99565ef51f95122a8427c8c0883121fb0760613460a29c8cd8c7a7e3ac68115c10330b3b75cbe0  libinput-1.16.1.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index c4fff60cae..3c6873d7fd 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.16.0
+LIBINPUT_VERSION = 1.16.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
