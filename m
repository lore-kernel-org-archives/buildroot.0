From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 20 Jul 2016 14:28:00 +0100
Subject: [Buildroot] [PATCH] kmod: bump version to 23
Message-ID: <1469021280-26382-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 75b819e..8220fd4 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  ba3b1ddea33228b473189fcb05b809024a3b86e9a7cf37d420cae06beb749f82  kmod-22.tar.xz
+sha256 d303d5519faec9d69e1132f6b37db2579db17a7fb5c1517da0115d03ba168155  kmod-23.tar.xz
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 2b9d002..1753b1d 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 22
+KMOD_VERSION = 23
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.7.3
