From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu,  6 Jun 2019 16:40:59 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.4
Message-ID: <20190606144059.24133-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This release mostly affects the testing framework but also contains fixes
for C++ bindings.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 6c896622b6..2faa8bbbbb 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 6ec837f23e8f2196e5976dec4ac81403170830075e7f33ede1394eaf67f2e962  libgpiod-1.3.tar.xz
+sha256 ebde83aaf14be3abd33e7a90faa487a2ee231e242897afe7fdefb765386b3c8b  libgpiod-1.4.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 76fa3399dc..07fa050007 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.3
+LIBGPIOD_VERSION = 1.4
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.21.0
