From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: remove reference to old
	1.2.0-atmel version
Message-ID: <20100614203436.0560980E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b116aff43428adbede513850902a397fa58d0a3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 466d4a0..4edef12 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -46,11 +46,7 @@ ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
 U_BOOT_TARGETS+=$(TARGET_DIR)/usr/sbin/fw_printenv
 endif
 
-U_BOOT_CONFIGURE_OPTS :=
-
-ifneq ($(BR2_TARGET_UBOOT_1_2_0_ATMEL),)
 U_BOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
-endif
 
 # Define a helper function
 define insert_define
-- 
1.7.1
