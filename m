From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 14:45:12 +0200
Subject: [Buildroot] [PATCH/next] package/libevdev: bump version to 1.5.7
Message-ID: <20170528124512.30580-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libevdev/libevdev.hash | 7 +++++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 613866cfb..1d3d18434 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,5 @@
-# Hash from https://lists.freedesktop.org/archives/input-tools/2017-January/001380.html
-sha256 ecec7e9d66b1d3692f10b3b20aa97fb25e874a784c5552a7b1698091fef5a688 libevdev-1.5.6.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2017-May/001387.html
+md5 4f1cfaee8d75ea3fbbfeb99a98730952  libevdev-1.5.7.tar.xz
+sha1 ba1d8b66af9bd4e1d503ce6b2ed011e9e309048c  libevdev-1.5.7.tar.xz
+sha256 a1e59e37a2f0d397ffd7e83b73af0e638db83b8dd08902ef0f651a21cc1dd422  libevdev-1.5.7.tar.xz
+sha512 53adf6c92ec61f0635b643a88d8762a18f7cd3088d23ac95831be32cc7150ebd19f20265b90f6a1f9a63420c2f8968c2d17d8dc4892c0e90f9dfcce82c622df1  libevdev-1.5.7.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 01ee7fbaa..e5d9c60d2 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.6
+LIBEVDEV_VERSION = 1.5.7
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.11.0
