From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 11:32:38 +0200
Subject: [Buildroot] [git commit] microzed: u-boot needs host-dtc
Message-ID: <20151005093612.E77037FEB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e693a0734644ceb79b7b90c65b227fd0d73bf21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

defconfigs that use U-Boot 2015.07 need host-dtc to build
properly.

Signed-off-by: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/microzed_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configs/microzed_defconfig b/configs/microzed_defconfig
index 5a94275..989170c 100644
--- a/configs/microzed_defconfig
+++ b/configs/microzed_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_BOARDNAME="zynq_microzed"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
 BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/microzed/uboot"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
