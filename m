From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Mar 2019 15:29:43 +0100
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.3
Message-ID: <20190325142943.15540-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a new minor release. Changes are summarized in NEWS.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index e68ebdb8c7..6c896622b6 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 736d8b511ad247c2acb01b592f2bbe5e757e14e1d8347b2d80683081ab4b31b8  libgpiod-1.2.1.tar.xz
+sha256 6ec837f23e8f2196e5976dec4ac81403170830075e7f33ede1394eaf67f2e962  libgpiod-1.3.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index c46ffa871c..76fa3399dc 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.2.1
+LIBGPIOD_VERSION = 1.3
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.20.1
