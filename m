From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  7 May 2018 17:44:01 -0300
Subject: [Buildroot] [PATCH 2/3] uboot-tools: bump to version 2018.05
In-Reply-To: <1525725842-3078-1-git-send-email-festevam@gmail.com>
References: <1525725842-3078-1-git-send-email-festevam@gmail.com>
Message-ID: <1525725842-3078-2-git-send-email-festevam@gmail.com>
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
index 788c169..17840d8 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  7e7477534409d5368eb1371ffde6820f0f79780a1a1f676161c48442cb303dfd  u-boot-2018.03.tar.bz2
+sha256  4da13c2a6139a78cc08608f21fd4741db27eda336cfad7ab8264fda923b9c048  u-boot-2018.05.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 882576d..b247c21 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2018.03
+UBOOT_TOOLS_VERSION = 2018.05
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
-- 
2.7.4
