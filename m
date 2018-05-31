From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Thu, 31 May 2018 13:21:33 +0000
Subject: [Buildroot] [PATCH v3 2/4] Revert "configs/stm32f469: force usage
 of binutils 2.28.x"
In-Reply-To: <1527772887-31616-1-git-send-email-christophe.priouzeau@st.com>
References: <1527772887-31616-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <1527772887-31616-2-git-send-email-christophe.priouzeau@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 12049cc8b8972a9d0f1e27f1382cc5752d45312f.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 configs/stm32f469_disco_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index e5cacaf..8b77d8c 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-BR2_BINUTILS_VERSION_2_28_X=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.7.4
