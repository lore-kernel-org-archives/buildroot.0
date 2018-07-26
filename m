From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 26 Jul 2018 19:03:39 +0200
Subject: [Buildroot] [PATCH 1/2] uboot-tools: bump to version 2018.07
Message-ID: <20180726170340.30734-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 17840d8d9b..97d0bd0b5f 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  4da13c2a6139a78cc08608f21fd4741db27eda336cfad7ab8264fda923b9c048  u-boot-2018.05.tar.bz2
+sha256  9f10df88bc91b35642e461217f73256bbaeeca9ae2db8db56197ba5e89e1f6d4  u-boot-2018.07.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b247c2173d..f5027d2da3 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2018.05
+UBOOT_TOOLS_VERSION = 2018.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
-- 
2.18.0
