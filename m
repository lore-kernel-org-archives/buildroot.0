From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu,  2 Feb 2017 17:34:27 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to v0.1.2
Message-ID: <1486053267-31839-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a small bug-fix release:
  - include instead of in gpioset
  - fix a formatting issue in gpioinfo for chips with >100 GPIO lines
  - fix a bug when requesting both-edges event notifications

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 7ba0531..9901be6 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 07f75ae1e0c086d28d77ef60d0566180698ce11c3271d89da444c0fc6c2f4580 libgpiod-v0.1.1.tar.gz
+sha256 c9a60e1073aacb25b4ad06d513f31416335b5a710f869cb7e838d2abb62e1e00 libgpiod-v0.1.2.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index e2e27f9..dbf9511 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = v0.1.1
+LIBGPIOD_VERSION = v0.1.2
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
 LIBGPIOD_LICENSE = GPLv3+
 LIBGPIOD_LICENSE_FILES = COPYING
-- 
2.9.3
