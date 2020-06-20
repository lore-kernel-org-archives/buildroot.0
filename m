From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 08:32:57 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.15.6
Message-ID: <20200620063227.195F27F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc7c0f8f08400857414929a56404d153dcfd4c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-June/041478.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 0edbca5082..97bdeb36e7 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-April/041400.html
-md5  c9a1b15bb932eaf22f840efe4c3f84eb  libinput-1.15.5.tar.xz
-sha1  644b1c6936cfff8a4547da71fbcd7ebd28618426  libinput-1.15.5.tar.xz
-sha256  a90efc8f423c3094f2f9f372fb92381b2f3aad62e8b5882a8abe333aa8249c97  libinput-1.15.5.tar.xz
-sha512  a0a3a325048841fc017e19d3bc5f5490605972ab9e2730dc5678bda7efb7a5b1fa6f531f3c8abd8393899ec383d8d2bcfd586eacee04fc1fbda0e02ba2af956a  libinput-1.15.5.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-June/041478.html
+md5  b2388a1d6f0dcc944b49bc7239a53be8  libinput-1.15.6.tar.xz
+sha1  3313a4d76df51e62dfd3cf84918352faa0cf21de  libinput-1.15.6.tar.xz
+sha256  aeedea216a6317ddc6e27c3d54f26b987078780db6a8320cc09e19c25b307f1c  libinput-1.15.6.tar.xz
+sha512  90459e5a1f22fd42ffcbab157b461e4514c30803bcebdaced76c65c05cccfa6f259640a50497055fe7ed0b376a6979f6d1d01227ae447fe60ba88fa81142b969  libinput-1.15.6.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index bf58e70822..4d708955ea 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.15.5
+LIBINPUT_VERSION = 1.15.6
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
