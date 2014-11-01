From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 21:48:34 +0100
Subject: [Buildroot] [git commit] omap-u-boot-utils: bump version
Message-ID: <20141101221442.DBE37B2BD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f60d4a8336d9e4b1914d4eda2c400de94bf0a7cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omap-u-boot-utils/omap-u-boot-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index ad8f430..7cfed65 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMAP_U_BOOT_UTILS_VERSION = 8aff852322c6f52bd09568bef7725ab509d81725
+OMAP_U_BOOT_UTILS_VERSION = 3f07426cddc0be9e24702e7aacc7574ddd7fba28
 OMAP_U_BOOT_UTILS_SITE = $(call github,nmenon,omap-u-boot-utils,$(OMAP_U_BOOT_UTILS_VERSION))
 OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
 OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
