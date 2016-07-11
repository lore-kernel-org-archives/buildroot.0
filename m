From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 11 Jul 2016 17:43:06 -0300
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2016.07
In-Reply-To: <1468269786-23212-1-git-send-email-festevam@gmail.com>
References: <1468269786-23212-1-git-send-email-festevam@gmail.com>
Message-ID: <1468269786-23212-2-git-send-email-festevam@gmail.com>
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
index 2076b3b..cf27e90 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  87d02275615aaf0cd007b54cbe9fbadceef2bee7c79e6c323ea1ae8956dcb171  u-boot-2016.05.tar.bz2
+sha256  974fb7225c0af6a721307631f66b81e20dbda82a4d7cc32aba2a625727231253  u-boot-2016.07.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 4903f66..e7826bd 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2016.05
+UBOOT_TOOLS_VERSION = 2016.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
1.9.1
