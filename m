From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:50:09 +0100
Subject: [Buildroot] [git commit] package/libraw1394: bump version to 2.1.1
Message-ID: <20160201224703.BFE787F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8995d25f0a8b259b22df2900e4c7e4786357a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw1394/libraw1394.hash | 2 +-
 package/libraw1394/libraw1394.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libraw1394/libraw1394.hash b/package/libraw1394/libraw1394.hash
index 5d18e98..3674ad7 100644
--- a/package/libraw1394/libraw1394.hash
+++ b/package/libraw1394/libraw1394.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/libs/ieee1394/sha256sums.asc
-sha256	e3dc814bc8014cc0bd306767c15e686c9b3b07fcacbbf62862fb1c1de2d708a4	libraw1394-2.0.7.tar.xz
+sha256	1bab9780189f9d1eb4e973df12679c04f979c21e024240fc98e536ff5b680ee9	libraw1394-2.1.1.tar.xz
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 108dde9..c9bc0b1 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW1394_VERSION = 2.0.7
+LIBRAW1394_VERSION = 2.1.1
 LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
 LIBRAW1394_INSTALL_STAGING = YES
