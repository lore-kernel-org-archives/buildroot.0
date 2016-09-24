From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 24 Sep 2016 12:33:02 -0300
Subject: [Buildroot] [PATCH 2/3] uboot-tools: bump to version 2016.09.01
In-Reply-To: <1474731183-14968-1-git-send-email-festevam@gmail.com>
References: <1474731183-14968-1-git-send-email-festevam@gmail.com>
Message-ID: <1474731183-14968-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

2016.09.01 is a bugfix release, so bump to this version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 6870d68..db60dab 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  994e7b9e0e350d9f91f5892d5e5bff00d3714a4962f520f78a64a461ef950ba9  u-boot-2016.09.tar.bz2
+sha256  95728e89dd476d17428f94080752ab48884be477b6a678941582aeef618b70bb  u-boot-2016.09.01.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d2042be..a3335a5 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2016.09
+UBOOT_TOOLS_VERSION = 2016.09.01
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
2.7.4
