From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:27 +0100
Subject: [Buildroot] [PATCH 21/51] omap-u-boot-utils: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-21-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/omap-u-boot-utils/omap-u-boot-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.1
