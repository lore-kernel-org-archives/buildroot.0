From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  2 Jul 2015 14:50:53 +0300
Subject: [Buildroot] [PATCH 1/2] cryptsetup: bump to version 1.6.7
Message-ID: <ebe4bbc5879916055ba594a8db7a47c19f21e80a.1435837854.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index f288082c9074..a4180812dea5 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
-sha256	2d2ce28e4e1137dd599d87884b62ef6dbf14fd7848b2a2bf7d61cf125fbd8e6f	cryptsetup-1.6.6.tar.xz
+sha256	c23c24c8d662032da8650c1c84985221be8bbedf4737c1540bba7e4517dfe820	cryptsetup-1.6.7.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 88ddc37a58da..754bea575592 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 1.6
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs host-pkgconf \
-- 
2.1.4
