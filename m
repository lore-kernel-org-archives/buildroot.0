From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Jan 2018 21:01:21 +0100
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.5.8
Message-ID: <20180130200121.24162-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/input-tools/2018-January/001447.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 10 +++++-----
 package/libevdev/libevdev.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 1d3d18434f..0702a7b006 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/input-tools/2017-May/001387.html
-md5 4f1cfaee8d75ea3fbbfeb99a98730952  libevdev-1.5.7.tar.xz
-sha1 ba1d8b66af9bd4e1d503ce6b2ed011e9e309048c  libevdev-1.5.7.tar.xz
-sha256 a1e59e37a2f0d397ffd7e83b73af0e638db83b8dd08902ef0f651a21cc1dd422  libevdev-1.5.7.tar.xz
-sha512 53adf6c92ec61f0635b643a88d8762a18f7cd3088d23ac95831be32cc7150ebd19f20265b90f6a1f9a63420c2f8968c2d17d8dc4892c0e90f9dfcce82c622df1  libevdev-1.5.7.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2018-January/001447.html
+md5 c25a8c3939e4ad59a5e9e5e1e354832d libevdev-1.5.8.tar.xz
+sha1 a60e7a43570cdbc64af5adf99ca80023d21a1174 libevdev-1.5.8.tar.xz
+sha256 6083d81e46609da8ba80cb826c02d9080764a6dec33c8267ccb7e158833d4c6d libevdev-1.5.8.tar.xz
+sha512 e9485d8c6b48ebf762b32b003bc6b761c548024ad3bc34a0793485b53383746881fcc9b206a078d571937291e519d9822e50c5d8816778d347094691b65ec3fa libevdev-1.5.8.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index e5d9c60d26..1893863efd 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.7
+LIBEVDEV_VERSION = 1.5.8
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.16.1
