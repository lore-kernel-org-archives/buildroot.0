From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Oct 2009 15:44:52 +0100
Subject: [Buildroot] [git commit master] toolchain/gcc: remove unused
	(commented out) 4.3 snapshot
Message-ID: <20091029152013.3F2A57775A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c9816df8868f2b14feb970664b0cd941e58b1cf5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 774057e..dbc5645 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -64,11 +64,6 @@ choice
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.4.x"
-
-#	config BR2_GCC_VERSION_4_3
-#		depends on !BR2_avr32 && !BR2_nios2
-#		select BR2_GCC_IS_SNAP
-#		bool "gcc 4.3"
 endchoice
 
 config BR2_GCC_IS_SNAP
@@ -106,7 +101,6 @@ config BR2_GCC_VERSION
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
 	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
 	default "4.4.2"     if BR2_GCC_VERSION_4_4_X
-	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
-- 
1.6.3.3
