From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 22:13:59 +0200
Subject: [Buildroot] [git commit] package/18xx-ti-utils: bump to version R8.8
Message-ID: <20201008210211.53A5E8F000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec05cc07a2d48c020dd94d8727c7dc9ecc2527cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Format hashes with two spaces delimiter.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/18xx-ti-utils/18xx-ti-utils.hash | 4 ++--
 package/18xx-ti-utils/18xx-ti-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.hash b/package/18xx-ti-utils/18xx-ti-utils.hash
index faa23d0b3e..a7d4068fa7 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.hash
+++ b/package/18xx-ti-utils/18xx-ti-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9ce2c7228dd0ac8d3cc530a32bb92b532bdbc5dfb6a405c245abee678d878697  18xx-ti-utils-R8.7_SP3.tar.gz
-sha256 363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
+sha256  32ca7f1ca72b82ffb2acbee4bbe4de049af1da681421be0f2f595952761f29ee  18xx-ti-utils-R8.8.tar.gz
+sha256  363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 625127d709..0985c9735b 100644
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
