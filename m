From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 11:57:42 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.15.5
Message-ID: <20200412094438.16EB78E568@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a825aee639698fe26a96be8a659f93c222ade3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-April/041400.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ee6416e3b8..0edbca5082 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-March/041332.html
-md5  76c5cb1a55f5098ed353ae7d4e054c50  libinput-1.15.4.tar.xz
-sha1  43740a5fec3f6d474906173cc01ff3d73d935d2f  libinput-1.15.4.tar.xz
-sha256  9c8b6846d94e374ee4bdb32634e4ac4aa318afc31f9a58fcb545cd3095c745c1  libinput-1.15.4.tar.xz
-sha512  4659818952dc729cd5bdb78ebe21edbbacbf8a66a592b13ba30f3bb4c4e264208ec94440a253cfa4edc8b2ef904954eecea6be0f8d63cf239e3858d3abb64a80  libinput-1.15.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-April/041400.html
+md5  c9a1b15bb932eaf22f840efe4c3f84eb  libinput-1.15.5.tar.xz
+sha1  644b1c6936cfff8a4547da71fbcd7ebd28618426  libinput-1.15.5.tar.xz
+sha256  a90efc8f423c3094f2f9f372fb92381b2f3aad62e8b5882a8abe333aa8249c97  libinput-1.15.5.tar.xz
+sha512  a0a3a325048841fc017e19d3bc5f5490605972ab9e2730dc5678bda7efb7a5b1fa6f531f3c8abd8393899ec383d8d2bcfd586eacee04fc1fbda0e02ba2af956a  libinput-1.15.5.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 5e2ee696bf..bf58e70822 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.15.4
+LIBINPUT_VERSION = 1.15.5
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
