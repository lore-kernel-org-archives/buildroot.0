From: =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Tue,  8 Sep 2020 15:30:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: bump to version
 fabe598
Message-ID: <20200908133051.13321-1-alejandro.gonzalez.correo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version fixes building with 5.9 kernels.

Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index 53f64e6830..1cbc2e8597 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d67a4a306a0d449298af2448f8f324bf79ec9d41411eef0c92ed764b6d505eee cryptodev-linux-f2927e313b6a74408d17d152abb21aa59d113b46.tar.gz
+sha256 0e2d30cf440a55e1125c815f0df229350192cfddbb38e6571e97de19069c97c6 cryptodev-linux-fabe5989a3dc9fba0cd0a40b612247cdde351c01.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 3d5d640b8a..5b882b284e 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = f2927e313b6a74408d17d152abb21aa59d113b46
+CRYPTODEV_LINUX_VERSION = fabe5989a3dc9fba0cd0a40b612247cdde351c01
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
-- 
2.28.0
