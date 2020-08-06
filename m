From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  6 Aug 2020 22:23:46 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.16.0
Message-ID: <20200806202346.5024-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1], [2] and [3].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-July/041529.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2020-July/041545.html
[3] https://lists.freedesktop.org/archives/wayland-devel/2020-August/041578.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 97bdeb36e7..8c0bc520c1 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-June/041478.html
-md5  b2388a1d6f0dcc944b49bc7239a53be8  libinput-1.15.6.tar.xz
-sha1  3313a4d76df51e62dfd3cf84918352faa0cf21de  libinput-1.15.6.tar.xz
-sha256  aeedea216a6317ddc6e27c3d54f26b987078780db6a8320cc09e19c25b307f1c  libinput-1.15.6.tar.xz
-sha512  90459e5a1f22fd42ffcbab157b461e4514c30803bcebdaced76c65c05cccfa6f259640a50497055fe7ed0b376a6979f6d1d01227ae447fe60ba88fa81142b969  libinput-1.15.6.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-August/041578.html
+md5  b518dae7f603040872739216971ee97b  libinput-1.16.0.tar.xz
+sha1  e9216dcc3e3d87d37371335380d15d2dc333e157  libinput-1.16.0.tar.xz
+sha256  83f6d0c94e5e0dd87094ce73f0edb631919617d24a60ee0ab9bd9197411d76e8  libinput-1.16.0.tar.xz
+sha512  0c932a88f2a1d23ebef0d58c0cdbfb558e9e3d990fca15b21f5b9011bdd1bc2da81aad374fcdb8f4590f6ee2fc45e668e0583371ceb354437e585240e687aac6  libinput-1.16.0.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 4d708955ea..c4fff60cae 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.15.6
+LIBINPUT_VERSION = 1.16.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.28.0
