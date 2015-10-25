From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 11:07:12 +0100
Subject: [Buildroot] [git commit] configs/riotboard: bump u-boot to version
	2015.10
Message-ID: <20151025100750.006B37F935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c70b19c97a6bea01425bbdaf88cbd839626077b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/riotboard_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 96c3619..7795787 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
 BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
