From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 09:55:03 +0200
Subject: [Buildroot] [git commit] package/openocd: add license infos
Message-ID: <20170817074909.E182E7FA06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0041d3cb8b5194a602dfd031c81747415d75811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openocd/openocd.hash | 1 +
 package/openocd/openocd.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index b36c816..3fb817b 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,3 +1,4 @@
 # From http://sourceforge.net/projects/openocd/files/openocd/0.10.0/
 sha1 3245d43d60a1a93f8b0f6b1ce20b53e38cab7a4a  openocd-0.10.0.tar.bz2
 md5 b412bdef0481a3859c6585eb69f6f6ba  openocd-0.10.0.tar.bz2
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9868121..9d2576c 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -7,6 +7,8 @@
 OPENOCD_VERSION = 0.10.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
+OPENOCD_LICENSE = GPL-2.0+
+OPENOCD_LICENSE_FILES = COPYING
 # 0002-configure-enable-build-on-uclinux.patch patches configure.ac
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
