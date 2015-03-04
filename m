From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 19:42:56 +0100
Subject: [Buildroot] [git commit] configs/qemu_mips64el_malta_defconfig:
	don't force eglibc
Message-ID: <20150304184300.2DDAA817D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=642348c8c859dff78041815e0a908f27ebc8ab70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's not required, the toolchain options should handle that.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/qemu_mips64el_malta_defconfig |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

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
