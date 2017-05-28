From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:56:05 +0200
Subject: [Buildroot] [git commit] package/libevdev: bump version to 1.5.7
Message-ID: <20170601202858.071CE82641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57425b0f233c214677cbf2281584a48bff082ed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.hash | 7 +++++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 613866c..1d3d184 100644
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
index 01ee7fb..e5d9c60 100644
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
