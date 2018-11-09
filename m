From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri,  9 Nov 2018 12:01:44 +0100
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.2
Message-ID: <20181109110144.21013-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v1.2.x

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 99f7f8a298..318a107adf 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 172fa1544ecb51f37533b3e67862298d50c0a5cc84975f3c0706dc15467f0dfd  libgpiod-1.1.1.tar.xz
+sha256 b6b9079c933f7c8524815437937dda6b795a16141bca202a9eec70ba5844b5ba  libgpiod-1.2.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 8854b3b0c8..545526515f 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.1.1
+LIBGPIOD_VERSION = 1.2
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.19.1
