From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 17 Apr 2015 16:26:15 -0400
Subject: [Buildroot] [PATCH 3/3] altera: update use of
	BR2_TARGET_UBOOT_PATCH_DIR
In-Reply-To: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
References: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1429302375-12275-3-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use BR2_TARGET_UBOOT_PATCHES now that BR2_TARGET_UBOOT_PATCH_DIR is
deprecated.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 configs/altera_sockit_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index d27b96b..f9249ca 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
-BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/altera/sockit"
+BR2_TARGET_UBOOT_CUSTOM_PATCHES="board/altera/sockit/uboot-sockit-preloader-sample-design.patch"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
-- 
1.9.1
