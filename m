From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 08:53:04 +0200
Subject: [Buildroot] [git commit] package/i2c-tools: bump to version 4.2
Message-ID: <20201003065707.7A01A81262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d9ea09bc959a22a32765b89379b6481773de1dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use upstream provided hash.

Update README hash because of unrelated content changes.

Format hashes with two spaces delimiter.

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/i2c-tools/i2c-tools.hash | 10 +++++-----
 package/i2c-tools/i2c-tools.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 280a139c00..150bdb2e63 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,7 +1,7 @@
-# Locally computed
-sha256 57b219efd183795bd545dd5a60d9eabbe9dcb6f8fb92bc7ba2122b87f98527d5  i2c-tools-4.1.tar.xz
+# From https://www.kernel.org/pub/software/utils/i2c-tools/sha256sums.asc
+sha256  37f2dabc7082d185903ff21d1f584b5dcb4dd2eb2c879bbd8d7c50ae900dacd6  i2c-tools-4.2.tar.xz
 
 # License files
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256 b75b04b46320dff5e2b50a9c69b8e526b7db5087083ea3ba65533f08fc11b9f0  README
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256  370e8bc3d45744170cc4b12dc5135b107fa40a00179a19973fbd714146dec04c  README
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index d4d9c012fa..c1770cf636 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 4.1
+I2C_TOOLS_VERSION = 4.2
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
