From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:15 +0200
Subject: [Buildroot] [PATCH 27/29] configs: drop Qt/Qt5 license approval
	option
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <f8b920cacd315533540214ebb46d77724da92c01.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/beaglebone_qt5_defconfig      | 1 -
 configs/firefly_rk3288_demo_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index cdf8b96c15..b65ca40ec4 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -17,7 +17,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
 BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_QT5QUICKCONTROLS=y
diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
index c2de701934..0f4dd368c4 100644
--- a/configs/firefly_rk3288_demo_defconfig
+++ b/configs/firefly_rk3288_demo_defconfig
@@ -19,7 +19,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
 BR2_PACKAGE_QT5BASE_GUI=y
 BR2_PACKAGE_QT5BASE_EGLFS=y
-- 
2.11.0
