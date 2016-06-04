From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jun 2016 17:52:41 -0300
Subject: [Buildroot] [PATCH 1/2] cryptsetup: bump to version 1.7.2
Message-ID: <1465073562-28590-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 0928627..5972bf8 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
-sha256	73dc8a63cc984b56aa6a3c99f355262471bcfe78b3240b8b9d0caa8002911fec	cryptsetup-1.7.1.tar.xz
+sha256	dbb35dbf5f0c1749168c86c913fe98e872247bfc8425314b494c2423e7e43342	cryptsetup-1.7.2.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 4d37709..d7bd251 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 1.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
-- 
2.7.3
