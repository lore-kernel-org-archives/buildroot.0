From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 22:52:54 +0200
Subject: [Buildroot] [git commit] libgpiod: bump version to v1.1.1
Message-ID: <20180725204845.1B1B78A3AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bb563ac53d112ccf4475081175d452e703f6536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bug-fix release that fixes a couple memory leaks and bugs in
python bindings discovered in the v1.1 release.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 1d217f6048..99f7f8a298 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1  libgpiod-1.1.tar.xz
+sha256 172fa1544ecb51f37533b3e67862298d50c0a5cc84975f3c0706dc15467f0dfd  libgpiod-1.1.1.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 2f4b40eafc..8854b3b0c8 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.1
+LIBGPIOD_VERSION = 1.1.1
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
