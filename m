From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:35 -0600
Subject: [Buildroot] [NEXT 20/26] linux: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-21-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5300b9c..7afd9b5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -7,6 +7,7 @@
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
 LINUX_LICENSE_FILES = COPYING
+LINUX_CPE_ID = $(LINUX_NAME):$(LINUX_NAME)_kernel:$(LINUX_VERSION)
 
 define LINUX_HELP_CMDS
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
-- 
1.9.1
