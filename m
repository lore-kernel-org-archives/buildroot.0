From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Sep 2018 23:08:04 +0200
Subject: [Buildroot] [PATCH 2/2] exfat-utils: bump to version 1.3.0
In-Reply-To: <20180915210804.28722-1-fontaine.fabrice@gmail.com>
References: <20180915210804.28722-1-fontaine.fabrice@gmail.com>
Message-ID: <20180915210804.28722-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfat-utils/exfat-utils.hash | 3 ++-
 package/exfat-utils/exfat-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index f0d6b64259..53155d41ba 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b96b6692cf92a629c9eca0fe8c782646e20479524c7d2a99b7e9b43c3cf8ac43  exfat-utils-1.2.6.tar.gz
+sha256 dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835  exfat-utils-1.3.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index c1b5a93540..62cd47186f 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.2.6
+EXFAT_UTILS_VERSION = 1.3.0
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPL-3.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
-- 
2.17.1
