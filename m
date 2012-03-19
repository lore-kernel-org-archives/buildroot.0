From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Mon, 19 Mar 2012 17:31:48 -0300
Subject: [Buildroot] [PATCH RESEND] Makefile: add help for the
	*-update-config and *-update-defconfig targets
In-Reply-To: <1332189109-23697-1-git-send-email-aletes.xgr@gmail.com>
References: <1332189109-23697-1-git-send-email-aletes.xgr@gmail.com>
Message-ID: <1332189109-23697-2-git-send-email-aletes.xgr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 30099d9..a4a44fb 100644
--- a/Makefile
+++ b/Makefile
@@ -671,13 +671,17 @@ help:
 	@echo '  allnopackageconfig     - New config where package options are answered with no'
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
+	@echo '  busybox-update-config  - Update BusyBox configuration'
 endif
 ifeq ($(BR2_LINUX_KERNEL),y)
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
 	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
+	@echo '  linux-update-config    - Update Linux kernel configuration'
+	@echo '  linux-update-defconfig - Update Linux kernel defconfig'
 endif
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
+	@echo '  uclibc-update-config   - Update uClibc configuration'
 endif
 ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 	@echo '  ctng-menuconfig        - Run crosstool-NG menuconfig'
-- 
1.7.9.1
