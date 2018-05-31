From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Thu, 31 May 2018 13:21:32 +0000
Subject: [Buildroot] [PATCH v3 1/4] Revert "configs/stm32f429: force usage
 of binutils 2.28.x"
Message-ID: <1527772887-31616-1-git-send-email-christophe.priouzeau@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit cbe43fd417d77f846f1ca47cdacd51a73be1aaec.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 configs/stm32f429_disco_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index fc167d0..5237e9a 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-BR2_BINUTILS_VERSION_2_28_X=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.7.4
