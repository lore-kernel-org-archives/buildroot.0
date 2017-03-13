From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Mar 2017 16:44:23 -0300
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2017.03
In-Reply-To: <1489434263-2383-1-git-send-email-festevam@gmail.com>
References: <1489434263-2383-1-git-send-email-festevam@gmail.com>
Message-ID: <1489434263-2383-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 5473cfe..9606d9f 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  6c425175f93a4bcf2ec9faf5658ef279633dbd7856a293d95bd1ff516528ecf2  u-boot-2017.01.tar.bz2
+sha256  f54baf3f9325bf444c7905f3a5b6f83680edb1e6e1a4d5f8a5ad80abe885113f  u-boot-2017.03.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index fe363e7..b26a662 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2017.01
+UBOOT_TOOLS_VERSION = 2017.03
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
2.7.4
