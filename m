From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Mon, 21 Aug 2017 15:20:51 -0300
Subject: [Buildroot] [PATCH 1/2] configs/imx6q-sabresd_qt5: Remove
	BR2_TOOLCHAIN_BUILDROOT_GLIBC
Message-ID: <1503339652-7641-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

There is no need to select BR2_TOOLCHAIN_BUILDROOT_GLIBC, so just remove it.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6q-sabresd_qt5_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/imx6q-sabresd_qt5_defconfig b/configs/imx6q-sabresd_qt5_defconfig
index 0b4e961..801b256 100644
--- a/configs/imx6q-sabresd_qt5_defconfig
+++ b/configs/imx6q-sabresd_qt5_defconfig
@@ -10,7 +10,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 # Additional features needed for packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-- 
2.7.4
