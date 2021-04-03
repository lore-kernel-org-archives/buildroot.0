From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:49:55 +0200
Subject: [Buildroot] [git commit] package/libebur128: bump version to 1.2.6
Message-ID: <20210403132549.B9E918B690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfd57a8a9827aa56982c98f02e9af6e0de7fcb04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Release notes:
https://github.com/jiixyj/libebur128/blob/master/README.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libebur128/libebur128.hash | 4 ++--
 package/libebur128/libebur128.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
index e2285bc7cf..9c8c9e0c31 100644
--- a/package/libebur128/libebur128.hash
+++ b/package/libebur128/libebur128.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2ee41a3a5ae3891601ae975d5ec2642b997d276ef647cf5c5b363b6127f7add8  libebur128-1.2.4.tar.gz
-sha256 d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
+sha256  baa7fc293a3d4651e244d8022ad03ab797ca3c2ad8442c43199afe8059faa613  libebur128-1.2.6.tar.gz
+sha256  d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
index 97c1bdbbd9..b7272fa7e1 100644
--- a/package/libebur128/libebur128.mk
+++ b/package/libebur128/libebur128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBUR128_VERSION = 1.2.4
+LIBEBUR128_VERSION = 1.2.6
 LIBEBUR128_SITE = $(call github,jiixyj,libebur128,v$(LIBEBUR128_VERSION))
 LIBEBUR128_LICENSE = MIT
 LIBEBUR128_LICENSE_FILES = COPYING
