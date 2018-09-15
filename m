From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Sep 2018 23:08:03 +0200
Subject: [Buildroot] [PATCH 1/2] exfat: bump to version 1.3.0
Message-ID: <20180915210804.28722-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfat/exfat.hash | 3 ++-
 package/exfat/exfat.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
index 15b67f0094..4b8ce90190 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 e1105256d75860c0678f98bbae0b8fe465d4c96ed187b7035556097f152478e7  fuse-exfat-1.2.6.tar.gz
+sha256 07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3  fuse-exfat-1.3.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index f5ed13e207..b52b197062 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.2.6
+EXFAT_VERSION = 1.3.0
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
-- 
2.17.1
