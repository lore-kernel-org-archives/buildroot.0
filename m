From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Nov 2016 15:26:24 -0200
Subject: [Buildroot] [PATCH 2/3] uboot-tools: bump to version 2016.11
In-Reply-To: <1479144385-27214-1-git-send-email-festevam@gmail.com>
References: <1479144385-27214-1-git-send-email-festevam@gmail.com>
Message-ID: <1479144385-27214-2-git-send-email-festevam@gmail.com>
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
index db60dab..5b2c3bf 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  95728e89dd476d17428f94080752ab48884be477b6a678941582aeef618b70bb  u-boot-2016.09.01.tar.bz2
+sha256  45813e6565dcc0436abe6752624324cdbf5f3ac106570d76d32b46ec529bcdc8  u-boot-2016.11.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index a3335a5..bb0cba8 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2016.09.01
+UBOOT_TOOLS_VERSION = 2016.11
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
2.7.4
