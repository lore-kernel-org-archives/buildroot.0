From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 14 Feb 2017 10:33:54 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 0.1.3
Message-ID: <1487064834-10378-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release 0.1.2 claimed to fix an issue with requesting both types of
line events, but actually didn't. This time it's really fixed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 9901be6..eee2a66 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c9a60e1073aacb25b4ad06d513f31416335b5a710f869cb7e838d2abb62e1e00 libgpiod-v0.1.2.tar.gz
+sha256 670a13518fabf2a99f9e349c33d5421c2146eec15b73c5edef3f1981a7adaeda libgpiod-v0.1.3.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index dbf9511..bc9c6ec 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = v0.1.2
+LIBGPIOD_VERSION = v0.1.3
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
 LIBGPIOD_LICENSE = GPLv3+
 LIBGPIOD_LICENSE_FILES = COPYING
-- 
2.9.3
