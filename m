From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  5 Oct 2020 10:45:45 +0300
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: bump to version R8.8
Message-ID: <9dc5d63276d0be129546a0b8211f1eb3d6e69d1a.1601883945.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Format hashes with two spaces delimiter.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/18xx-ti-utils/18xx-ti-utils.hash | 4 ++--
 package/18xx-ti-utils/18xx-ti-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.hash b/package/18xx-ti-utils/18xx-ti-utils.hash
index faa23d0b3edc..a7d4068fa75f 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.hash
+++ b/package/18xx-ti-utils/18xx-ti-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9ce2c7228dd0ac8d3cc530a32bb92b532bdbc5dfb6a405c245abee678d878697  18xx-ti-utils-R8.7_SP3.tar.gz
-sha256 363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
+sha256  32ca7f1ca72b82ffb2acbee4bbe4de049af1da681421be0f2f595952761f29ee  18xx-ti-utils-R8.8.tar.gz
+sha256  363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 625127d70944..0985c9735b3d 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-18XX_TI_UTILS_VERSION = R8.7_SP3
+18XX_TI_UTILS_VERSION = R8.8
 18XX_TI_UTILS_SITE = git://git.ti.com/wilink8-wlan/18xx-ti-utils
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause
-- 
2.28.0
