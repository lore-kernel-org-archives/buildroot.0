From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 15:23:06 +0200
Subject: [Buildroot] [git commit master] u-boot: remove ancient 1.3.4 version
Message-ID: <20090901132355.13DCA774FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a0dd5517916f8f7f788ad3ee2a97a69f4385af27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/u-boot/Config.in |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index b3646c2..12a5543 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -36,10 +36,6 @@ config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
 	depends on BR2_DEPRECATED
 
-config BR2_TARGET_UBOOT_1_3_4
-	bool "u-boot-1.3.4"
-	depends on BR2_DEPRECATED
-
 config BR2_TARGET_UBOOT_1_2_0_ATMEL
 	bool "u-boot-1.2.0-atmel"
 	depends on BR2_TARGET_AT91
@@ -53,7 +49,6 @@ config BR2_UBOOT_VERSION
 	default "2009.03"	if BR2_TARGET_UBOOT_2009_03
 	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
 	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
-	default "1.3.4"		if BR2_TARGET_UBOOT_1_3_4
 	default "1.2.0-atmel"	if BR2_TARGET_UBOOT_1_2_0_ATMEL
 
 config BR2_U_BOOT_SITE
-- 
1.6.3.3
