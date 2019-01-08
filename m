From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jan 2019 16:17:40 +0100
Subject: [Buildroot] [git commit] libinput: bump version to 1.12.5
Message-ID: <20190108151828.B5BD483664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de25d790134762b3257b08273d1bc8168b476808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-January/039804.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 238ad13ece..3ca3fd6771 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# https://lists.freedesktop.org/archives/wayland-devel/2018-December/039782.html
-md5 8d3c7a7467a45a3ba544d1a745267d38 libinput-1.12.4.tar.xz
-sha1 9c1a7a2fead7f03eb21a5a0f5ac3bff6af00ebf8 libinput-1.12.4.tar.xz
-sha256 a4f329641c2e2d98199840f99792f646a3041256a380d074e00200991fcb31e6 libinput-1.12.4.tar.xz
-sha512 4e43ed5213059a481e5a73549c8325e5729d08512c4f580b924d4338a1b69dabd77fb612bec418f294c1da96c738ce26e45f8de8fbc222ab1af71a1535b3240f libinput-1.12.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-January/039804.html
+md5  40dcc044443c9314537f605b6f30bf17 libinput-1.12.5.tar.xz
+sha1 7c0b75e8cf2f1747fb8ae69300acabd46f7a7f0d libinput-1.12.5.tar.xz
+sha256 7d4b6831010ef3bf69df4b41170047fa4325edef8ff5d2d28e78281af0687123 libinput-1.12.5.tar.xz
+sha512 9365b91b3ac2c4ff0f9927913242afac7677979682dd7b541001b13d09d7982acd854f6d348101cfa4b0854c6a92b4c683f62593a97870e32ae3d607eaeae3ff libinput-1.12.5.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 89461bf494..bc4cc89825 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.12.4
+LIBINPUT_VERSION = 1.12.5
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
