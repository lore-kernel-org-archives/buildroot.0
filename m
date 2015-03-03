From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 18:35:20 -0300
Subject: [Buildroot] [PATCH 2/2] configs/qemu_mips64el_malta_defconfig:
	don't force eglibc
In-Reply-To: <1425418520-23282-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425418520-23282-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425418520-23282-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not required, the toolchain options should handle that.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_mips64el_malta_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 8d3a132..8999e6c 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -2,9 +2,6 @@
 BR2_mips64el=y
 BR2_MIPS_NABI64=y
 
-# Toolchain
-BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
-
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.0.5
