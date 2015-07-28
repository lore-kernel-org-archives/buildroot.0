From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:30:37 +0200
Subject: [Buildroot] [git commit] configs/riotboard: bump u-boot to version
	2015.07
Message-ID: <20150728203050.0453581DF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c0f5c31737eb8dddd2c1db5ae5b36678847c40b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/riotboard_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 7d37c25..98fdd6f 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_VERSION="2015.04"
+BR2_TARGET_UBOOT_VERSION="2015.07"
 BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
