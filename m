From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed,  7 Feb 2018 16:54:54 +0100
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.0
Message-ID: <20180207155454.30401-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a major update for libgpiod. The API is not compatible with the
v0.x.y series but since nothing in current buildroot git depends on
this project, I believe we can simply bump the version.

The included tools are compatible with their 0.x.y counterparts.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 73150dc9b9..a98e138fa4 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37  libgpiod-0.3.2.tar.xz
+sha256 34c76b3730b9d4a1159bcb14000f78b1e890251b8a3823b794fa930654eabdd0  libgpiod-1.0.tar.xz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index bc2e51d280..598adcc599 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 0.3.2
+LIBGPIOD_VERSION = 1.0
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.16.1
